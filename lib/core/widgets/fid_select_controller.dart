import 'package:flutter/material.dart';

// Ele herda de ValueNotifier para avisar a tela quando o valor mudar
class FIDSelectController extends ValueNotifier<String?> {
  FIDSelectController({String? initialValue}) : super(initialValue);

  // Getter e Setter práticos para facilitar a leitura/escrita
  String? get text => value;
  set text(String? newValue) => value = newValue;

  void clear() => value = null;
}