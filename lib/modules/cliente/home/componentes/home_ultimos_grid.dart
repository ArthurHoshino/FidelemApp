import 'package:flutter/material.dart';
import 'package:fidelem_app/core/widgets/fid_text.dart';
import 'package:fidelem_app/modules/cliente/home/componentes/home_ultimos_card.dart';
import 'package:fidelem_app/core/tema/tema.dart';

class HomeUltimosGrid extends StatelessWidget {
  final List<Map<String, dynamic>> data;
  const HomeUltimosGrid({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        FIDText(
          baseText: "Últimos Buscados",
          preset: FIDText.medium,
          textAlign: TextAlign.left,
          color: Cor.preto,
          padding: const {"bottom": 0.0, "top": 0.0, "left": 0.0, "right": 0.0},
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: data.length,
          itemBuilder: (context, index) {
            final item = data[index];
            return Column(
              children: [
                HomeUltimosCard(
                  title: item["titulo"],
                  subtitle: item["subtitulo"],
                  imagePath: item["imagem"],
                ),
                const SizedBox(height: 8),
              ],
            );
          },
        ),
      ],
    );
  }
}