import 'package:fidelem_app/modules/mercado/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:fidelem_app/core/widgets/fid_bottom_nav.dart';
import 'package:fidelem_app/routes.dart';

class NavConfig {
  final List<String> routes;
  final List<IconData> icons;

  NavConfig({required this.routes, required this.icons});

  // Configuração para Mercado
  static NavConfig mercado = NavConfig(
    routes: [
      Routes.homeMercadoPage,
      Routes.adicionarProdutoPage,
      Routes.editarProdutoPage,
      Routes.configPage,
    ],
    icons: [Icons.home, Icons.add_box, Icons.edit, Icons.settings],
  );

  // Configuração para Cliente
  static NavConfig cliente = NavConfig(
    routes: [
      Routes.homeClientePage,
      Routes.lojaPontosPage,
      Routes.carrinhoPage,
      Routes.configPage,
    ],
    icons: [Icons.home, Icons.shopping_bag, Icons.shopping_cart, Icons.person],
  );
}

class BaseView extends StatefulWidget {
  const BaseView({super.key});

  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  int currentIndex = 0;
  late PageController pageController;
  late NavConfig currentConfig;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: currentIndex);
    
    // M = mercado else cliente
    final usuario = 'Ma';

    if (usuario == 'M') {
      currentConfig = NavConfig.mercado;
    } else {
      currentConfig = NavConfig.cliente;
    }
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void onPageChange(int index) {
    setState(() {
      currentIndex = index;
      pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> views = currentConfig.routes.map((routeName) {
      final builder = Routes.rotas[routeName];
      if (routeName == Routes.homeMercadoPage) {
        return HomeMercadoView(onPressed: onPageChange); 
      }
      if (builder != null) {
        return builder(context);
      }
      return Center(child: Text("Rota não encontrada: $routeName"));
    }).toList();

    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: const AlwaysScrollableScrollPhysics(),
        onPageChanged: (index) {
          setState(() => currentIndex = index);
        },
        children: views,
      ),
      bottomNavigationBar: SafeArea(
        child: FIDBottomNavBar(
          currentIndex: currentIndex,
          onTap: onPageChange,
          icons: currentConfig.icons,
        ),
      ),
    );
  }
}