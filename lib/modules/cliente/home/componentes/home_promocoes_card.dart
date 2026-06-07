import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fidelem_app/core/tema/tema.dart';

class HomePromocoesCard extends StatelessWidget {
  final String title;
  final double fullPrice;
  final double promoPrice;
  final String? imagePath;

  final VoidCallback? onTapAdd;
  final int quantidadeNoCarrinho;

  const HomePromocoesCard({
    super.key,
    required this.title,
    required this.fullPrice,
    required this.promoPrice,
    this.imagePath,
    this.onTapAdd,
    this.quantidadeNoCarrinho = 0,
  });

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        color: Cor.branco,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Cor.preto.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                child: _buildImage(imagePath),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: screenHeight * 0.016,
                      fontWeight: FontWeight.w500,
                      color: Cor.cinzaEscuro,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (promoPrice > 0)
                            Text(
                              "R\$ ${promoPrice.toStringAsFixed(2)}",
                              style: TextStyle(
                                fontSize: screenHeight * 0.018,
                                fontWeight: FontWeight.bold,
                                color: Cor.azul,
                              ),
                            ),
                          Text(
                            'R\$ ${fullPrice.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontSize: promoPrice > 0 ? screenHeight * 0.014 : screenHeight * 0.018,
                              fontWeight: promoPrice > 0 ? FontWeight.normal : FontWeight.bold,
                              color: promoPrice > 0 ? Cor.cinzaClaro : Cor.preto,
                              decoration: promoPrice > 0 ? TextDecoration.lineThrough : null,
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: onTapAdd,
                        borderRadius: BorderRadius.circular(100),
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                            color: Cor.azulClaro1,
                            shape: BoxShape.circle,
                          ),
                          child: quantidadeNoCarrinho > 0
                              ? SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: Center(
                                    child: Text(
                                      "$quantidadeNoCarrinho",
                                      style: const TextStyle(
                                        color: Cor.azul,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                )
                              : const Icon(Icons.add, size: 20, color: Cor.azul),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImage(String? path) {
    if (path == null || path.isEmpty) {
      return const Icon(Icons.image, size: 40, color: Cor.cinzaClaro);
    }
    if (path.startsWith('assets/')) {
      return Image.asset(
        path,
        fit: BoxFit.contain,
      );
    }
    try {
      return Image.memory(
        base64Decode(path),
        fit: BoxFit.contain,
      );
    } catch (_) {
      return const Icon(Icons.image_not_supported, size: 40, color: Cor.cinzaClaro);
    }
  }
}
