import 'package:fidelem_app/core/data/models/entity.dart';
import 'package:fidelem_app/modules/cliente/home/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:fidelem_app/core/widgets/fid_text.dart';
import 'package:fidelem_app/core/tema/tema.dart';
import 'package:fidelem_app/modules/cliente/home/componentes/home_promocoes_card.dart';
import 'package:fidelem_app/core/services/cart_manager.dart';

class HomePromocoesGrid extends StatefulWidget {
  final List<ProdutoEntity> data;
  const HomePromocoesGrid({super.key, required this.data});

  @override
  State<HomePromocoesGrid> createState() => _HomePromocoesGridState();
}

class _HomePromocoesGridState extends State<HomePromocoesGrid> {
  final viewModel = HomeViewmodel();

  @override
  void initState() {
    super.initState();
    viewModel.init();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: Listenable.merge([viewModel, CartManager.instance]),
      builder: (context, child) {
        final listaPromocoes = viewModel.model.promocoes;
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
            if (listaPromocoes.isEmpty)
              const Center(child: Text("Nenhuma promoção disponível."))
            else
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: listaPromocoes.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15.0,
                  mainAxisSpacing: 15.0,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  final item = listaPromocoes[index];
                  final qty = CartManager.instance.getProductQuantity(item.id);
                  return HomePromocoesCard(
                    title: item.nome,
                    fullPrice: item.precoReal.toDouble(),
                    promoPrice: item.precoDesconto!.toDouble(),
                    imagePath: item.imagem,
                    quantidadeNoCarrinho: qty,
                    onTapAdd: () async {
                      await CartManager.instance.updateProductQuantity(item.id, 1);
                    },
                  );
                },
              ),
          ],
        );
      },
    );
  }
}