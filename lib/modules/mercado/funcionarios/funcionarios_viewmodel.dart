import 'package:flutter/material.dart';
import 'package:fidelem_app/core/services/web_client.dart';
import 'package:fidelem_app/main.dart';
import 'package:fidelem_app/core/data/models/usuario_entity.dart';
import 'dart:convert';

class FuncionariosViewModel extends ChangeNotifier {
  List<UsuarioEntity> funcionarios = [];
  bool isLoading = false;
  String? errorMessage;

  FuncionariosViewModel() {
    carregarFuncionarios();
  }

  Future<void> carregarFuncionarios() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final empresaId = MyApp.empresaId;
      if (empresaId == null) {
        throw Exception("Empresa não identificada.");
      }

      final response = await WebClient.getData(
        WebClient.cdSenha,
        queryParameters: {
          'empresa': empresaId,
          'not_cargo': 'CLIENTE',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> dados = jsonDecode(response.body);
        funcionarios = dados
            .map((f) => UsuarioEntity.fromMap(f))
            .toList();
      } else {
        errorMessage = "Erro ao carregar funcionários.";
      }
    } catch (e) {
      errorMessage = "Erro de conexão: $e";
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> deletarFuncionario(BuildContext context, int idFuncionario) async {
    final empresaId = MyApp.empresaId;
    if (empresaId == null) return false;

    try {
      final response = await WebClient.sendData(
        endpoint: WebClient.cdSenha,
        method: HttpMethod.delete,
        data: {
          'empresa': empresaId,
          'cdseid': idFuncionario
        }
      );

      if (response.statusCode == 204) {
        // Remover a lista local ao invés de buscar tudo novamente (ou só recarregar)
        funcionarios.removeWhere((f) => f.id == idFuncionario);
        notifyListeners();
        return true;
      } else {
        final bodyDecoded = jsonDecode(response.body);
        final error = bodyDecoded['error'] ?? "Erro ao deletar funcionário.";
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
