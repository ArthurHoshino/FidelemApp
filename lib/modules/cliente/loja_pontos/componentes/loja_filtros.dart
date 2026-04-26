import 'package:flutter/material.dart';
import 'package:fidelem_app/core/tema/tema.dart';

class LojaFiltros extends StatelessWidget {
  final String currentSort;
  final Function(String) onSortChanged;
  final VoidCallback onFilterPressed;

  const LojaFiltros({
    super.key,
    required this.currentSort,
    required this.onSortChanged,
    required this.onFilterPressed,
  });

  @override
  Widget build(BuildContext context) {
    const double height = 48.0;
    final BorderRadius radius = BorderRadius.circular(8);
    final Border sideBorder = Border.all(color: Cor.azul);

    return Padding(
      padding: const EdgeInsets.all(20.0),
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
                  color: Cor.branco,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.filter_list, size: 20, color: Cor.azul),
                    SizedBox(width: 8),
                    Text(
                      "Filtrar",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Cor.azul),
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
                color: Cor.branco,
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
                            color: val == currentSort ? Cor.azul : Cor.preto,
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
                    color: Cor.branco,
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
                            color: Cor.azul,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Icon(Icons.keyboard_arrow_down, color: Cor.azul),
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