import 'package:flutter/material.dart';

class LojaFilters extends StatelessWidget {
  final String currentSort;
  final Function(String) onSortChanged;
  final VoidCallback onFilterPressed;

  const LojaFilters({
    super.key,
    required this.currentSort,
    required this.onSortChanged,
    required this.onFilterPressed,
  });

  @override
  Widget build(BuildContext context) {
    const double height = 48.0;
    final BorderRadius radius = BorderRadius.circular(8);
    final Border sideBorder = Border.all(color: const Color.fromRGBO(33, 150, 243, 1));

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: onFilterPressed,
              borderRadius: radius,
              child: Container(
                height: height,
                decoration: BoxDecoration(
                  border: sideBorder,
                  borderRadius: radius,
                  color: const Color.fromRGBO(255, 255, 255, 1),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.filter_list, size: 20, color: Color.fromRGBO(33, 150, 243, 1)),
                    SizedBox(width: 8),
                    Text(
                      "Filtrar",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(33, 150, 243, 1)),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(width: 15),

          Expanded(
            child: LayoutBuilder(builder: (context, constraints) {
              return PopupMenuButton<String>(
                onSelected: onSortChanged,
                constraints: BoxConstraints.tightFor(width: constraints.maxWidth),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                offset: const Offset(0, 52),
                elevation: 4,
                color: const Color.fromRGBO(255, 255, 255, 1),
                itemBuilder: (context) => [
                  'Mais Vendidos',
                  'Menor Preço',
                  'Mais Pontos'
                ].map((val) => PopupMenuItem(
                      value: val,
                      height: 40,
                      child: Center(
                        child: Text(
                          val,
                          style: TextStyle(
                            color: val == currentSort ? const Color.fromRGBO(33, 150, 243, 1) : const Color.fromRGBO(0, 0, 0, 0.867),
                            fontWeight: val == currentSort ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                      ),
                    )).toList(),
                child: Container(
                  height: height,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    border: sideBorder,
                    borderRadius: radius,
                    color: const Color.fromRGBO(255, 255, 255, 1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          currentSort,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(33, 150, 243, 1),
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Icon(Icons.keyboard_arrow_down, color: Color.fromRGBO(33, 150, 243, 1)),
                    ],
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}