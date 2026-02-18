import 'package:fidelem_app/modules/auth/redefinir_senha/redefinir_senha_model.dart';
import 'package:flutter/material.dart';
import 'package:fidelem_app/core/services/web_client.dart';
import 'package:fidelem_app/routes.dart';
import 'dart:convert';
import 'package:fidelem_app/core/widgets/fid_select_controller.dart';

class RedefinirSenhaViewmodel extends ChangeNotifier {
  // Controladores para pegarem o texto da view
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaAntigaController = TextEditingController();
  final TextEditingController senhaNovaController = TextEditingController();
  final TextEditingController senhaNovaConfirmaController = TextEditingController();
  final FIDSelectController empresaController = FIDSelectController();

  // Estado da tela
  bool isLoading = false;
  String? errorMessage;
  List<String> empresasNomes = [];
  final Map<String, int> _empresasMap = {};

  RedefinirSenhaViewmodel() {
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

  Future<void> redefinir(BuildContext context) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      if (senhaAntigaController.text.trim().isEmpty || emailController.text.trim().isEmpty ||
          senhaNovaController.text.trim().isEmpty || senhaNovaConfirmaController.text.trim().isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Preencha todas as informações!")),
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
      
      // Verifica se foi digitada a mesma senha no campo de "Confirma"
      if (senhaNovaController.text != senhaNovaConfirmaController.text) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("A confirmação de senha deve ser igual a senha informada!"),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      final redefinirData = RedefinirSenhaModel(email: emailController.text, senhaAntiga: senhaAntigaController.text, senhaNova: senhaNovaController.text, senhaNovaConfirma: senhaNovaConfirmaController.text, empresa: empresaIdSelecionada.toString());
      
      final response = await WebClient.getData(WebClient.cdSenha, queryParameters: {
        'CDSEEMAIL': redefinirData.email,
        'CDSESENHA': redefinirData.senhaAntiga,
        "empresa": redefinirData.empresa
      });

      final List<dynamic> dados = jsonDecode(response.body);

      final data = {
        "cdseid": dados[0]['CDSEID'],
        "cdsenome": dados[0]['CDSENOME'],
        "cdsesenha": redefinirData.senhaNova,
        "cdsecpfcnpj": dados[0]['CDSECPFCNPJ'],
        "cdseemail": dados[0]['CDSEEMAIL'],
        "cdsetelefone": dados[0]['CDSETELEFONE'],
        "cdsecargoid": dados[0]['CDSECARGOID'],
        "empresa": redefinirData.empresa
      };

      if (response.statusCode == 200 && dados.isNotEmpty) {
        final atualizaDados = await WebClient.sendData(endpoint: WebClient.cdSenha, method: HttpMethod.put, data: data);
        
        if (atualizaDados.statusCode == 201) {
          if (context.mounted) {
            print("Senha redefinida com sucesso!");
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Senha redefinida com sucesso!'),
                backgroundColor: Colors.green,
              ),
            );
            Navigator.of(context).pushReplacementNamed(Routes.loginPage);
          }
        }
      } else {
        final msgErro = "Usuário não localizado. Verifique suas credenciais.";
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