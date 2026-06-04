import 'package:flutter/material.dart';
import 'package:fidelem_app/core/services/web_client.dart';
import 'package:fidelem_app/main.dart';
import 'dart:convert';

class AddCategoriasViewmodel extends ChangeNotifier {
  final TextEditingController nomeController = TextEditingController();

  bool isSaving = false;
  String? errorMessage;

  final Map<String, dynamic>? categoriaEditada;

  AddCategoriasViewmodel({this.categoriaEditada}) {
    if (categoriaEditada != null) {
      nomeController.text = categoriaEditada!['CDCATNOME'] ?? '';
    }
  }

  Future<bool> salvarCategoria(BuildContext context) async {
    final isEdit = categoriaEditada != null;

    if (nomeController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Preencha o nome da categoria."), backgroundColor: Colors.red),
      );
      return false;
    }

    isSaving = true;
    errorMessage = null;
    notifyListeners();

    try {
      final empresaId = MyApp.empresaId;

      final data = {
        'cdcatnome': nomeController.text.trim(),
        'cdcatempresaid' : empresaId
      };

      var response = null;

      if (isEdit) {
        data['cdcatid'] = categoriaEditada!['CDCATID'].toString();
        response = await WebClient.sendData(
          endpoint: WebClient.cdCategoria,
          method: HttpMethod.put,
          data: data,
        );
      } else {
        print(data);
        response = await WebClient.sendData(
          endpoint: WebClient.cdCategoria,
          method: HttpMethod.post,
          data: data,
        );
      }
      if (response.statusCode == 201 || response.statusCode == 204) {
        return true;
      } else {
        final bodyDecoded = jsonDecode(response.body);
        errorMessage = bodyDecoded['error'] ?? "Erro ao salvar categoria.";
        return false;
      }
    } catch (e) {
      errorMessage = "Erro de conexão ao salvar.";
      return false;
    } finally {
      isSaving = false;
      notifyListeners();

      if (errorMessage != null) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(errorMessage!), backgroundColor: Colors.red),
          );
        }
      }
    }
  }

  @override
  void dispose() {
    nomeController.dispose();
    super.dispose();
  }
}
