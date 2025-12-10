import 'package:flutter/material.dart';
import 'package:fidelem_app/core/widgets/fid_text.dart';

class PaymentMethodTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isEnabled;
  final bool isSelected;
  final String? subtitle;
  final VoidCallback? onTap;

  const PaymentMethodTile({
    super.key,
    required this.title,
    required this.icon,
    this.isEnabled = true,
    this.isSelected = false, // padrão: não selecionado
    this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color textColor = isEnabled ? Colors.black : Colors.grey;

    return GestureDetector(
      onTap: isEnabled ? onTap : null,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),

        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFFE3F2FD) // fundo azul claro
              : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),

        child: Row(
          children: [
            Icon(
              icon,
              color: textColor,
              size: 30,
            ),

            const SizedBox(width: 15),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FIDText(
                    baseText: title,
                    preset: FIDText.medium,
                    color: textColor,
                    textAlign: TextAlign.left,
                  ),

                  if (!isEnabled && subtitle != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: FIDText(
                        baseText: subtitle!,
                        preset: FIDText.small,
                        color: Colors.red,
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
