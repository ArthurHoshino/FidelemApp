import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fidelem_app/core/widgets/fid_text.dart';
import 'package:fidelem_app/core/tema/tema.dart';
import 'package:fidelem_app/modules/mercado/inventario/add_edit_viewmodel.dart';

class AddEditImagens extends StatelessWidget {
  final AddEditViewmodel viewModel;

  const AddEditImagens({
    super.key,
    required this.viewModel,
  });

  void _abrirImagemCompleta(BuildContext context, ProdutoImagemItem img) {
    Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.white,
            elevation: 0,
            title: Text("Imagem #${img.order}"),
            centerTitle: true,
          ),
          body: Center(
            child: InteractiveViewer(
              panEnabled: true,
              boundaryMargin: const EdgeInsets.all(20),
              minScale: 0.5,
              maxScale: 4.0,
              child: img.isLocal
                  ? Image.file(img.localFile!, fit: BoxFit.contain)
                  : Image.memory(
                      base64Decode(img.base64Content!),
                      fit: BoxFit.contain,
                    ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: viewModel,
      builder: (context, _) {
        final imagens = viewModel.produtoImagens;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FIDText(
                  baseText: "Imagens do Produto (${imagens.length})",
                  fontSize: 0.018,
                  color: Cor.preto,
                  textAlign: TextAlign.start,
                  fontWeight: FontWeight.bold,
                  padding: const {"top": 0.0, "bottom": 0.005},
                ),
                if (imagens.isNotEmpty)
                  const Text(
                    "Clique e arraste para reordenar",
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 8),

            // Carousel/List of images
            if (imagens.isNotEmpty) ...[
              Container(
                height: 120,
                margin: const EdgeInsets.only(bottom: 16),
                child: ReorderableListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: imagens.length,
                  onReorder: viewModel.reordenarImagens,
                  itemBuilder: (context, index) {
                    final img = imagens[index];
                    return CardImageWidget(
                      key: ValueKey(img.hashCode),
                      img: img,
                      onDelete: () => viewModel.removerImagem(index),
                      onTap: () => _abrirImagemCompleta(context, img),
                    );
                  },
                ),
              ),
            ] else ...[
              Container(
                height: 100,
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey[300]!, style: BorderStyle.solid),
                ),
                child: const Center(
                  child: Text(
                    "Nenhuma imagem adicionada",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ],

            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Cor.azul,
                      side: const BorderSide(color: Cor.azul),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    icon: const Icon(Icons.camera_alt_outlined),
                    label: const Text("Câmera"),
                    onPressed: () async {
                      final picker = ImagePicker();
                      final pickedFile = await picker.pickImage(
                        source: ImageSource.camera,
                        maxWidth: 1024,
                        maxHeight: 1024,
                        imageQuality: 80,
                      );

                      if (pickedFile != null) {
                        viewModel.adicionarImagemLocal(File(pickedFile.path));
                      }
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Cor.azul,
                      side: const BorderSide(color: Cor.azul),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    icon: const Icon(Icons.photo_library_outlined),
                    label: const Text("Galeria"),
                    onPressed: () async {
                      final picker = ImagePicker();
                      final pickedFile = await picker.pickImage(
                        source: ImageSource.gallery,
                        maxWidth: 1024,
                        maxHeight: 1024,
                        imageQuality: 80,
                      );

                      if (pickedFile != null) {
                        viewModel.adicionarImagemLocal(File(pickedFile.path));
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

class CardImageWidget extends StatelessWidget {
  final ProdutoImagemItem img;
  final VoidCallback onDelete;
  final VoidCallback onTap;

  const CardImageWidget({
    super.key,
    required this.img,
    required this.onDelete,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Widget imageWidget;
    if (img.isLocal) {
      imageWidget = Image.file(
        img.localFile!,
        width: 100,
        height: 100,
        fit: BoxFit.cover,
      );
    } else if (img.base64Content != null) {
      imageWidget = Image.memory(
        base64Decode(img.base64Content!),
        width: 100,
        height: 100,
        fit: BoxFit.cover,
      );
    } else {
      imageWidget = Container(
        width: 100,
        height: 100,
        color: Colors.grey[300],
        child: const Icon(Icons.image_not_supported),
      );
    }

    return Padding(
      key: key,
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Stack(
        children: [
          GestureDetector(
            onTap: onTap,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300, width: 1),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: imageWidget,
              ),
            ),
          ),
          Positioned(
            top: 4,
            right: 4,
            child: GestureDetector(
              onTap: onDelete,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 14,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 4,
            left: 4,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                "#${img.order}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}