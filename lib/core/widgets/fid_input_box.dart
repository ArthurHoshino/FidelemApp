import "package:flutter/material.dart";

class FIDInputBox extends StatelessWidget {

  static String defaultText = "";
  static double defaultWidth = 0.01;
  static double defaultHeight = 0.01;
  static double defaultBorderRadius = 20.0;
  static Color defaultBorderColor = Color.fromARGB(255, 175, 175, 175);
  static Color defaultTextColor = Color.fromARGB(255, 175, 175, 175);
  static Map<String, double> defaultPadding = {
    "top": 0.05,
    "bottom": 0.05,
    "right": 0.05,
    "left": 0.05,
  };

  static Map<String, dynamic> medium = {
    "text": "", 
    "width": 0.7, 
    "height": 0.05,
    "borderRadius": 10.0,
    "borderColor": Color.fromARGB(255, 175, 175, 175),
    "textColor": Color.fromARGB(255, 175, 175, 175),
    "padding": {
      "top": 0.00,
      "bottom": 0.02,
      "right": 0.00,
      "left": 0.00,
    },
  };

  final String text;
  final double width;
  final double height;
  final double borderRadius;
  final Color borderColor;
  final Color textColor;
  final Map<String, double> padding;
  final TextEditingController? controller;
  final bool obscureText;

 FIDInputBox({
  super.key,
  String? text,
  double? width,
  double? height,
  double? borderRadius,
  Color? borderColor,
  Color? textColor,
  Map<String, double>? padding,
  Map<String, dynamic>? preset,
  this.controller,
  this.obscureText = false,
}) : text = text ?? (preset?["text"] as String? ?? defaultText),
      width = width ?? (preset?["width"] as double? ?? defaultWidth),
      height = height ?? (preset?["height"] as double? ?? defaultHeight),
      borderColor = borderColor ?? (preset?["borderColor"] as Color? ?? defaultBorderColor),
      textColor = textColor ?? (preset?["textColor"] as Color? ?? defaultTextColor),
      borderRadius = borderRadius ?? (preset?["borderRadius"] as double? ?? defaultBorderRadius),
      padding = padding ?? (preset?["padding"] as Map<String, double>? ?? defaultPadding);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    final double finalWidth = screenWidth * width;
    final double finalHeight = screenHeight * height;
    final EdgeInsets finalPadding = EdgeInsets.only(
      top: (padding["top"] ?? 0.0) * screenHeight, 
      bottom: (padding["bottom"] ?? 0.0) * screenHeight, 
      right: (padding["right"] ?? 0.0) * screenWidth, 
      left: (padding["left"] ?? 0.0) * screenWidth
    );
    return Padding(
      padding: finalPadding,
      child: SizedBox(
        width: finalWidth,
        height: finalHeight,
        child: TextFormField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor, width: 2),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            labelText: text,
            labelStyle: TextStyle(color: textColor),
            contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          ),
        )
      )
    );
  }
}