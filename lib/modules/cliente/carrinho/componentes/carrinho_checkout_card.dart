import 'package:flutter/material.dart';
import 'package:fidelem_app/core/widgets/fid_text.dart';
import 'package:fidelem_app/core/widgets/fid_button.dart';
import 'package:fidelem_app/core/tema/tema.dart';

class CarrinhoCheckout extends StatelessWidget {

  final double total;
  final VoidCallback? onPressed;
  const CarrinhoCheckout({super.key, required this.total, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Cor.branco,
        boxShadow: [
          BoxShadow(
            color: Cor.cinzaClaro,
            offset: const Offset(0, -4),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FIDText(
                baseText: "Total:",
                preset: FIDText.large,
                padding: const {"top": 0.0, "bottom": 0.0, "left": 0.0, "right": 0.0},
              ),
              FIDText(
                baseText: "R\$ ${total.toStringAsFixed(2).replaceAll('.', ',')}",
                preset: FIDText.large,
                fontWeight: FontWeight.bold,
                padding: const {"top": 0.0, "bottom": 0.0, "left": 0.0, "right": 0.0},
              ),
            ],
          ),
          const SizedBox(height: 16),
          FIDButton(
            text: "Finalizar Compra",
            preset: FIDButton.medium,
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}