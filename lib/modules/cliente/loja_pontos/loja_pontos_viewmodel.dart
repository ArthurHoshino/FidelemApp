import 'package:flutter/material.dart';
import 'package:fidelem_app/core/services/cart_manager.dart';
import 'package:fidelem_app/modules/cliente/loja_pontos/loja_pontos_model.dart';
import 'package:fidelem_app/core/services/web_client.dart';
import 'package:fidelem_app/main.dart';
import 'dart:convert';

class LojaPontosViewModel extends ChangeNotifier {
  final CartManager cartManager = CartManager.instance;

  List<LojaPontosModel> products = [];
  String selectedSort = 'Mais Vendidos';

  List<dynamic> categories = [];
  String searchQuery = '';
  int? selectedCategoryId;

  LojaPontosViewModel() {
    init();
  }

  void init() {
    cartManager.addListener(_onCartChanged);
    cartManager.fetchCart();
    carregarCategorias();
  }

  Future<void> carregarCategorias() async {
    try {
      final response = await WebClient.getData(
        WebClient.cdCategoria,
        queryParameters: {
          'cdcatempresaid': MyApp.empresaId,
        },
      );
      if (response.statusCode == 200) {
        categories = jsonDecode(response.body);
      }
    } catch (e) {
      print('Erro ao carregar categorias: $e');
    }
    notifyListeners();
  }

  void _onCartChanged() {
    products = cartManager.allProducts
        .where((prod) {
          // Filter by category
          if (selectedCategoryId != null && prod.categoriaId != selectedCategoryId) {
            return false;
          }
          // Filter by search text (name, case-insensitive)
          if (searchQuery.isNotEmpty && !prod.nome.toLowerCase().contains(searchQuery.toLowerCase())) {
            return false;
          }
          return true;
        })
        .map((prod) {
          final qty = cartManager.getProductQuantity(prod.id);
          return LojaPontosModel(
            id: prod.id.toString(),
            nome: prod.nome,
            preco: prod.precoReal,
            pontos: prod.precoPonto,
            imagem: prod.imagem ?? '',
            quantidadeNoCarrinho: qty,
          );
        })
        .toList();

    // Apply sorting
    if (selectedSort == 'Menor Preço') {
      products.sort((a, b) => a.preco.compareTo(b.preco));
    } else if (selectedSort == 'Mais Pontos') {
      products.sort((a, b) => b.pontos.compareTo(a.pontos));
    }

    notifyListeners();
  }

  void setSearchQuery(String query) {
    searchQuery = query;
    _onCartChanged();
  }

  void setSelectedCategory(int? categoryId) {
    selectedCategoryId = categoryId;
    _onCartChanged();
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
    _onCartChanged();
  }
}