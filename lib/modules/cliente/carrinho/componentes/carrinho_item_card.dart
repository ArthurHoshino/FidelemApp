import 'package:flutter/material.dart';
import 'package:fidelem_app/core/widgets/fid_text.dart';
import 'package:fidelem_app/core/widgets/fid_line.dart';
import 'package:fidelem_app/core/tema/tema.dart';

class CarrinhoItemCard extends StatelessWidget {
  final String name;
  final double price;
  final int quantity;
  final VoidCallback onAdd;
  final VoidCallback onRemove;
  final VoidCallback onDelete;

  const CarrinhoItemCard({
    super.key,
    required this.name,
    required this.price,
    required this.quantity,
    required this.onAdd,
    required this.onRemove,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final double totalItem = price * quantity;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: Cor.azulClaro1,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.shopping_bag_outlined, color: Cor.azul),
              ),
              
              const SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    FIDText(
                      baseText: name,
                      preset: FIDText.medium,
                      fontWeight: FontWeight.bold,
                    ),
                    
                    const SizedBox(height: 8),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black12),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              buildActionButton(Icons.remove, onRemove),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                child: FIDText(baseText: quantity.toString(), preset: FIDText.medium),
                              ),
                              buildActionButton(Icons.add, onAdd),
                            ],
                          ),
                        ),

                        FIDText(
                          baseText: "R\$ ${totalItem.toStringAsFixed(2).replaceAll('.', ',')}",
                          preset: FIDText.medium,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              IconButton(
                onPressed: onDelete,
                icon: const Icon(Icons.delete_outline, color: Cor.vermelho, size: 20),
              ),
            ],
          ),
          const SizedBox(height: 12),
          FIDLine(preset: FIDLine.small),
        ],
      ),
    );
  }

  Widget buildActionButton(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Icon(icon, size: 18, color: Cor.azul),
      ),
    );
  }
}