import 'package:flutter/material.dart';
import 'package:fidelem_app/core/widgets/fid_text.dart';
import 'package:fidelem_app/core/widgets/fid_line.dart';

class CouponSelector extends StatelessWidget {
  const CouponSelector({super.key});

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
              border: Border.all(color: const Color.fromARGB(255, 37, 106, 255)),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FIDText(
                  baseText: "Selecionar Cupom (Opcional)", 
                  preset: FIDText.medium, 
                  color: const Color.fromARGB(255, 37, 106, 255),
                  textAlign: TextAlign.start,
                ),
                const Icon(Icons.local_offer, color: Color.fromARGB(255, 37, 106, 255)),
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