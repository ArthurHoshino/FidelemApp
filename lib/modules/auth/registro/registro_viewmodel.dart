import 'package:fidelem_app/modules/auth/registro/registro_model.dart';
import 'package:flutter/material.dart';
import 'package:fidelem_app/core/services/web_client.dart';
import 'package:fidelem_app/routes.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart'; 
import 'package:fidelem_app/core/widgets/fid_select_controller.dart';

class RegistroViewModel extends ChangeNotifier {
  // Controladores para pegarem o texto da view
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final TextEditingController senhaConfirmaController = TextEditingController();
  final TextEditingController cpfController = TextEditingController();
  final FIDSelectController empresaController = FIDSelectController();

  // Estado da tela
  bool isLoading = false;
  String? errorMessage;
  List<String> empresasNomes = [];
  final Map<String, int> _empresasMap = {};

  RegistroViewModel() {
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

  Future<void> registro(BuildContext context) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      // Validação de campos vazios
      if (nomeController.text.trim().isEmpty || emailController.text.trim().isEmpty ||
          senhaController.text.trim().isEmpty || cpfController.text.trim().isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Preencha todas as informações!")),
        );
        isLoading = false;
        notifyListeners(); // <--- AJUSTE: Destrava o loading na tela
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
        isLoading = false;
        notifyListeners(); // <--- AJUSTE: Destrava o loading na tela
        return;
      }

      // Verifica se foi digitada a mesma senha no campo de "Confirme"
      if (senhaController.text != senhaConfirmaController.text) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("A confirmação de senha deve ser igual a senha informada!"),
            backgroundColor: Colors.red,
          ),
        );
        isLoading = false;
        notifyListeners(); // <--- AJUSTE: Destrava o loading na tela
        return;
      }

      // Processamento seguro do Hash SHA-256 local
      final bytesDaSenha = utf8.encode(senhaController.text);
      final String senhaComHash = sha256.convert(bytesDaSenha).toString();

      final registroData = RegistroModel(
        nome: nomeController.text.trim(), 
        email: emailController.text.trim(), 
        senha: senhaComHash, 
        senhaConfirma: senhaComHash, 
        empresa: empresaIdSelecionada.toString()
      );

      // Busca o cargo passando o ID real recuperado dinamicamente
      final buscaCargo = await WebClient.getData(WebClient.cdCargo, queryParameters: {
        'CDCARNOME': 'CLIENTE',
        'cdcarempresaid' : registroData.empresa
      });

      final List<dynamic> dadosCargo = buscaCargo.body.isNotEmpty ? jsonDecode(buscaCargo.body) : [];
      final idCargo = dadosCargo.isNotEmpty ? dadosCargo[0]['CDCARID'] : 1;

      final response = await WebClient.sendData(endpoint: WebClient.cdSenha, method: HttpMethod.post, data: {
        'cdsenome': registroData.nome,
        'cdsesenha': registroData.senha,
        'cdsecpfcnpj': cpfController.text.trim(),
        'cdseemail': registroData.email,
        'cdsetelefone': null,
        'cdsecargoid': idCargo,
        'empresa': registroData.empresa
      });

      if (response.statusCode == 204) {
        // Verifica se a tela ainda está ativa antes de usar o context
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Usuário criado com sucesso!'),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.of(context).pushReplacementNamed(Routes.loginPage);
        }

      } else {
        final msgErro = jsonDecode(response.body)['error'] ?? "Falha no registro. Verifique as informações.";
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
      print('\x1B[1;31m [REGISTRO] Erro: $e \x1B[0m');
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