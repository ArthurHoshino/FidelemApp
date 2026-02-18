import 'package:flutter/material.dart';
import 'package:fidelem_app/core/widgets/fid_header.dart'; 
import 'package:fidelem_app/core/data/teste/cliente_loja_test_data.dart';
import 'package:fidelem_app/modules/cliente/comuns/fid_banner.dart';
import 'package:fidelem_app/modules/cliente/loja_pontos/componentes/loja_filtros.dart';
import 'package:fidelem_app/modules/cliente/loja_pontos/componentes/loja_produto_grid.dart';
import 'package:fidelem_app/modules/cliente/loja_pontos/loja_pontos_viewmodel.dart';

class LojaPontosView extends StatefulWidget {
  const LojaPontosView({super.key});

  @override
  State<LojaPontosView> createState() => _LojaPontosViewState();
}

class _LojaPontosViewState extends State<LojaPontosView> {
  final LojaPontosViewModel viewModel = LojaPontosViewModel();

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
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [

                  FIDHeader(),

                  const SizedBox(height: 10),
                  
                  FidBanner(items: ClienteLojaTestData.banners),
                  
                  LojaFiltros(
                    currentSort: viewModel.selectedSort,
                    onSortChanged: (val) => viewModel.setSort(val),
                    onFilterPressed: () {},
                  ),
                  
                  LojaProdutoGrid(
                    products: viewModel.products,
                    onUpdateCart: (id, change) async {
                      await viewModel.updateCart(id, change);
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}