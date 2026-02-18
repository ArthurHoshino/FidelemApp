import 'package:flutter/material.dart';
import 'package:fidelem_app/core/widgets/fid_text.dart';
import 'package:fidelem_app/core/widgets/fid_input_box.dart';
import 'package:fidelem_app/core/tema/tema.dart';

class AddEditCard extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;

  const AddEditCard({
    super.key, 
    required this.label, 
    required this.hint, 
    required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FIDText(
          baseText: label,
          fontSize: 0.018,
          color: Cor.preto,
          fontWeight: FontWeight.bold,
          padding: const {"top": 0.0, "bottom": 0.005},
        ),
        FIDInputBox(
          controller: controller,
          text: hint,
          padding: const {"bottom": 0.03},
          preset: FIDInputBox.medium,
        ),
      ],
    );
  }
}