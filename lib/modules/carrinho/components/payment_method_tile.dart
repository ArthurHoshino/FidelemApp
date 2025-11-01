import 'package:flutter/material.dart';
import 'package:fidelem_app/core/widgets/fid_text.dart';
import 'package:fidelem_app/core/widgets/fid_line.dart';

class PaymentMethodTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isEnabled;
  final String? subtitle;
  final VoidCallback? onTap;
  
  const PaymentMethodTile({
    super.key, 
    required this.title, 
    required this.icon, 
    this.isEnabled = true, 
    this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = isEnabled ? Colors.black : Colors.grey;
    final subtitleColor = isEnabled ? Colors.grey : Colors.red;

    return GestureDetector(
      onTap: isEnabled ? onTap : null,
      child: Column(
        children: [
          Container(
            color: Colors.transparent, 
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              children: [
                Icon(icon, color: color, size: 30),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FIDText(
                        baseText: title, 
                        preset: FIDText.medium, 
                        color: color,
                        textAlign: TextAlign.start,
                      ),
                      if (!isEnabled && subtitle != null)
                        FIDText(
                          baseText: subtitle!, 
                          preset: FIDText.small, 
                          color: subtitleColor,
                          textAlign: TextAlign.start,
                        ),
                    ],
                  ),
                ),
                if (isEnabled)
                  const Icon(Icons.chevron_right, color: Color.fromARGB(255, 37, 106, 255)),
              ],
            ),
          ),
          FIDLine(preset: FIDLine.small),
        ],
      ),
    );
  }
}