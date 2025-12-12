import 'package:flutter/material.dart';
import 'package:drift/drift.dart' as drift;
import 'package:decimal/decimal.dart';
import 'package:fidelem_app/database/database.dart'; 
import 'package:fidelem_app/main.dart'; 
import 'package:fidelem_app/core/widgets/fid_header.dart';
import 'package:fidelem_app/core/widgets/fid_text.dart';
import 'package:fidelem_app/core/widgets/fid_button.dart';
import 'package:fidelem_app/routes.dart';

class CartItemCardData {
  final LCCARRINHOData carrinhoData;
  final CDPRODUTOData produtoData;

  CartItemCardData({required this.carrinhoData, required this.produtoData});
}


class CarrinhoView extends StatefulWidget {
  const CarrinhoView({super.key});

  @override
  State<CarrinhoView> createState() => _CarrinhoViewState();
}

class _CarrinhoViewState extends State<CarrinhoView> {
  
  late Future<List<CDPRODUTOData>> _allProductsFuture;

  @override
  void initState() {
    super.initState();
    _allProductsFuture = appDatabase.cdProdutoDao.getAllProdutos();
  }
  
  void _atualizarQuantidade(LCCARRINHOData item, int novaQtd) {
    if (novaQtd < 1) {
      _removerItem(item);
      return;
    }
    appDatabase.carrinhoDao.updateItem(item.toCompanion(true).copyWith(
      lcCarQuantidade: drift.Value(novaQtd)
    ));
  }

  void _removerItem(LCCARRINHOData item) {
    appDatabase.carrinhoDao.deleteItem(item.toCompanion(true));
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Item removido"), duration: Duration(milliseconds: 500)));
  }

  @override
  Widget build(BuildContext context) {
    final userId = MyApp.dadosUsuario?['CDSEID'] ?? 1;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const FIDHeader(),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: StreamBuilder<List<LCCARRINHOData>>(
                  stream: appDatabase.carrinhoDao.watchCarrinhoSimplesDoUsuario(userId),
                  builder: (context, snapshotCar) {
                    
                    if (snapshotCar.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    final cartItems = snapshotCar.data ?? [];

                    if (cartItems.isEmpty) {
                      return Center(child: FIDText(baseText: "Seu carrinho está vazio.", preset: FIDText.large));
                    }

                    return FutureBuilder<List<CDPRODUTOData>>(
                      future: _allProductsFuture,
                      builder: (context, snapshotProd) {
                        
                        if (snapshotProd.connectionState == ConnectionState.waiting) {
                          return const Center(child: CircularProgressIndicator());
                        }
                        
                        final allProducts = snapshotProd.data ?? [];
                        final Map<int, CDPRODUTOData> productMap = { 
                          for (var prod in allProducts) prod.cdProdId: prod 
                        };
                        
                        final List<CartItemCardData> displayItems = [];
                        Decimal totalValue = Decimal.zero;

                        for (var carItem in cartItems) {
                          final prod = productMap[carItem.lcCarProdutoId];
                          
                          if (prod != null) {
                            final itemDisplay = CartItemCardData(
                              carrinhoData: carItem,
                              produtoData: prod,
                            );
                            displayItems.add(itemDisplay);
                            
                            final precoDecimal = prod.cdProdPrecoReal; 
                            totalValue += (precoDecimal * Decimal.fromInt(carItem.lcCarQuantidade));
                          }
                        }
                        
                        return Column(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                itemCount: displayItems.length,
                                itemBuilder: (context, index) {
                                  final itemCompleto = displayItems[index];
                                  final prod = itemCompleto.produtoData;
                                  final car = itemCompleto.carrinhoData;

                                  final precoDisplay = prod.cdProdPrecoReal.toStringAsFixed(2).replaceAll('.', ',');

                                  return Container(
                                    margin: const EdgeInsets.only(bottom: 12),
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: const Color.fromRGBO(255, 255, 255, 1),
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: [BoxShadow(color: const Color.fromRGBO(0, 0, 0, 0.122), blurRadius: 4, offset: const Offset(0, 2))],
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 60, height: 60, 
                                          color: const Color.fromRGBO(238, 238, 238, 1),
                                          child: const Icon(Icons.shopping_bag, color: Color.fromRGBO(158, 158, 158, 1)),
                                        ),
                                        const SizedBox(width: 12),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              FIDText(baseText: prod.cdProdNome, preset: FIDText.medium, fontWeight: FontWeight.bold),
                                              FIDText(baseText: "R\$ $precoDisplay", preset: FIDText.small, color: const Color.fromRGBO(158, 158, 158, 1)),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            IconButton(
                                              icon: const Icon(Icons.remove_circle_outline, color: Color.fromRGBO(33, 150, 243, 1)),
                                              onPressed: () => _atualizarQuantidade(car, car.lcCarQuantidade - 1),
                                              padding: EdgeInsets.zero,
                                              constraints: const BoxConstraints(),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                              child: Text("${car.lcCarQuantidade}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                            ),
                                            IconButton(
                                              icon: const Icon(Icons.add_circle_outline, color: Color.fromRGBO(33, 150, 243, 1)),
                                              onPressed: () => _atualizarQuantidade(car, car.lcCarQuantidade + 1),
                                              padding: EdgeInsets.zero,
                                              constraints: const BoxConstraints(),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(width: 8),
                                        IconButton(
                                          icon: const Icon(Icons.delete_outline, color: Color.fromRGBO(244, 67, 54, 1)),
                                          onPressed: () => _removerItem(car),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                FIDText(baseText: "Total:", preset: FIDText.large),
                                FIDText(
                                  baseText: "R\$ ${totalValue.toStringAsFixed(2).replaceAll('.', ',')}",
                                  preset: FIDText.large,
                                  fontWeight: FontWeight.bold,
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            FIDButton(
                              text: "Finalizar Compra",
                              preset: FIDButton.medium,
                              onPressed: () {
                                Navigator.of(context).pushNamed(
                                  Routes.paymentSelectionPage,
                                  arguments: totalValue.toDouble(), 
                                );
                              },
                            ),
                            const SizedBox(height: 20),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}