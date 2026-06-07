import 'package:flutter/material.dart';
import 'package:fidelem_app/core/widgets/fid_header.dart'; 
import 'package:fidelem_app/core/data/teste/cliente_loja_test_data.dart';
import 'package:fidelem_app/modules/cliente/comuns/fid_banner.dart';
import 'package:fidelem_app/modules/cliente/loja_pontos/componentes/loja_filtros.dart';
import 'package:fidelem_app/modules/cliente/loja_pontos/componentes/loja_produto_grid.dart';
import 'package:fidelem_app/core/tema/tema.dart';
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
              padding: const EdgeInsets.only(bottom: 24),
              child: Column(
                children: [

                  FIDHeader(),

                  const SizedBox(height: 10),
                  
                  FidBanner(items: ClienteLojaTestData.banners),

                  // Barra de busca por nome do produto
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    child: TextField(
                      onChanged: (val) => viewModel.setSearchQuery(val),
                      decoration: InputDecoration(
                        hintText: "Buscar produto pelo nome...",
                        hintStyle: const TextStyle(color: Cor.cinzaClaro),
                        prefixIcon: const Icon(Icons.search, color: Cor.azul),
                        filled: true,
                        fillColor: Cor.azulClaro1,
                        contentPadding: const EdgeInsets.symmetric(vertical: 12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(color: Cor.azul, width: 1.5),
                        ),
                      ),
                    ),
                  ),

                  // Horizontal Category selector chips
                  if (viewModel.categories.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: SizedBox(
                        height: 40,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          itemCount: viewModel.categories.length + 1,
                          itemBuilder: (context, index) {
                            final bool isAll = index == 0;
                            final dynamic category = isAll ? null : viewModel.categories[index - 1];
                            final String name = isAll ? "Todos" : (category["CDCATNOME"] ?? "");
                            final int? catId = isAll ? null : category["CDCATID"];
                            final bool isSelected = viewModel.selectedCategoryId == catId;

                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4.0),
                              child: ChoiceChip(
                                showCheckmark: false,
                                label: Text(
                                  name,
                                  style: TextStyle(
                                    color: isSelected ? Cor.branco : Cor.azul,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                selected: isSelected,
                                selectedColor: Cor.azul,
                                backgroundColor: Cor.azulClaro1,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  side: BorderSide(
                                    color: isSelected ? Cor.azul : Cor.transparente,
                                  ),
                                ),
                                onSelected: (_) {
                                  viewModel.setSelectedCategory(catId);
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  
                  LojaFiltros(
                    currentSort: viewModel.selectedSort,
                    onSortChanged: (val) => viewModel.setSort(val),
                    onFilterPressed: () {
                      // Reset filters
                      viewModel.setSearchQuery('');
                      viewModel.setSelectedCategory(null);
                    },
                  ),

                  if (viewModel.products.isEmpty)
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
                      child: Center(
                        child: Text(
                          "Nenhum produto encontrado para os filtros selecionados.",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Cor.cinzaEscuro, fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  else
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