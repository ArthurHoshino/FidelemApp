import 'package:flutter/material.dart';
import 'package:fidelem_app/core/widgets/fid_text.dart';
import 'package:fidelem_app/core/widgets/fid_button.dart';
import 'package:fidelem_app/modules/carrinho/components/cart_item_card.dart'; 
import 'package:fidelem_app/routes.dart';

// MOCK de dados com a classe CartItem
final List<CartItem> mockCartItems = [
  CartItem(id: '1', name: 'Produto Premium A', description: 'Melhor item da loja.', imageUrl: '', price: 150.00, quantity: 2),
  CartItem(id: '2', name: 'Produto Básico C', description: 'Para o dia a dia.', imageUrl: '', price: 35.50, quantity: 1),
  CartItem(id: '3', name: 'Produto Xtreme Z', description: 'Limitado e potente.', imageUrl: '', price: 500.00, quantity: 1),
  CartItem(id: '4', name: 'Caneca do App', description: 'Sua caneca favorita.', imageUrl: '', price: 29.99, quantity: 3),
];

class CarrinhoView extends StatelessWidget {
  const CarrinhoView({super.key});

  double _calculateTotal(List<CartItem> items) {
    return items.fold(0.0, (sum, item) => sum + item.totalProductPrice);
  }

  @override
  Widget build(BuildContext context) {
    final totalValue = _calculateTotal(mockCartItems);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.of(context).pop(), 
                  ),
                  const SizedBox(width: 8),
                  FIDText(baseText: "Carrinho", preset: FIDText.large, textAlign: TextAlign.start),
                ],
              ),
              
              // LISTA DE PRODUTOS
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.only(top: 20.0),
                  itemCount: mockCartItems.length,
                  itemBuilder: (context, index) {
                    return CartItemCard(item: mockCartItems[index]);
                  },
                ),
              ),

              // RODAPÉ FIXO
              Column(
                children: [
                  const Divider(height: 30), 
                  
                  // Valor Total
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FIDText(baseText: "Valor Total:", preset: FIDText.medium, textAlign: TextAlign.start),
                      FIDText(
                        baseText: "R\$ ${totalValue.toStringAsFixed(2).replaceAll('.', ',')}",
                        preset: FIDText.large,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.end,
                      ),
                    ],
                  ),
                  
                  // Botão de Finalizar
                  FIDButton(
                    text: "Finalizar Compra",
                    preset: FIDButton.medium,
                    onPressed: () {
                      Navigator.of(context).pushNamed(Routes.paymentSelectionPage); 
                    },
                    padding: const {"top": 0.02, "bottom": 0.01},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}