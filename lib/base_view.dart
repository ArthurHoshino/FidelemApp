import 'package:fidelem_app/modules/Config/config_view.dart';
import 'package:flutter/material.dart';
import 'package:fidelem_app/core/widgets/fid_bottom_nav.dart';
import 'package:fidelem_app/modules/home/home_view.dart';
import 'package:fidelem_app/modules/loja_pontos/loja_pontos_view.dart';
import 'package:fidelem_app/modules/carrinho/carrinho_view.dart';

class BaseView extends StatefulWidget {
  const BaseView({super.key});

  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  int _currentIndex = 0; 
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  final List<Widget> _views = [
    const HomeViewCliente(),
    const LojaPontosView(),
    const CarrinhoView(),
    const SettingsView()
  ];

  void _onPageChange(int index) {
    setState(() {
      _currentIndex = index;
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const AlwaysScrollableScrollPhysics(), 
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: _views,
      ),
      bottomNavigationBar: FIDBottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onPageChange,
      ),
    );
  }
}