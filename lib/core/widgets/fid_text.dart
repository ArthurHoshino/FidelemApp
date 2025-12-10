import "package:flutter/material.dart";
import 'package:flutter/gestures.dart';

class FIDText extends StatelessWidget {

  static String defaultBaseText = "";
  static String defaultLinkText = "";
  static double defaultFontSize = 0.05;
  static FontWeight defaultFontWeight = FontWeight.normal;
  static Color defaultColor = Color.fromARGB(255, 255, 0, 0);
  static Map<String, double> defaultPadding = {
    "top": 0.05,
    "bottom": 0.05,
    "right": 0.05,
    "left": 0.05,
  };
  static String defaultRoute = "";
  static bool defaultLinkFirst = false;
  static TextAlign defaultTextAlign = TextAlign.center;

  static Map<String, dynamic> large = {
    "baseText": "",
    "linkText": "",
    "fontSize": 0.03,
    "fontWeight": FontWeight.w900,
    "color": Color.fromARGB(255, 48, 48, 48),
    "padding": {
      "top": 0.00,
      "bottom": 0.07,
      "right": 0.00,
      "left": 0.00,
    },
    "route": "",
    "linkFirst": false,
    "textAlign": TextAlign.center
  };

  static Map<String, dynamic> medium = {
    "baseText": "",
    "linkText": "",
    "fontSize": 0.015, 
    "fontWeight": FontWeight.bold, 
    "color": Color.fromARGB(255, 175, 175, 175), 
    "padding": {
      "top": 0.00,
      "bottom": 0.01,
      "right": 0.00,
      "left": 0.00,
    },
    "route": "",
    "linkFirst": false,
    "textAlign": TextAlign.center
  };

  static Map<String, dynamic> small = {
    "baseText": "",
    "linkText": "",
    "fontSize": 0.01, 
    "fontWeight": FontWeight.bold, 
    "color": Color.fromARGB(255, 173, 173, 173), 
    "padding": {
      "top": 0.00,
      "bottom": 0.01,
      "right": 0.00,
      "left": 0.00,
    },
    "route": "",
    "linkFirst": false,
    "textAlign": TextAlign.center
  };

  static Map<String, dynamic> link = {
    "baseText": "",
    "linkText": "",
    "fontSize": 0.015, 
    "fontWeight": FontWeight.bold, 
    "color": Color.fromARGB(255, 175, 175, 175), 
    "padding": {
      "top": 0.00,
      "bottom": 0.01,
      "right": 0.00,
      "left": 0.00,
    },
    "route": "",
    "linkFirst": false,
    "textAlign": TextAlign.center
  };

  final String baseText;
  final String linkText;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final Map<String, double> padding;
  final String route;
  final bool linkFirst;
  final TextAlign textAlign;

  FIDText({
    super.key,
    String? baseText,
    String? linkText,
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    Map<String, double>? padding,
    String? route,
    bool? linkFirst,
    Map<String, dynamic>? preset, 
    TextAlign? textAlign,
  }) : baseText = baseText ?? (preset?["baseText"] as String? ?? defaultBaseText),
        linkText = linkText ?? (preset?["linkText"] as String? ?? defaultLinkText),
        fontSize = fontSize ?? (preset?["fontSize"] as double? ?? defaultFontSize),
        fontWeight = fontWeight ?? (preset?["fontWeight"] as FontWeight? ?? defaultFontWeight),
        color = color ?? (preset?["color"] as Color? ?? defaultColor),
        padding = padding ?? (preset?["padding"] as Map<String, double>? ?? defaultPadding),
        route = route ?? (preset?["route"] as String ? ?? defaultRoute),
        linkFirst = linkFirst ?? (preset?["linkFirst"] as bool? ?? defaultLinkFirst),
        textAlign = textAlign ?? (preset?["textAlign"] as TextAlign? ?? defaultTextAlign);

 @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    final double finalFontSize = fontSize * screenHeight;
    final EdgeInsets finalPadding = EdgeInsets.only(
      top: (padding["top"] ?? 0.0) * screenHeight, 
      bottom: (padding["bottom"] ?? 0.0) * screenHeight, 
      right: (padding["right"] ?? 0.0) * screenWidth, 
      left: (padding["left"] ?? 0.0) * screenWidth
    );
    List<TextSpan> children = [];

    if (baseText.isNotEmpty) {
      children.add(
        TextSpan(
          text: baseText,
          style: TextStyle(
            color: color,
            fontWeight: fontWeight,
            fontSize: finalFontSize,
          ),
        ),
      );
    }

    if (linkText.isNotEmpty) {
      children.add(
        TextSpan(
          text: linkText,
          style: TextStyle(
            color: Colors.blue,
            fontWeight: fontWeight,
            fontSize: finalFontSize,
          ),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              if (route.isNotEmpty) {
                Navigator.pushNamed(context, route);
              }
            },
        ),
      );
    }

    if (linkFirst) {
      children = children.reversed.toList();
    }

    return Padding(
      padding: finalPadding,
      child: RichText(
        text: TextSpan(
          children: children,
        ),
      ),
    );
  }
}