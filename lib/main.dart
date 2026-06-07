import 'dart:convert';
import 'package:fidelem_app/core/services/web_client.dart';
import 'package:fidelem_app/core/data/models/usuario_entity.dart';
import 'package:flutter/material.dart';
import 'package:fidelem_app/database/database.dart';
import 'package:fidelem_app/routes.dart';
import 'package:fidelem_app/core/tema/tema.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  appDatabase = AppDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static final ValueNotifier<UsuarioEntity?> dadosUsuarioNotifier = ValueNotifier<UsuarioEntity?>(null);

  static UsuarioEntity? get dadosUsuario => dadosUsuarioNotifier.value;
  static set dadosUsuario(UsuarioEntity? value) {
    dadosUsuarioNotifier.value = value;
  }

  static String? empresaId;
  static bool isCliente = false;
  static Set<String> privilegios = {};

  static Future<void> refreshUsuario() async {
    if (dadosUsuario == null || empresaId == null) return;
    try {
      final response = await WebClient.getData(WebClient.cdSenha, queryParameters: {
        'cdseid': dadosUsuario!.id,
        'empresa': empresaId!,
      });
      if (response.statusCode == 200) {
        final List<dynamic> dados = jsonDecode(response.body);
        if (dados.isNotEmpty) {
          dadosUsuario = UsuarioEntity.fromMap(dados[0]);
        }
      }
    } catch (e) {
      debugPrint('Erro ao atualizar dados do usuário: $e');
    }
  }

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fidelem App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Cor.azul,
        ),
      ),
      initialRoute: Routes.loginPage,
      routes: Routes.rotas,
    );
  }
}