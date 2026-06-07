import 'package:flutter/material.dart';
import 'package:fidelem_app/core/widgets/fid_text.dart';
import 'package:fidelem_app/core/tema/tema.dart';

class PagamentoCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isEnabled;
  final bool isSelected;
  final String? subtitle;
  final VoidCallback? onTap;

  const PagamentoCard({
    super.key,
    required this.title,
    required this.icon,
    this.isEnabled = true,
    this.isSelected = false,
    this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color textColor = isEnabled ? Cor.preto : Cor.cinzaClaro;

    return GestureDetector(
      onTap: isEnabled ? onTap : null,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),

        decoration: BoxDecoration(
          color: isSelected
              ? Cor.branco
              : Cor.transparente,
          borderRadius: BorderRadius.circular(10),
        ),

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 30,
              height: 30,
              child: Icon(
                icon,
                color: textColor,
                size: 30,
              ),
            ),

            const SizedBox(width: 15),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  FIDText(
                    baseText: title,
                    preset: FIDText.medium,
                    color: textColor,
                    textAlign: TextAlign.left,
                  ),

                  if (subtitle != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: FIDText(
                        baseText: subtitle!,
                        preset: FIDText.small,
                        color: isEnabled ? Cor.cinzaEscuro : Cor.vermelho,
                        textAlign: TextAlign.left,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
