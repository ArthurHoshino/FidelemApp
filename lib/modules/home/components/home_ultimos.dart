import 'package:flutter/material.dart';

class HomeUltimos extends StatelessWidget {
  static Map<String, dynamic> defaultStyle = {
    "height": 0.08,
    "width": 0.9,
    "backgroundColor": const Color.fromRGBO(240, 246, 255, 1),
    "borderRadius": 12.0,
    "padding": {"top": 0.005, "bottom": 0.005},
  };

  final String title;
  final String subtitle;
  final String imagePath;
  final double height;
  final double width;
  final Color backgroundColor;
  final double borderRadius;

  HomeUltimos({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    double? height,
    double? width,
    Color? backgroundColor,
    double? borderRadius,
    Map<String, dynamic>? preset,
  })  : height = height ?? (preset?["height"] as double? ?? defaultStyle["height"]),
        width = width ?? (preset?["width"] as double? ?? defaultStyle["width"]),
        backgroundColor = backgroundColor ?? (preset?["backgroundColor"] as Color? ?? defaultStyle["backgroundColor"]),
        borderRadius = borderRadius ?? (preset?["borderRadius"] as double? ?? defaultStyle["borderRadius"]);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    final double finalHeight = screenHeight * height;
    final double finalWidth = screenWidth * width;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenHeight * 0.005),
      child: Container(
        width: finalWidth,
        height: finalHeight,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                width: finalHeight * 0.7,
                height: finalHeight * 0.7,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(33, 150, 243, 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                    errorBuilder: (c, e, s) => const Icon(Icons.image, color: Color.fromRGBO(255, 255, 255, 1)),
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
                  Text(subtitle, style: TextStyle(color: const Color.fromRGBO(158, 158, 158, 1), fontSize: screenHeight * 0.014)),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 15),
              child: Icon(Icons.arrow_forward_ios, size: 16, color: Color.fromRGBO(158, 158, 158, 1)),
            )
          ],
        ),
      ),
    );
  }
}