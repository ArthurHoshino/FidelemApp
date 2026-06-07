import 'package:flutter/material.dart';
import 'package:fidelem_app/core/widgets/fid_header.dart';
import 'package:fidelem_app/modules/cliente/home/componentes/home_ultimos_grid.dart';
import 'package:fidelem_app/modules/cliente/home/componentes/home_promocoes_grid.dart';
import 'package:fidelem_app/modules/cliente/comuns/fid_banner.dart';
import 'package:fidelem_app/core/data/teste/cliente_home_test_data.dart';
import 'package:fidelem_app/modules/cliente/home/home_viewmodel.dart';

class HomeClienteView extends StatefulWidget {
  const HomeClienteView({super.key});

  @override
  State<HomeClienteView> createState() => _HomeClienteViewState();
}

class _HomeClienteViewState extends State<HomeClienteView> {
  final HomeViewmodel viewModel = HomeViewmodel();

  @override
  void initState() {
    super.initState();
    viewModel.init();
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> bannersData = HomeClienteTestData.banners;

    return Scaffold(
      body: SafeArea(
        child: ListenableBuilder(
          listenable: viewModel,
          builder: (context, child) {
            return SingleChildScrollView(
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
                    child: HomeUltimosGrid(viewModel: viewModel),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: HomePromocoesGrid(viewModel: viewModel),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}