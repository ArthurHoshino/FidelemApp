import 'package:flutter/material.dart';
import 'package:fidelem_app/core/widgets/fid_text.dart';
import 'package:fidelem_app/core/widgets/fid_button.dart';
import 'package:fidelem_app/modules/carrinho/components/cart_item_card.dart';
import 'package:fidelem_app/routes.dart';


final List<CartItem> mockCartItems = [
  CartItem(id: '1', name: 'Produto Premium A', description: 'Melhor item da loja.', imageUrl: '', price: 150.00, quantity: 2),
  CartItem(id: '2', name: 'Produto Básico C', description: 'Para o dia a dia.', imageUrl: '', price: 35.50, quantity: 1),
  CartItem(id: '3', name: 'Produto Xtreme Z', description: 'Limitado e potente.', imageUrl: '', price: 500.00, quantity: 1),
  CartItem(id: '4', name: 'Caneca do App', description: 'Sua caneca favorita.', imageUrl: '', price: 29.99, quantity: 3),
];


class CarrinhoView extends StatefulWidget {
  const CarrinhoView({super.key});

  @override
  State<CarrinhoView> createState() => _CarrinhoViewState();
}

class _CarrinhoViewState extends State<CarrinhoView> {

  late List<CartItem> _items;

  @override
  void initState() {
    super.initState();
    _items = List.from(mockCartItems); // Copia os dados do mock para a lista local
  }

  double _calculateTotal() {

    return _items.fold(0.0, (sum, item) => sum + (item.price * item.quantity));
  }

  void _removerItem(int index) {
    setState(() {
      _items.removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Item removido do carrinho"), duration: Duration(seconds: 1)),
    );
  }

  void _decrementarQuantidade(int index) {
    setState(() {
      if (_items[index].quantity > 1) {
        _items[index].quantity--;
      } else {
        _removerItem(index);
      }
    });
  }

  void _incrementarQuantidade(int index) {
    setState(() {
      _items[index].quantity++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final totalValue = _calculateTotal();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Transform.translate(
                    offset: const Offset(0, -30),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () => Navigator.of(context).pop(),
                      padding: const EdgeInsets.all(8),
                      constraints: const BoxConstraints(),
                      iconSize: 30,
                    ),
                  ),
                  Expanded(
                    child: FIDText(
                      baseText: "Carrinho",
                      preset: FIDText.large,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),

              Expanded(
                child: _items.isEmpty
                    ? Center(child: FIDText(baseText: "Seu carrinho está vazio.", preset: FIDText.large, textAlign: TextAlign.center,))
                    : ListView.builder(
                  padding: const EdgeInsets.only(top: 10),
                  itemCount: _items.length,
                  itemBuilder: (context, index) {
                    final item = _items[index];

                    return Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0, top: 15.0),
                          child: CartItemCard(
                            item: item,
                          ),
                        ),

                        Positioned(
                          top: 20,
                          right: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.red[50],
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.delete_outline, color: Colors.red),
                              onPressed: () => _removerItem(index),
                              tooltip: 'Remover item',
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),

              Column(
                children: [
                  const Divider(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FIDText(baseText: "Valor Total:", preset: FIDText.large, textAlign: TextAlign.start),
                      FIDText(
                        baseText: "R\$ ${totalValue.toStringAsFixed(2).replaceAll('.', ',')}",
                        preset: FIDText.large,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.end,
                      ),
                    ],
                  ),

                  FIDButton(
                    text: "Finalizar Compra",
                    preset: FIDButton.medium,
                    onPressed: _items.isEmpty ? null : () {
                      Navigator.of(context).pushNamed(Routes.paymentSelectionPage ?? '');
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