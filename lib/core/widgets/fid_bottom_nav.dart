import 'package:flutter/material.dart';

class FIDBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const FIDBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  Widget _buildIcon(BuildContext context, IconData icon, int index) {
    final isSelected = currentIndex == index;
    return IconButton(
      onPressed: () => onTap(index), 
      icon: Icon(
        icon,
        size: 28,
        color: isSelected ? Colors.blue[800] : Colors.blue,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, -1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildIcon(context, Icons.home, 0),
          _buildIcon(context, Icons.shopping_bag, 1),
          _buildIcon(context, Icons.shopping_cart, 2),
          _buildIcon(context, Icons.settings, 3),
        ],
      ),
    );
  }
}