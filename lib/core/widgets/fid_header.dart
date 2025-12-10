import 'package:flutter/material.dart';
import 'package:fidelem_app/core/widgets/fid_text.dart';

class FIDHeader extends StatelessWidget {
  const FIDHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: SizedBox(
        height: 50,
        child: Stack(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage("lib/core/assets/registro/Logo_FidelemApp_2.png"),
                backgroundColor: Colors.transparent,
              ),
            ),

            Center(
              child: FIDText(
                baseText: "Fidelem App",
                preset: FIDText.medium,
                textAlign: TextAlign.center,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                padding: const {"top": 0, "bottom": 0, "left": 0, "right": 0},
              ),
            ),
          ],
        ),
      ),
    );
  }
}