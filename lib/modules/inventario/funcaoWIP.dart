
import 'package:flutter/material.dart';


void mostrarPopupTexto(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        title: const Text(
          "TELA AINDA EM PRODUÇÃO",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: Text(
          "Função ainda não implementada",
          style: const TextStyle(fontSize: 16),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("Entendi"),
          ),
        ],
      );
    },
  );
}