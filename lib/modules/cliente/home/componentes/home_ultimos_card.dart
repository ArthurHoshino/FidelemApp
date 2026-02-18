import 'package:flutter/material.dart';
import 'package:fidelem_app/core/tema/tema.dart';

class HomeUltimosCard extends StatelessWidget {

  final String title;
  final String subtitle;
  final String imagePath;

  HomeUltimosCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    final double finalHeight = screenHeight * 0.08;
    final double finalWidth = screenWidth * 0.9;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenHeight * 0.005),
      child: Container(
        width: finalWidth,
        height: finalHeight,
        decoration: BoxDecoration(
          color: Cor.azulClaro1,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                width: finalHeight * 0.7,
                height: finalHeight * 0.7,
                decoration: BoxDecoration(
                  color: Cor.azul,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                    errorBuilder: (c, e, s) => const Icon(Icons.image, color: Cor.branco),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenHeight * 0.018)),
                  Text(subtitle, style: TextStyle(color: Cor.cinzaClaro, fontSize: screenHeight * 0.014)),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 15),
              child: Icon(Icons.arrow_forward_ios, size: 16, color: Cor.cinzaClaro),
            )
          ],
        ),
      ),
    );
  }
}
