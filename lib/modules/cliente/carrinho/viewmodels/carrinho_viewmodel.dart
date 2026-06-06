import 'package:flutter/material.dart';
import 'package:decimal/decimal.dart';
import 'package:fidelem_app/database/database.dart';
import 'package:fidelem_app/core/services/cart_manager.dart';
import '../models/carrinho_model.dart';

class CarrinhoViewModel extends ChangeNotifier {
  final CartManager cartManager = CartManager.instance;
  List<CarrinhoModel> items = [];

  CarrinhoViewModel() {
    init();
  }

  void init() {
    cartManager.addListener(_onCartChanged);
    cartManager.fetchCart();
    _onCartChanged();
  }

  void _onCartChanged() {
    items = cartManager.items.map((item) {
      final lccarData = LCCARRINHOData(
        lcCarId: item.id,
        lcCarProdutoId: item.produtoId,
        lcCarUsuarioId: cartManager.userId,
        lcCarQuantidade: item.quantidade,
      );

      final prod = item.produto;
      return CarrinhoModel(
        carrinhoData: lccarData,
        nome: prod?.nome ?? 'Produto desconhecido',
        preco: prod?.precoReal ?? 0.0,
        imagem: prod?.imagem ?? '',
      );
    }).toList();

    notifyListeners();
  }

  void adicionar(CarrinhoModel item) {
    cartManager.updateProductQuantity(item.carrinhoData.lcCarProdutoId, 1);
  }

  void remover(CarrinhoModel item) {
    cartManager.updateProductQuantity(item.carrinhoData.lcCarProdutoId, -1);
  }
  
  void excluir(CarrinhoModel item) {
    cartManager.updateProductQuantity(
      item.carrinhoData.lcCarProdutoId,
      -item.carrinhoData.lcCarQuantidade,
    );
  }

  Decimal get total {
    Decimal valorTotal = Decimal.zero;
    for (var item in items) {
      final preco = Decimal.parse(item.preco.toString());
      valorTotal += preco * Decimal.fromInt(item.carrinhoData.lcCarQuantidade);
    }
    return valorTotal;
  }

  @override
  void dispose() {
    cartManager.removeListener(_onCartChanged);
    super.dispose();
  }
}