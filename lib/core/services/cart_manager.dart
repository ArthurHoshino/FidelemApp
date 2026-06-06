import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fidelem_app/core/services/web_client.dart';
import 'package:fidelem_app/main.dart';
import 'package:fidelem_app/core/data/models/produto_entity.dart';

class CartItem {
  final int id; // lccarid
  final int produtoId;
  final int quantidade;
  final int empresaId;
  final ProdutoEntity? produto;

  CartItem({
    required this.id,
    required this.produtoId,
    required this.quantidade,
    required this.empresaId,
    this.produto,
  });

  factory CartItem.fromJson(Map<String, dynamic> json, {List<ProdutoEntity>? allProducts}) {
    final prodId = json['LCCARPRODUTOID'] ?? json['lccarprodutoid'] ?? 0;
    ProdutoEntity? foundProd;
    if (allProducts != null) {
      for (var p in allProducts) {
        if (p.id == prodId) {
          foundProd = p;
          break;
        }
      }
    }
    return CartItem(
      id: json['LCCARID'] ?? json['lccarid'] ?? 0,
      produtoId: prodId,
      quantidade: json['LCCARQUANTIDADE'] ?? json['lccarquantidade'] ?? 0,
      empresaId: json['LCCAREMPRESAID'] ?? json['lccarempresaid'] ?? 0,
      produto: foundProd,
    );
  }
}

class CartManager extends ChangeNotifier {
  static final CartManager instance = CartManager._();
  CartManager._();

  List<CartItem> _items = [];
  List<ProdutoEntity> _allProducts = [];
  bool _isLoading = false;

  List<CartItem> get items => _items;
  bool get isLoading => _isLoading;

  int get userId => MyApp.dadosUsuario?.id ?? 1;
  String get empresaIdStr => MyApp.empresaId ?? "1";
  int get empresaId => int.tryParse(empresaIdStr) ?? 1;

  // Fetches both products and cart items from backend
  Future<void> fetchCart() async {
    _isLoading = true;
    notifyListeners();
    try {
      // 1. Fetch all products of the current market first
      final prodResponse = await WebClient.getData(WebClient.cdProduto, queryParameters: {
        'cdprodempresaid': empresaIdStr,
      });
      if (prodResponse.statusCode == 200) {
        final List<dynamic> prodData = jsonDecode(prodResponse.body);
        _allProducts = prodData.map((e) => ProdutoEntity.fromMap(e)).toList();
      }

      // 2. Fetch cart items for the user and company
      final cartResponse = await WebClient.getData('lccarrinho', queryParameters: {
        'lccarsenhaid': userId.toString(),
        'lccarempresaid': empresaId.toString(),
      });
      if (cartResponse.statusCode == 200) {
        final List<dynamic> cartData = jsonDecode(cartResponse.body);
        _items = cartData.map((e) => CartItem.fromJson(e, allProducts: _allProducts)).toList();
      }
    } catch (e) {
      print('Erro ao carregar carrinho do backend: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Gets the quantity of a product in the cart
  int getProductQuantity(int produtoId) {
    for (var item in _items) {
      if (item.produtoId == produtoId) {
        return item.quantidade;
      }
    }
    return 0;
  }

  // Updates (add, subtract or remove) product quantity
  Future<void> updateProductQuantity(int produtoId, int change) async {
    final currentQty = getProductQuantity(produtoId);
    final newQty = currentQty + change;

    if (newQty <= 0) {
      final item = _items.firstWhere((element) => element.produtoId == produtoId, 
        orElse: () => CartItem(id: 0, produtoId: 0, quantidade: 0, empresaId: 0));
      if (item.id != 0) {
        final response = await WebClient.sendData(
          endpoint: 'lccarrinho',
          method: HttpMethod.delete,
          data: {
            'lccarid': item.id,
            'lccarempresaid': empresaId,
          },
        );
        if (response.statusCode < 300) {
          _items.removeWhere((element) => element.produtoId == produtoId);
        }
      }
    } else {
      final response = await WebClient.sendData(
        endpoint: 'lccarrinho',
        method: HttpMethod.post,
        data: {
          'lccarsenhaid': userId,
          'lccarprodutoid': produtoId,
          'lccarquantidade': newQty,
          'lccarempresaid': empresaId,
        },
      );
      if (response.statusCode < 300) {
        await fetchCart();
      }
    }
    notifyListeners();
  }

  // Clear all items for this user and company
  Future<void> clearCart() async {
    final response = await WebClient.sendData(
      endpoint: 'lccarrinho',
      method: HttpMethod.delete,
      data: {
        'lccarsenhaid': userId,
        'lccarempresaid': empresaId,
      },
    );
    if (response.statusCode < 300) {
      _items.clear();
      notifyListeners();
    }
  }

  // Finalizes checkout by posting to /lcvenda/finalizar
  Future<String?> finalizeCart() async {
    _isLoading = true;
    notifyListeners();
    try {
      final response = await WebClient.sendData(
        endpoint: 'lcvenda/finalizar',
        method: HttpMethod.post,
        data: {
          'lcvensenhaid': userId,
          'lccarempresaid': empresaId,
        },
      );

      _isLoading = false;
      notifyListeners();

      if (response.statusCode == 200) {
        _items.clear();
        notifyListeners();
        return null; // Sucesso
      } else {
        try {
          final errorData = jsonDecode(response.body);
          return errorData['error'] ?? 'Erro desconhecido ao finalizar compra';
        } catch (_) {
          return 'Erro ao processar resposta do servidor';
        }
      }
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      return 'Erro de conexão com o servidor: $e';
    }
  }

  List<ProdutoEntity> get allProducts => _allProducts;
}
