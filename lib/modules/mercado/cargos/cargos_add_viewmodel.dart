import 'package:flutter/material.dart';
import 'package:fidelem_app/core/services/web_client.dart';
import 'package:fidelem_app/main.dart';
import 'package:fidelem_app/core/data/models/cargo_entity.dart';
import 'package:fidelem_app/core/data/models/privilegio_entity.dart';
import 'dart:convert';

class CargosAddViewModel extends ChangeNotifier {
  final TextEditingController nomeController = TextEditingController();

  bool isSaving = false;
  bool isLoadingPrivilegios = false;
  String? errorMessage;

  final CargoEntity? cargoEditado;

  List<PrivilegioEntity> todosPrivilegios = [];
  Set<int> privilegiosSelecionados = {};

  CargosAddViewModel({this.cargoEditado}) {
    if (cargoEditado != null) {
      nomeController.text = cargoEditado!.descricao;
    }
    carregarDados();
  }

  // Agrupa os privilégios por módulo
  Map<String, List<PrivilegioEntity>> get privilegiosPorModulo {
    final map = <String, List<PrivilegioEntity>>{};
    for (var priv in todosPrivilegios) {
      if (!map.containsKey(priv.modulo)) {
        map[priv.modulo] = [];
      }
      map[priv.modulo]!.add(priv);
    }
    return map;
  }

  Future<void> carregarDados() async {
    isLoadingPrivilegios = true;
    notifyListeners();

    try {
      // 1. Carregar catálogo de privilégios
      final responseCat = await WebClient.getData(WebClient.cdPrivilegio);
      if (responseCat.statusCode == 200) {
        final List<dynamic> catDecoded = jsonDecode(responseCat.body);
        todosPrivilegios = catDecoded.map((p) => PrivilegioEntity.fromMap(p)).toList();
      }

      // 2. Se for edição, carregar os vinculados ao cargo
      if (cargoEditado != null) {
        final responseLink = await WebClient.getData(
          WebClient.lcPrivilegio,
          queryParameters: {'cdcarid': cargoEditado!.id},
        );
        if (responseLink.statusCode == 200) {
          final List<dynamic> linkDecoded = jsonDecode(responseLink.body);
          privilegiosSelecionados = linkDecoded.map((id) => id as int).toSet();
        }
      }
    } catch (e) {
      errorMessage = "Erro ao carregar os privilégios: $e";
    } finally {
      isLoadingPrivilegios = false;
      notifyListeners();
    }
  }

  void togglePrivilegio(int privId, bool? value) {
    if (value == true) {
      privilegiosSelecionados.add(privId);
    } else {
      privilegiosSelecionados.remove(privId);
    }
    notifyListeners();
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
      int cargoIdFinal = 0;

      if (isEdit) {
        cargoIdFinal = cargoEditado!.id;
        data['cdcarid'] = cargoIdFinal.toString();
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
        // Se for POST e RETURNING *, o backend retorna a entidade criada
        if (!isEdit) {
          final bodyDecoded = jsonDecode(response.body);
          cargoIdFinal = bodyDecoded['CDCARID'];
        }

        // Salvar privilégios
        final privResponse = await WebClient.sendData(
          endpoint: WebClient.lcPrivilegio,
          method: HttpMethod.put,
          data: {
            'cdcarid': cargoIdFinal,
            'privilegios': privilegiosSelecionados.toList(),
          }
        );

        if (privResponse.statusCode == 204) {
          return true;
        } else {
          errorMessage = "Cargo salvo, mas erro ao salvar privilégios.";
          return false;
        }

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
