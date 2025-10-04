import 'package:flutter/material.dart';

class FIDButton extends StatelessWidget {

  static VoidCallback defaultOnPressed = () { print("Teste"); };
  static String defaultText = "";
  static double defaultWidth = 0.01;
  static double defaultHeight = 0.01;
  static double defaultBorderRadius = 20.0;
  static Color defaultBorderColor = Color.fromARGB(255, 255, 0, 0);
  static Color defaultBGColor = Color.fromARGB(255, 255, 0, 0);
  static Color defaultTextColor = Color.fromARGB(255, 255, 0, 0);
  static Map<String, double> defaultPadding = {
    "top": 0.05,
    "bottom": 0.05,
    "right": 0.05,
    "left": 0.05,
  };

  static Map<String, dynamic> medium = {
    "onPressed": null,
    "text": "",
    "width": 0.6,
    "height": 0.05,
    "borderRadius": 10.0,
    "borderColor": Color.fromARGB(255, 37, 106, 255),
    "BGColor": Color.fromARGB(255, 37, 106, 255),
    "textColor": Color.fromARGB(255, 255, 255, 255),
    "padding": {
      "top": 0.00,
      "bottom": 0.05,
      "right": 0.00,
      "left": 0.00,
    },
  };

  final VoidCallback onPressed;
  final String text;
  final double width;
  final double height;
  final double borderRadius;
  final Color borderColor;
  final Color BGColor;
  final Color textColor;
  final Map<String, double> padding;

  FIDButton({
    super.key,
    VoidCallback? onPressed,
    String? text,
    double? width,
    double? height,
    double? borderRadius,
    Color? borderColor,
    Color? BGColor,
    Color? textColor,
    Map<String, double>? padding,
    Map<String, dynamic>? preset,
  }) : onPressed = onPressed ?? (preset?["onPressed"] as VoidCallback? ?? defaultOnPressed),
        text = text ?? (preset?["text"] as String? ?? defaultText),
        width = width ?? (preset?["width"] as double? ?? defaultWidth),
        height = height ?? (preset?["height"] as double? ?? defaultHeight),
        borderRadius = borderRadius ?? (preset?["borderRadius"] as double? ?? defaultBorderRadius),
        borderColor = borderColor ?? (preset?["borderColor"] as Color? ?? defaultBorderColor),
        BGColor = BGColor ?? (preset?["BGColor"] as Color? ?? defaultBGColor),
        textColor = textColor ?? (preset?["textColor"] as Color? ?? defaultTextColor),
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
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: BGColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            side: BorderSide(
              color: borderColor,
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
            ),
          ),
        )
      )
    );
  }
}