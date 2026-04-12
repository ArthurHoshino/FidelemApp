import 'package:flutter/material.dart';
import 'package:fidelem_app/core/services/web_client.dart';
import 'package:fidelem_app/modules/auth/login/login_model.dart';
import 'package:fidelem_app/routes.dart';
import 'dart:convert';
import 'package:fidelem_app/core/widgets/fid_select_controller.dart';
import 'package:fidelem_app/main.dart';

class LoginViewModel extends ChangeNotifier {
  // Controladores para pegarem o texto da view
  final TextEditingController usuarioController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final FIDSelectController empresaController = FIDSelectController();

  // Estado da tela
  bool isLoading = false;
  String? errorMessage;
  List<String> empresasNomes = [];
  final Map<String, int> _empresasMap = {};

  LoginViewModel() {
    carregarEmpresas();
  }

  // Metodo para buscar as empresas no banco
  Future<void> carregarEmpresas() async {
    isLoading = true;
    notifyListeners();

    try {
      final response = await WebClient.getData(WebClient.cdEmpresa, queryParameters: {});

      if (response.statusCode == 200) {
        final List<dynamic> dados = jsonDecode(response.body);

        empresasNomes.clear();
        _empresasMap.clear();

        for (var item in dados) {
          final String nome = item['CDEMPNOME'] ?? item['NOME'] ?? 'Sem Nome';
          final int id = item['CDEMPID'] ?? item['ID'] ?? 0;

          empresasNomes.add(nome);
          _empresasMap[nome] = id;
        }
      }
    }catch (e) {
      errorMessage = "Erro ao carregar empresas: $e";
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> login(BuildContext context) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners(); // Manda o evento de loading para a view

    if (usuarioController.text.trim().isEmpty || senhaController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Preencha todas as informações!"), backgroundColor: Colors.red,),
      );
      return;
    }

    final int? empresaIdSelecionada = _empresasMap[empresaController.text];

    if (empresaIdSelecionada == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Selecione uma empresa válida."),
          backgroundColor: Colors.red, // Cor de erro
        ),
      );
      return;
    }

    try {
      final loginData = LoginModel(usuario: usuarioController.text.trim(), senha: senhaController.text.trim(), empresa: empresaIdSelecionada.toString());

      final response = await WebClient.getData(WebClient.cdSenha, queryParameters: {
        'CDSEEMAIL': loginData.usuario,
        'CDSESENHA': loginData.senha,
        "empresa": loginData.empresa
      });

      final List<dynamic> dados = jsonDecode(response.body);

      if (response.statusCode == 200 && dados.isNotEmpty) {
        if (context.mounted) {
          print("Login realizado com sucesso!");
          MyApp.dadosUsuario = dados[0];
          MyApp.empresaId = loginData.empresa;

          final cargo = dados[0]['CDCARNOME'];
          MyApp.isCliente = cargo.toString().toUpperCase() == 'CLIENTE';
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Login realizado com sucesso!'),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.of(context).pushReplacementNamed(Routes.basePage);
        }
      } else {
        final msgErro = "Falha no login. Verifique as informações.";
        errorMessage = msgErro;

        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(msgErro),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    } catch (e) {
      // errorMessage = "Erro de conexão: $e";
      errorMessage = "Erro de conexão: Verifique as informações!";

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage!),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
