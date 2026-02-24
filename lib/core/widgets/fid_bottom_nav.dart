import 'package:flutter/material.dart';
import 'package:fidelem_app/core/tema/tema.dart';

class FIDBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final List<IconData> icons;

  const FIDBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.icons,
  });

  Widget buildIcon(BuildContext context, IconData icon, int index) {
    final isSelected = currentIndex == index;
    return IconButton(
      onPressed: () => onTap(index),
      icon: Icon(
        icon,
        size: 28,
        color: isSelected ? Cor.azul : Cor.cinzaClaro, 
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Cor.branco,
        boxShadow: [
          BoxShadow(
            color: Cor.cinzaClaro,
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, -1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: icons.asMap().entries.map((entry) {
          int idx = entry.key;
          IconData iconData = entry.value;
          return buildIcon(context, iconData, idx);
        }).toList(),
      ),
    );
  }
}