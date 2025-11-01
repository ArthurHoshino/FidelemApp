import 'package:flutter/material.dart';
import 'package:fidelem_app/core/widgets/fid_text.dart';

class ConfigView extends StatelessWidget {
  const ConfigView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FIDText(baseText: "Configurações", preset: FIDText.large, textAlign: TextAlign.start),
      ),
      body: Center(
        child: FIDText(
          baseText: "Configurações - Em Desenvolvimento",
          preset: FIDText.medium,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

