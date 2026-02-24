import 'package:flutter/material.dart';
import 'home_produto_card.dart';

class HomeProdutoGrid extends StatelessWidget {
  final List<Map<String, dynamic>> promotions;
  const HomeProdutoGrid({super.key, required this.promotions});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: promotions.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.95,
        ),
        itemBuilder: (context, index) => HomeProdutoCard(item: promotions[index]),
      ),
    );
  }
}