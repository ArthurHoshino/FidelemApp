import 'package:fidelem_app/database/database.dart';

class CarrinhoModel {
  final LCCARRINHOData carrinhoData;
  final String nome;
  final double preco;
  final String imagem;

  CarrinhoModel({
    required this.carrinhoData, 
    required this.nome, 
    required this.preco, 
    required this.imagem
  });

  double get totalItemPrice => preco * carrinhoData.lcCarQuantidade;
}