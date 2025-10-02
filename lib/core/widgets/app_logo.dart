import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    final double topPadding = screenHeight * 0.06;
    final double bottomPadding = screenHeight * 0.01;
    final double logoWidth = screenWidth * 0.25;
    final double logoHeight = screenHeight * 0.25;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: topPadding, bottom: bottomPadding),
              child: Image.asset(
                "lib/core/assets/registro/Logo_FidelemApp_1.png",
                width: logoWidth,
                height: logoHeight,
              )
            ),
            child,
          ],
        ),
      ),
    );
  }
}