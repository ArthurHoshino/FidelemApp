import 'package:flutter/material.dart';
import 'package:fidelem_app/core/widgets/fid_text.dart';
import 'package:fidelem_app/core/tema/tema.dart';
import 'package:fidelem_app/modules/cliente/home/componentes/home_promocoes_card.dart';

class HomePromocoesGrid extends StatelessWidget {
  final List<Map<String, dynamic>> data;
  const HomePromocoesGrid({super.key, required this.data});
  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        FIDText(
          baseText: "Promoções",
          preset: FIDText.medium,
          textAlign: TextAlign.left,
          color: Cor.cinzaEscuro,
          padding: const {"bottom": 0.0, "top": 0.0, "left": 0.0, "right": 0.0},
        ),
        const SizedBox(height: 12),
        if (data.isEmpty)
          const Center(child: Text("Nenhuma promoção disponível."))
        else
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: data.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15.0,
              mainAxisSpacing: 15.0,
              childAspectRatio: 0.8,
            ),
            itemBuilder: (context, index) {
              final item = data[index];
              return HomePromocoesCard(
                title: item["titulo"],
                price: item["preco"],
                imagePath: item["imagem"],
              );
            },
          ),
      ],
    );
  }
}