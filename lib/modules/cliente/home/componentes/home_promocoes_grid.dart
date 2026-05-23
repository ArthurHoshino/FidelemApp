import 'package:fidelem_app/core/data/models/models.dart';
import 'package:flutter/material.dart';
import 'package:fidelem_app/core/widgets/fid_text.dart';
import 'package:fidelem_app/core/tema/tema.dart';
import 'package:fidelem_app/modules/cliente/home/componentes/home_promocoes_card.dart';

class HomePromocoesGrid extends StatelessWidget {
  final List<ProdutoModel> promocoes;
  final int Function(int produtoId) quantidadeNoCarrinho;
  final Future<void> Function(int produtoId) onAdicionarAoCarrinho;

  const HomePromocoesGrid({
    super.key,
    required this.promocoes,
    required this.quantidadeNoCarrinho,
    required this.onAdicionarAoCarrinho,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        FIDText(
          baseText: "Promoções",
          preset: FIDText.medium,
          textAlign: TextAlign.left,
          color: Cor.cinzaEscuro,
          padding: const {
            "bottom": 0.0,
            "top": 0.0,
            "left": 0.0,
            "right": 0.0
          },
        ),
        const SizedBox(height: 12),
        if (promocoes.isEmpty)
          const Center(child: Text("Nenhuma promoção disponível."))
        else
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: promocoes.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15.0,
              mainAxisSpacing: 15.0,
              childAspectRatio: 0.7,
            ),
            itemBuilder: (context, index) {
              final item = promocoes[index];
              final qtd = quantidadeNoCarrinho(item.id);

              return HomePromocoesCard(
                title: item.nome,
                fullPrice: item.precoReal,
                promoPrice: item.precoDesconto ?? 0,
                imagePath: item.imagem,
                quantidadeNoCarrinho: qtd,
                onAdicionarAoCarrinho: () => onAdicionarAoCarrinho(item.id),
              );
            },
          ),
      ],
    );
  }
}
