import 'package:flutter/material.dart';
import 'package:fidelem_app/core/tema/tema.dart';

class HomeProdutoCard extends StatelessWidget {
  final Map<String, dynamic> item;
  const HomeProdutoCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      decoration: BoxDecoration(
        color: Cor.azulClaro1,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: Cor.branco,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.image, size: 32, color: Cor.azul),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item["title"]!,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13.5),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(fontSize: 12.5, fontWeight: FontWeight.w600, color: Cor.preto),
                      children: [
                        TextSpan(text: "${item["price"]} | "),
                        TextSpan(text: item["points"], style: const TextStyle(color: Cor.vermelho)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}