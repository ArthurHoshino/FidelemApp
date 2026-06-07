import 'package:flutter/material.dart';
import 'package:fidelem_app/core/widgets/fid_text.dart';
import 'package:fidelem_app/modules/cliente/home/componentes/home_ultimos_card.dart';
import 'package:fidelem_app/core/tema/tema.dart';
import 'package:fidelem_app/modules/cliente/home/home_viewmodel.dart';
import 'package:fidelem_app/routes.dart';
import 'package:fidelem_app/core/data/models/entity.dart';

class HomeUltimosGrid extends StatelessWidget {
  final HomeViewmodel viewModel;
  const HomeUltimosGrid({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    final data = viewModel.model.ultimosBuscados;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        FIDText(
          baseText: "Últimos Buscados",
          preset: FIDText.medium,
          textAlign: TextAlign.left,
          color: Cor.preto,
          padding: const {"bottom": 0.0, "top": 0.0, "left": 0.0, "right": 0.0},
        ),
        if (data.isEmpty)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Center(
              child: Text(
                "Nenhum produto visualizado nos últimos 10 dias.",
                style: TextStyle(color: Cor.cinzaEscuro, fontSize: 13),
              ),
            ),
          )
        else
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: data.length,
            itemBuilder: (context, index) {
              final item = data[index];
              return Column(
                children: [
                  InkWell(
                    onTap: () {
                      final prod = item["produto"];
                      if (prod is ProdutoEntity) {
                        Navigator.of(context).pushNamed(
                          Routes.produtoDetalhePage,
                          arguments: prod,
                        ).then((_) {
                          viewModel.carregarDadosUltimosVisualizados();
                        });
                      }
                    },
                    child: HomeUltimosCard(
                      title: item["titulo"],
                      subtitle: item["subtitulo"],
                      imagePath: item["imagem"],
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              );
            },
          ),
      ],
    );
  }
}