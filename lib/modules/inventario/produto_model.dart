import 'dart:io';

import 'package:flutter/material.dart';

class ProdutoModel {
  final String nome;
  final String codigo;
  final String desc;
  final int qtdEstoque;
  final double precoDinheiro;
  final double precoPontos;
  final List<File> fotos;


  ProdutoModel({
    required this.nome,
    required this.codigo,
    required this.desc,
    required this.qtdEstoque,
    required this.precoDinheiro,
    required this.precoPontos,
    required this.fotos,

  });

// IMPLEMENTAR METODO QUE CONVERTE FILE PARA IMAGE E VICE VERSA


  Map<String, dynamic> infoItem() {
    return {
      "nome" : nome,
      "codigo" : codigo,
      "desc" : desc,
      "qtdEstoque" : qtdEstoque,
      "precoDinheiro" : precoDinheiro,
      "precoPontos" : precoPontos,
      "fotos" : fotos,
    };
  }

}