import 'package:flutter/material.dart';
import 'package:fidelem_app/core/widgets/fid_text.dart';

class ConfigView extends StatelessWidget {
  const ConfigView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),

              const SizedBox(height: 10),

              FIDText(
                baseText: "Configurações",
                preset: FIDText.large,
                textAlign: TextAlign.left,
              ),

              const SizedBox(height: 20),

              // Conteúdo
              Center(
                child: FIDText(
                  baseText: "Configurações - Em Desenvolvimento",
                  preset: FIDText.medium,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
