import 'package:flutter/material.dart';

class FIDLine extends StatelessWidget {

  static double defaultWidth = 0.01;
  static double defaultHeight = 1.0;
  static Color defaultColor = Color.fromARGB(255, 255, 0, 0);
  static Map<String, double> defaultPadding = {
    "top": 0.05,
    "bottom": 0.05,
    "right": 0.05,
    "left": 0.05,
  };

  static Map<String, dynamic> small = {
    "width": 0.8, 
    "height": 1.0,
    "color": Color.fromARGB(255, 214, 214, 214),
    "padding": {
      "top": 0.00,
      "bottom": 0.01,
      "right": 0.00,
      "left": 0.00,
    },
  };

  final double width;
  final double height;
  final Color color;
  final Map<String, dynamic> padding;

  FIDLine({
  super.key,
  double? width,
  double? height,
  Color? color,
  Map<String, dynamic>? padding,
  Map<String, dynamic>? preset,
}) : width = width ?? (preset?["width"] as double? ?? defaultWidth),
      height = height ?? (preset?["height"] as double? ?? defaultHeight),
      color = color ?? (preset?["color"] as Color? ?? defaultColor),
      padding = padding ?? (preset?["padding"] as Map<String, dynamic>? ?? defaultPadding);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    final double finalWidth = screenWidth * width;
    final double finalHeight = height;
    final EdgeInsets finalPadding = EdgeInsets.only(
      top: (padding["top"] ?? 0.0) * screenHeight, 
      bottom: (padding["bottom"] ?? 0.0) * screenHeight, 
      right: (padding["right"] ?? 0.0) * screenWidth, 
      left: (padding["left"] ?? 0.0) * screenWidth
    );
    return Padding(
      padding: finalPadding,
      child: Container(
        width: finalWidth,
        height: finalHeight,
        color: color,
      )
    );
  }
}