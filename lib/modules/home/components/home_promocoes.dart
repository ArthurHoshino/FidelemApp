import 'package:flutter/material.dart';

class HomePromocoes extends StatelessWidget {
  static Map<String, dynamic> defaultStyle = {
    "height": 0.22,
    "width": 0.42,
    "backgroundColor": const Color.fromRGBO(240, 246, 255, 1),
    "borderRadius": 16.0,
  };

  final String title;
  final String price;
  final String imagePath;
  final double height;
  final double width;
  final Color backgroundColor;
  final double borderRadius;

  HomePromocoes({
    super.key,
    required this.title,
    required this.price,
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

    return Container(
      width: screenWidth * width,
      height: screenHeight * height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
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
                  errorBuilder: (c, e, s) => Icon(Icons.image, size: 40, color: const Color.fromRGBO(33, 150, 243, 1).withOpacity(0.3)),
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
                  Text(title, style: TextStyle(fontSize: screenHeight * 0.016, color: const Color.fromRGBO(0, 0, 0, 0.867)), overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(price, style: TextStyle(fontSize: screenHeight * 0.018, fontWeight: FontWeight.bold, color: const Color.fromRGBO(0, 0, 0, 1))),
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(color: const Color.fromRGBO(33, 150, 243, 1).withOpacity(0.1), shape: BoxShape.circle),
                        child: const Icon(Icons.add, size: 16, color: Color.fromRGBO(33, 150, 243, 1)),
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