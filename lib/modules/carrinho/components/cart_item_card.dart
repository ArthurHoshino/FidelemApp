import 'package:flutter/material.dart';
import 'package:fidelem_app/core/widgets/fid_text.dart';
import 'package:fidelem_app/core/widgets/fid_line.dart';

class CartItemCard extends StatefulWidget {
  final CartItem item;

  const CartItemCard({super.key, required this.item});

  @override
  State<CartItemCard> createState() => _CartItemCardState();
}

class CartItem {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final double price;
  int quantity;

  CartItem({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    this.quantity = 1,
  });

  double get totalProductPrice => price * quantity;
}

class _CartItemCardState extends State<CartItemCard> {

  void _incrementQuantity() {
    setState(() {
      widget.item.quantity++;
    });
  }

  void _decrementQuantity() {
    setState(() {
      if (widget.item.quantity > 1) {
        widget.item.quantity--;
      }
    });
  }

  Widget _buildProductImage() {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Center(
        child: Icon(Icons.image_not_supported, color: Colors.blue, size: 40),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              _buildProductImage(),
              const SizedBox(width: 10),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FIDText(
                      baseText: widget.item.name,
                      preset: FIDText.medium,
                      textAlign: TextAlign.start,
                    ),

                    FIDText(
                      baseText: widget.item.description,
                      preset: FIDText.small,
                      color: const Color.fromARGB(255, 120, 120, 120),
                      padding: const {"bottom": 0.005},
                      textAlign: TextAlign.start,
                    ),

                    const SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        // CONTROLE DE QUANTIDADE
                        Row(
                          children: [

                            Transform.translate(
                              offset: const Offset(0, -4), // sobe 2px
                              child: GestureDetector(
                                onTap: _decrementQuantity,
                                child: const Icon(Icons.remove_circle_outline, size: 24),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              child: FIDText(
                                baseText: widget.item.quantity.toString(),
                                preset: FIDText.medium,
                                textAlign: TextAlign.center,
                              ),
                            ),

                            Transform.translate(
                              offset: const Offset(0, -4), // sobe 2px (mesmo valor)
                              child: GestureDetector(
                                onTap: _incrementQuantity,
                                child: const Icon(Icons.add_circle_outline, size: 24),
                              ),
                            ),
                          ],
                        ),

                        // PREÇO
                        FIDText(
                          baseText: "R\$ ${widget.item.totalProductPrice.toStringAsFixed(2).replaceAll('.', ',')}",
                          preset: FIDText.medium,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),






                  ],
                ),
              ),
            ],
          ),
        ),

        FIDLine(preset: FIDLine.small),
      ],
    );
  }
}
