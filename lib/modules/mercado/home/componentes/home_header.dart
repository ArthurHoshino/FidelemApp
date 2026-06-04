import 'package:flutter/material.dart';
import 'package:fidelem_app/core/tema/tema.dart';
import 'package:fidelem_app/core/widgets/fid_text.dart';
import 'package:fidelem_app/core/widgets/fid_button.dart';
import 'package:fidelem_app/core/widgets/fid_select_box.dart';
import 'package:fidelem_app/modules/mercado/home/home_viewmodel.dart';

class HomeHeader extends StatelessWidget {
  final HomeMercadoViewModel viewModel;
  final Function(String?) onCategoriaChanged;
  final VoidCallback onPressed;
  const HomeHeader({
    super.key,
    required this.onPressed,
    required this.viewModel,
    required this.onCategoriaChanged,
  });

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
          fontSize: 0.042,
          fontWeight: FontWeight.bold,
          color: Cor.preto,
          textAlign: TextAlign.start,
          padding: const {"top": 0, "bottom": 0, "left": 0.04, "right": 0},
        ),

        const SizedBox(height: 12),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: FIDText(
                  preset: FIDText.medium,
                  baseText: "Filtrar Por:",
                  fontWeight: FontWeight.w600,
                  fontSize: .025,
                  color: Cor.preto,
                  padding: const {
                    "top": 0,
                    "bottom": 0,
                    "left": 0,
                    "right": 0,
                  },
                ),
              ),
              Expanded(
                child: Container(
                  height: 48,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: Cor.branco,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Color.fromARGB(1, 1, 0, 0),
                    ),
                  ),
                  child: Center(
                    child: FIDSelectBox(
                      padding: {"top": 0, "right": .1},
                      items: viewModel.categorias,
                      preset: FIDSelectBox.medium,
                      controller: viewModel.categoriaController,
                      onChanged: (categoria) {
                        onCategoriaChanged(categoria);
                      },
                    ),
                  ),
                ),
              ),


              const SizedBox(width: 12),


            ],
          )
        ),
      ],
    );
  }
}