import 'package:flutter/material.dart';
import 'package:fidelem_app/modules/loja_pontos/components/loja_produto_card.dart';

class LojaProductGrid extends StatelessWidget {
  final List<Produto> products;
  final Function(String productId, int change) onUpdateCart;

  const LojaProductGrid({
    super.key,
    required this.products,
    required this.onUpdateCart,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        childAspectRatio: 0.75, 
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final produto = products[index];

        return LojaProdutoCard(
          produto: produto,
          onUpdateCart: (change) => onUpdateCart(produto.id, change),
        );
      },
    );
  }
}