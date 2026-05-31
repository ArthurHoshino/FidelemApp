import 'package:fidelem_app/core/data/models/usuario_entity.dart';
import 'package:flutter/material.dart';
import 'package:fidelem_app/core/services/web_client.dart';
import 'package:fidelem_app/modules/auth/login/login_model.dart';
import 'package:fidelem_app/routes.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart'; 
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
    // 1. Validação para não enviar campos de texto vazios
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

    isLoading = true;
    errorMessage = null;
    notifyListeners(); 

    try {
      // 2. APLICAÇÃO DO HASH SHA-256 NA SENHA
      final String senhaPlana = senhaController.text;
      final bytesDaSenha = utf8.encode(senhaPlana); 
      final String senhaComHash = sha256.convert(bytesDaSenha).toString(); 

      // print('========================================================================');
      // print('[TESTE] E-mail enviado: ${usuarioController.text.trim()}');
      // print('[TESTE] Hash SHA-256 gerado: $senhaComHash');
      // print('[TESTE] Empresa ID: $empresaIdSelecionada');
      // print('========================================================================');

      final loginData = LoginModel(
        usuario: usuarioController.text.trim(), 
        senha: senhaComHash, 
        empresa: empresaIdSelecionada.toString()
      );

      // CORREÇÃO: Alterado os parâmetros de consulta para letras MINÚSCULAS 
      // para bater exatamente com o que a sua API/Banco mapeiam (padrão do seu arquivo Registro)
      final response = await WebClient.getData(WebClient.cdSenha, queryParameters: {
        'cdseemail': loginData.usuario,
        'cdsesenha': loginData.senha,
        'empresa': loginData.empresa
      });

      // Evita falha se a API retornar um corpo nulo ou string vazia
      final List<dynamic> dados = response.body.isNotEmpty ? jsonDecode(response.body) : [];

      if (response.statusCode == 200 && dados.isNotEmpty) {
        if (context.mounted) {
          MyApp.dadosUsuario = UsuarioEntity.fromMap(dados[0]);
          MyApp.empresaId = loginData.empresa;

          MyApp.isCliente = MyApp.dadosUsuario!.isCliente;
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