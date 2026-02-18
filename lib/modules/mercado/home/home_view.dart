import 'package:flutter/material.dart';
import 'package:fidelem_app/modules/mercado/home/componentes/home_header.dart';
import 'package:fidelem_app/modules/mercado/home/componentes/home_produto_grid.dart';
import 'package:fidelem_app/core/tema/tema.dart';
import 'package:fidelem_app/core/data/teste/mercado_home_test_data.dart';
import 'package:fidelem_app/routes.dart';

class HomeMercadoView extends StatefulWidget {

  final Function(int)? onPressed;
  const HomeMercadoView({super.key, this.onPressed});

  @override
  State<HomeMercadoView> createState() => _HomeMercadoViewState();
}

class _HomeMercadoViewState extends State<HomeMercadoView> {
  int currentIndex = 1;

  final List<Map<String, dynamic>> itensData = HomeMercadoTestData.itens;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Cor.branco,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeHeader(onPressed: (){
                  if (widget.onPressed != null) {
                    widget.onPressed!(1); 
                  } else {
                    Navigator.pushNamed(context, Routes.adicionarProdutoPage);
                  }
              }),
              const SizedBox(height: 20),
              HomeProdutoGrid(promotions: itensData),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }
}