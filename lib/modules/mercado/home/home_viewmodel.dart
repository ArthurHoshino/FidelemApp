import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';

import '../../../core/services/web_client.dart';
import '../../../core/widgets/fid_select_controller.dart';
import '../../../main.dart';


class HomeMercadoViewModel extends ChangeNotifier {

  final FIDSelectController categoriaController = FIDSelectController();

  List<String> categorias = [];
  final Map<String, int> categoriasMap = {};

  List<Map<String, dynamic>> todosItens = [];
  List<Map<String, dynamic>> itensFiltrados = [];

  // Estado da tela
  bool isLoading = false;
  String? errorMessage;


  Future<void> carregarItens() async {
    isLoading = true;
    notifyListeners();

    try {
      final response = await WebClient.getData(
        WebClient.cdProduto,
        queryParameters: {
          "cdprodempresaid": MyApp.empresaId,
        },
      );

      if (response.statusCode == 200) {
        todosItens = List<Map<String, dynamic>>.from(
          jsonDecode(response.body),
        );

        itensFiltrados = List.from(todosItens);
      }
    } catch (e) {
      errorMessage = "Erro ao carregar produtos: $e";
    } finally {
      isLoading = false;
      notifyListeners();
    }
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
        final List<dynamic> dados = jsonDecode(response.body);

        categorias.clear();
        categoriasMap.clear();

        categorias.add("Todas");

        for (var item in dados) {
          final String categoria =
              item['CDCATNOME'] ?? 'Sem categoria';

          final int id =
              item['CDCATID'] ?? 0;

          categorias.add(categoria);
          categoriasMap[categoria] = id;
        }
      }
    } catch (e) {
      errorMessage = "Erro ao carregar categorias: $e";
    }

    notifyListeners();
  }

  void filtrarCategoria(String? categoria) {

    categoriaController.value = categoria;

    if (categoria == null || categoria == "Todas") {
      itensFiltrados = List.from(todosItens);
    } else {

      final categoriaId = categoriasMap[categoria];

      itensFiltrados = todosItens.where((item) {

        return item["CDPRODCATEGORIAID"] == categoriaId;

      }).toList();
    }

    notifyListeners();
  }
}
