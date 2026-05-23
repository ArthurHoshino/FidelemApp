import 'package:flutter/material.dart';
import 'package:fidelem_app/core/widgets/fid_header.dart';
import 'package:fidelem_app/modules/cliente/home/componentes/home_ultimos_grid.dart';
import 'package:fidelem_app/modules/cliente/home/componentes/home_promocoes_grid.dart';
import 'package:fidelem_app/modules/cliente/comuns/fid_banner.dart';
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
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListenableBuilder(
          listenable: viewModel,
          builder: (context, child) {
            final model = viewModel.model;

            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FIDHeader(),
                  const SizedBox(height: 10),
                  FidBanner(
                    items: model.banners,
                    heightFactor: 0.25,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: HomeUltimosGrid(data: model.ultimosBuscados),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: HomePromocoesGrid(
                      promocoes: model.promocoes,
                      quantidadeNoCarrinho: viewModel.quantidadeNoCarrinho,
                      onAdicionarAoCarrinho: viewModel.adicionarAoCarrinho,
                    ),
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
