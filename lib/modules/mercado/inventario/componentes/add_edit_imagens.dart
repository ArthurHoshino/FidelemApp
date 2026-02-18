import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fidelem_app/core/widgets/fid_text.dart';
import 'package:fidelem_app/core/tema/tema.dart';

class AddEditImagens extends StatelessWidget {
  final int nImagem;
  final List<File> listaImagens;
  final VoidCallback onUpdate;

  const AddEditImagens({
    super.key,
    required this.nImagem,
    required this.listaImagens,
    required this.onUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FIDText(
          baseText: "Imagens ($nImagem)",
          fontSize: 0.018,
          color: Cor.preto,
          textAlign: TextAlign.start,
          fontWeight: FontWeight.bold,
          padding: {"top": 0.0, "bottom": 0.005},
        ),
        Row(
          spacing: 20,
          children: [
            ElevatedButton(
              child: Column(
                children: [
                  Icon(Icons.camera_alt_outlined),
                  Text("Camera"),
                ],
              ),
              onPressed: () async {
                final picker = ImagePicker();
                final pickedFile = await picker.pickImage(source: ImageSource.camera);

                if (pickedFile != null) {
                  listaImagens.add(File(pickedFile.path));
                  onUpdate();
                }
              },
            ),

            Text("OU"),

            ElevatedButton(
              child: Column(
                children: [
                  Icon(Icons.add_circle_outline),
                  Text("Upload"),
                ],
              ),
              onPressed: () async {
                final picker = ImagePicker();
                final pickedFile = await picker.pickImage(source: ImageSource.gallery);

                if (pickedFile != null) {
                  listaImagens.add(File(pickedFile.path));
                  onUpdate();
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}