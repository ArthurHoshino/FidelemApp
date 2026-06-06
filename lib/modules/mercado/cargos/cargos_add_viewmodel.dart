import 'package:flutter/material.dart';
import 'package:fidelem_app/core/services/web_client.dart';
import 'package:fidelem_app/main.dart';
import 'package:fidelem_app/core/data/models/cargo_entity.dart';
import 'dart:convert';

class CargosAddViewModel extends ChangeNotifier {
  final TextEditingController nomeController = TextEditingController();

  bool isSaving = false;
  String? errorMessage;

  final CargoEntity? cargoEditado;

  CargosAddViewModel({this.cargoEditado}) {
    if (cargoEditado != null) {
      nomeController.text = cargoEditado!.descricao;
    }
  }

  Future<bool> salvarCargo(BuildContext context) async {
    final isEdit = cargoEditado != null;

    if (nomeController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Preencha o nome do cargo."), backgroundColor: Colors.red),
      );
      return false;
    }

    isSaving = true;
    errorMessage = null;
    notifyListeners();

    try {
      final empresaId = MyApp.empresaId;
      
      final data = {
        'cdcarnome': nomeController.text.trim(),
        'cdcarempresaid': empresaId,
      };

      var response = null;

      if (isEdit) {
        data['cdcarid'] = cargoEditado!.id.toString();
        response = await WebClient.sendData(
          endpoint: WebClient.cdCargo,
          method: HttpMethod.put,
          data: data,
        );
      } else {
        response = await WebClient.sendData(
          endpoint: WebClient.cdCargo,
          method: HttpMethod.post,
          data: data,
        );
      }

      if (response.statusCode == 201 || response.statusCode == 204) {
        return true;
      } else {
        final bodyDecoded = jsonDecode(response.body);
        errorMessage = bodyDecoded['error'] ?? "Erro ao salvar cargo.";
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
