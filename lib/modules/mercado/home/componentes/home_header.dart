import 'package:flutter/material.dart';
import 'package:fidelem_app/core/tema/tema.dart';
import 'package:fidelem_app/core/widgets/fid_text.dart';
import 'package:fidelem_app/core/widgets/fid_button.dart';

class HomeHeader extends StatelessWidget {

  final VoidCallback onPressed;
  const HomeHeader({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Image.asset(
                  "lib/core/assets/logo/Logo_FidelemApp_2.png",
                  width: 40,
                  height: 40,
                ),
              ),
              FIDText(
                baseText: "Fidelem App",
                fontSize: 0.028,
                fontWeight: FontWeight.bold,
                color: Cor.preto,
                padding: const {"top": 0, "bottom": 0, "left": 0, "right": 0},
              ),
            ],
          ),
        ),

        const SizedBox(height: 12),

        FIDText(
          baseText: "Produtos",
          fontSize: 0.022,
          fontWeight: FontWeight.bold,
          color: Cor.preto,
          textAlign: TextAlign.start,
          padding: const {"top": 0, "bottom": 0, "left": 0.04, "right": 0},
        ),

        const SizedBox(height: 12),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  color: Cor.branco,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Cor.cinzaClaro),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.filter_list, color: Cor.preto),
                    const SizedBox(width: 8),
                    const Text("Filtrar", style: TextStyle(color: Cor.preto)),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Cor.azul, 
                        borderRadius: BorderRadius.circular(8)
                      ),
                      child: Text(
                        "2",
                        style: const TextStyle(
                          color: Cor.branco, 
                          fontSize: 12, 
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              FIDButton(
                text: "Adicionar",
                width: 0.3,
                height: 0.05,
                borderRadius: 10,
                BGColor: Cor.azul,
                borderColor: Cor.azul,
                textColor: Cor.branco,
                padding: const {"top": 0, "bottom": 0, "left": 0, "right": 0},
                onPressed: () => onPressed(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}