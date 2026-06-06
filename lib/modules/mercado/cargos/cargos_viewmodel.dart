import 'package:flutter/material.dart';
import 'package:fidelem_app/core/services/web_client.dart';
import 'package:fidelem_app/main.dart';
import 'package:fidelem_app/core/data/models/cargo_entity.dart';
import 'dart:convert';

class CargosViewModel extends ChangeNotifier {
  List<CargoEntity> cargos = [];
  bool isLoading = false;
  String? errorMessage;

  CargosViewModel() {
    carregarCargos();
  }

  Future<void> carregarCargos() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final empresaId = MyApp.empresaId;
      if (empresaId == null) {
        throw Exception("Empresa não identificada.");
      }

      final response = await WebClient.getData(
        WebClient.cdCargo,
        queryParameters: {
          'cdcarempresaid': empresaId,
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> todosCargos = jsonDecode(response.body);
        cargos = todosCargos
            .where((c) => c['CDCARNOME'] != 'CLIENTE')
            .map((c) => CargoEntity.fromMap(c))
            .toList();
      } else {
        errorMessage = "Erro ao carregar cargos.";
      }
    } catch (e) {
      errorMessage = "Erro de conexão: $e";
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> deletarCargo(BuildContext context, int idCargo) async {
    final empresaId = MyApp.empresaId;
    if (empresaId == null) return false;

    try {
      final response = await WebClient.sendData(
        endpoint: WebClient.cdCargo,
        method: HttpMethod.delete,
        data: {
          'cdcarid': idCargo,
          'cdcarempresaid': empresaId
        }
      );

      if (response.statusCode == 204) {
        cargos.removeWhere((c) => c.id == idCargo);
        notifyListeners();
        return true;
      } else {
        final bodyDecoded = jsonDecode(response.body);
        var error = bodyDecoded['error'] ?? "Erro ao deletar cargo.";

        final erroFormatado = error.toLowerCase();

        if (erroFormatado.contains('foreign key')) {
          error = "Não é possível deletar este cargo, pois existem funcionários vinculados a ele.";
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
