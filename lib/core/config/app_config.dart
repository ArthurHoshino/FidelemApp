import 'package:flutter/foundation.dart';

/// Configurações gerais do aplicativo carregadas a partir de variáveis de ambiente.
///
/// Permite compilar ou executar o projeto usando arquivos de configuração JSON:
/// `flutter run --dart-define-from-file=environments/development.json`
/// ou
/// `flutter run --dart-define-from-file=environments/production.json`
class AppConfig {
  /// Define o ambiente ('dev' ou 'prod').
  static const String environment = String.fromEnvironment('ENV', defaultValue: 'dev');

  /// URL Base da API definida via --dart-define ou --dart-define-from-file.
  static const String _apiBaseUrl = String.fromEnvironment('API_BASE_URL');

  /// Retorna a URL Base da API conforme o ambiente atual.
  ///
  /// Ordem de prioridade:
  /// 1. Valor explícito passado em tempo de compilação via [API_BASE_URL].
  /// 2. URL de produção se o ambiente estiver configurado como 'prod' ou se
  ///    o app estiver rodando em Release ou Profile mode.
  /// 3. URL de desenvolvimento (local) para os demais casos.
  static String get apiBaseUrl {
    if (_apiBaseUrl.isNotEmpty) {
      return _apiBaseUrl;
    }

    if (environment == 'prod' || kReleaseMode || kProfileMode) {
      return 'https://natallie.tail81085c.ts.net';
    }

    return 'http://127.0.0.1:3000';
  }
}
