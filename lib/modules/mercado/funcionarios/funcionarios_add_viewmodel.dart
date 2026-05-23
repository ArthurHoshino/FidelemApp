import 'package:flutter/material.dart';
import 'package:fidelem_app/core/services/web_client.dart';
import 'package:fidelem_app/core/widgets/fid_select_controller.dart';
import 'package:fidelem_app/main.dart';
import 'package:fidelem_app/core/data/models/cargo_entity.dart';
import 'package:fidelem_app/core/data/models/usuario_entity.dart';
import 'dart:convert';

class FuncionariosAddViewModel extends ChangeNotifier {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final TextEditingController cpfCnpjController = TextEditingController();
  final TextEditingController telefoneController = TextEditingController();
  final FIDSelectController cargoController = FIDSelectController();

  List<String> cargosNomes = [];
  final Map<String, CargoEntity> _cargosMap = {};

  bool isLoadingCargos = false;
  bool isSaving = false;
  String? errorMessage;

  final UsuarioEntity? funcionarioEditado;

  FuncionariosAddViewModel({this.funcionarioEditado}) {
    // Se for edição, preencher os campos iniciais
    if (funcionarioEditado != null) {
      nomeController.text = funcionarioEditado!.descricao;
      emailController.text = funcionarioEditado!.email;
      cpfCnpjController.text = funcionarioEditado!.cpfcnpj;
      telefoneController.text = funcionarioEditado!.telefone ?? '';
      // A senha normalmente não vem da listagem para edição por segurança
    }
    carregarCargos();
  }

  Future<void> carregarCargos() async {
    isLoadingCargos = true;
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
        cargosNomes.clear();
        _cargosMap.clear();

        for (var c in todosCargos) {
          if (c['CDCARNOME'] != 'CLIENTE') {
            final cargo = CargoEntity.fromMap(c);
            cargosNomes.add(cargo.descricao);
            _cargosMap[cargo.descricao] = cargo;
          }
        }

        // Se estiver editando, setar o cargo selecionado baseado no nome que veio
        if (funcionarioEditado != null) {
          final cargoAtual = funcionarioEditado!.nomeCargo;
          if (cargosNomes.contains(cargoAtual)) {
            cargoController.text = cargoAtual;
          }
        }
      } else {
        errorMessage = "Erro ao carregar cargos.";
      }
    } catch (e) {
      errorMessage = "Erro de conexão ao carregar cargos.";
    } finally {
      isLoadingCargos = false;
      notifyListeners();
    }
  }

  Future<bool> salvarFuncionario(BuildContext context) async {
    final nomeCargo = cargoController.text;
    final cargoSelecionado = nomeCargo != null ? _cargosMap[nomeCargo] : null;

    final isEdit = funcionarioEditado != null;

    if (nomeController.text.trim().isEmpty ||
        emailController.text.trim().isEmpty ||
        (!isEdit && senhaController.text.trim().isEmpty) || // Senha é obrigatória só na criação
        cargoSelecionado == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Preencha todos os campos e selecione um cargo."), backgroundColor: Colors.red),
      );
      return false;
    }

    isSaving = true;
    errorMessage = null;
    notifyListeners();

    try {
      final empresaId = MyApp.empresaId;

      final data = {
        'cdsenome': nomeController.text.trim(),
        'cdsesenha': senhaController.text.trim(),
        'cdsecpfcnpj': cpfCnpjController.text.trim().isNotEmpty ? cpfCnpjController.text.trim() : null,
        'cdseemail': emailController.text.trim(),
        'cdsetelefone': telefoneController.text.trim().isNotEmpty ? telefoneController.text.trim() : null,
        'cdsecargoid': cargoSelecionado.id,
        'empresa': empresaId,
      };

      var response = null;

      if (isEdit) {
        data['cdseid'] = funcionarioEditado!.id;
        response = await WebClient.sendData(
          endpoint: WebClient.cdSenha,
          method: HttpMethod.put,
          data: data,
        );
      } else {
        response = await WebClient.sendData(
          endpoint: WebClient.cdSenha,
          method: HttpMethod.post,
          data: data,
        );
      }

      if (response.statusCode == 201 || response.statusCode == 204) {
        return true;
      } else {
        final bodyDecoded = jsonDecode(response.body);
        errorMessage = bodyDecoded['error'] ?? "Erro ao salvar funcionário.";
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
    emailController.dispose();
    senhaController.dispose();
    cargoController.dispose();
    cpfCnpjController.dispose();
    telefoneController.dispose();
    super.dispose();
  }
}
