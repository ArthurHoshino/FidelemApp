import 'package:flutter/material.dart';
import 'package:fidelem_app/core/services/web_client.dart';
import 'package:fidelem_app/main.dart';
import 'dart:convert';

class CategoriasViewmodel extends ChangeNotifier {
  List<dynamic> categorias = [];
  bool isLoading = false;
  String? errorMessage;

  CategoriasViewmodel() {
    carregarCategorias();
  }

  Future<void> carregarCategorias() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final empresaId = MyApp.empresaId;
      if (empresaId == null) {
        throw Exception("Empresa não identificada.");
      }

      final response = await WebClient.getData(
        WebClient.cdCategoria,
        queryParameters: {
          'cdcatempresaid': empresaId,
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> todasCategorias = jsonDecode(response.body);
        categorias = todasCategorias.toList();
      } else if (response.statusCode == 404) {
        errorMessage = "Nenhuma categoria cadastrada.";
      } else {
        errorMessage = "Erro ao carregar categorias.";
      }
    } catch (e) {
      errorMessage = "Erro de conexão: $e";
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> deletarCategoria(BuildContext context, int categoriaId) async {
    final empresaId = MyApp.empresaId;
    if (empresaId == null) return false;





    try {
      // ver se nao tem produtos dependentes
      final produtosResponse = await WebClient.getData(
        WebClient.cdProduto,
        queryParameters: {
          "cdprodcategoriaid": categoriaId,
          "cdprodempresaid": empresaId
        },
      );

      if(produtosResponse.body.isNotEmpty ){
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Não é possível deletar esta categoria, pois existem produtos vinculados a ela."), backgroundColor: Colors.red));
        return false;
      }

      final response = await WebClient.sendData(
          endpoint: WebClient.cdCategoria,
          method: HttpMethod.delete,
          data: {
            'cdcatid': categoriaId,
            'cdcatempresaid': empresaId
          }
      );
      // print(response.body);

      if (response.statusCode == 204) {
        categorias.removeWhere((c) => c['CDCATID'] == categoriaId);
        notifyListeners();
        return true;
      } else {
        final bodyDecoded = jsonDecode(response.body);
        print(bodyDecoded);
        var error = bodyDecoded['error'] ?? "Erro ao deletar categoria.";

        final erroFormatado = error.toLowerCase();

        if (erroFormatado.contains('foreign key')) {
          error = "Não é possível deletar esta categoria, pois existem produtos vinculados a ela.";
        }
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error), backgroundColor: Colors.red));
        }
        return false;
      }
    } catch(e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Erro de conexão ao deletar."), backgroundColor: Colors.red));
      }
      return false;
    }
  }
}
