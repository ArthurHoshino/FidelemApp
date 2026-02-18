import 'package:flutter/material.dart';
import 'package:fidelem_app/core/widgets/fid_text.dart';
import 'package:fidelem_app/core/widgets/fid_line.dart';
import 'package:fidelem_app/core/tema/tema.dart';

class PagamentoCupom extends StatelessWidget {
  const PagamentoCupom({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FIDText(baseText: "Cupom de Desconto", preset: FIDText.medium, textAlign: TextAlign.start),
        const SizedBox(height: 8),
        
        GestureDetector(
          onTap: () {
            print("Abrindo seletor de cupons");
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            decoration: BoxDecoration(
              border: Border.all(color: Cor.azul),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FIDText(
                  baseText: "Selecionar Cupom (Opcional)", 
                  preset: FIDText.medium, 
                  color: Cor.azul,
                  textAlign: TextAlign.start,
                ),
                const Icon(Icons.local_offer, color: Cor.azul),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        FIDLine(preset: FIDLine.small),
      ],
    );
  }
}