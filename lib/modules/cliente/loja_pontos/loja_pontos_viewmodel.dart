import 'package:flutter/material.dart';
import 'package:fidelem_app/core/services/cart_manager.dart';
import 'package:fidelem_app/modules/cliente/loja_pontos/loja_pontos_model.dart';

class LojaPontosViewModel extends ChangeNotifier {
  final CartManager cartManager = CartManager.instance;

  List<LojaPontosModel> products = [];
  String selectedSort = 'Mais Vendidos';

  LojaPontosViewModel() {
    init();
  }

  void init() {
    cartManager.addListener(_onCartChanged);
    cartManager.fetchCart();
  }

  void _onCartChanged() {
    products = cartManager.allProducts.map((prod) {
      final qty = cartManager.getProductQuantity(prod.id);
      return LojaPontosModel(
        id: prod.id.toString(),
        nome: prod.nome,
        preco: prod.precoReal,
        pontos: prod.precoPonto,
        imagem: prod.imagem ?? '',
        quantidadeNoCarrinho: qty,
      );
    }).toList();

    notifyListeners();
  }

  Future<void> updateCart(String productId, int change) async {
    final id = int.tryParse(productId) ?? -1;
    if (id != -1) {
      await cartManager.updateProductQuantity(id, change);
    }
  }

  @override
  void dispose() {
    cartManager.removeListener(_onCartChanged);
    super.dispose();
  }

  void setSort(String val) {
    selectedSort = val;
    notifyListeners();
  }
}