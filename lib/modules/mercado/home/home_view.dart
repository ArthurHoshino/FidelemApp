import 'package:flutter/material.dart';
import 'package:fidelem_app/modules/mercado/home/componentes/home_header.dart';
import 'package:fidelem_app/modules/mercado/home/componentes/home_produto_grid.dart';
import 'package:fidelem_app/core/tema/tema.dart';
import 'package:fidelem_app/modules/mercado/home/home_viewmodel.dart';

class HomeMercadoView extends StatefulWidget {
  final Function(int)? onPressed;

  const HomeMercadoView({super.key, this.onPressed});

  @override
  State<HomeMercadoView> createState() => HomeMercadoViewState();
}

class HomeMercadoViewState extends State<HomeMercadoView> {
  final HomeMercadoViewModel viewModel = HomeMercadoViewModel();

  List<Map<String, dynamic>> itensData = [];
  bool isLoading = false;

  Future<void> iniciarTela() async {

    setState(() {
      isLoading = true;
    });

    await viewModel.carregarCategorias();
    await viewModel.carregarItens();

    if (!mounted) return;

    setState(() {
      itensData = viewModel.itensFiltrados;
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();

    iniciarTela();
  }

  Future<void> recarregar() async {

    setState(() {
      isLoading = true;
    });

    await viewModel.carregarItens();
    await viewModel.carregarCategorias();
    if (!mounted) return;

    setState(() {
      itensData = viewModel.itensFiltrados;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Cor.branco,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: recarregar,
          child: isLoading
              ? const Center(
            child: CircularProgressIndicator(),
          )
              : SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeHeader(
                  viewModel: viewModel,
                  onPressed: () {
                    if (widget.onPressed != null) {
                      widget.onPressed!(1);
                    }
                  },

                  onCategoriaChanged: (categoria) {

                    viewModel.filtrarCategoria(categoria);

                    setState(() {
                      itensData = viewModel.itensFiltrados;
                    });

                  },
                ),
                const SizedBox(height: 20),

                HomeProdutoGrid(
                  promotions: itensData,
                  onDelete: recarregar,
                ),

                const SizedBox(height: 80),
              ],
            ),
          ),
        ),
      ),
    );
  }
}