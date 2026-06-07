import 'package:flutter/material.dart';
import 'home_produto_card.dart';

class HomeProdutoGrid extends StatelessWidget {
  final List<Map<String, dynamic>> promotions;
  final VoidCallback? onDelete;

  const HomeProdutoGrid({
    super.key,
    required this.promotions,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    if (promotions.isEmpty) {
      return const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: Center(
          child: Column(
            children: [
              Icon(
                Icons.inventory_2_outlined,
                size: 60,
                color: Colors.grey,
              ),
              SizedBox(height: 12),
              Text(
                "Nenhum produto encontrado",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      );
    }

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
          childAspectRatio: 0.85,
        ),
        itemBuilder: (context, index) => HomeProdutoCard(
          item: promotions[index],
          onDelete: onDelete,
        ),
      ),
    );
  }
}