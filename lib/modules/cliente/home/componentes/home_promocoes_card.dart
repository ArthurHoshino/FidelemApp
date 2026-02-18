import 'package:flutter/material.dart';
import 'package:fidelem_app/core/tema/tema.dart';

class HomePromocoesCard extends StatelessWidget {

  final String title;
  final String price;
  final String imagePath;

  HomePromocoesCard({
    super.key,
    required this.title,
    required this.price,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth * 0.22,
      height: screenHeight * 0.42,
      decoration: BoxDecoration(
        color: Cor.branco,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.contain,
                  errorBuilder: (c, e, s) => Icon(Icons.image, size: 40, color: Cor.azul),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(title, style: TextStyle(fontSize: screenHeight * 0.016, color: Cor.preto), overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(price, style: TextStyle(fontSize: screenHeight * 0.018, fontWeight: FontWeight.bold, color: Cor.preto)),
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(color: Cor.azulClaro1, shape: BoxShape.circle),
                        child: const Icon(Icons.add, size: 16, color: Cor.azul),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}