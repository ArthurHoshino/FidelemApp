import 'package:fidelem_app/core/data/models/entity.dart';
import 'package:flutter/material.dart';
import 'package:fidelem_app/core/widgets/fid_header.dart';
import 'package:fidelem_app/modules/cliente/home/componentes/home_ultimos_grid.dart';
import 'package:fidelem_app/modules/cliente/home/componentes/home_promocoes_grid.dart';
import 'package:fidelem_app/modules/cliente/comuns/fid_banner.dart';
import 'package:fidelem_app/core/data/teste/cliente_home_test_data.dart';

class HomeClienteView extends StatelessWidget {
  const HomeClienteView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> bannersData = HomeClienteTestData.banners;
    final List<Map<String, dynamic>> buscadosData = HomeClienteTestData.ultimosBuscados;
    final List<ProdutoEntity> promocoesData = HomeClienteTestData.promocoes;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              FIDHeader(),

              const SizedBox(height: 10),

              FidBanner(
                items: bannersData,
                heightFactor: 0.25,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: HomeUltimosGrid(data: buscadosData),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: HomePromocoesGrid(data: promocoesData),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}