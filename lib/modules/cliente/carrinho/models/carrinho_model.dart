import 'package:fidelem_app/core/data/models/model_entity.dart';
import 'package:fidelem_app/database/database.dart';

class CarrinhoModel extends ModelEntity {
  final LCCARRINHOData carrinhoData;
  final double preco;
  final String imagem;

  const CarrinhoModel({
    required super.id,
    required super.descricao,
    required this.carrinhoData,
    required this.preco,
    required this.imagem,
  });

  String get nome => descricao;

  double get totalItemPrice => preco * carrinhoData.lcCarQuantidade;

  static CarrinhoModel? montarComDadosLoja({
    required LCCARRINHOData carrinhoData,
    required Map<String, dynamic> dadosProduto,
  }) {
    return CarrinhoModel(
      id: carrinhoData.lcCarProdutoId,
      descricao: dadosProduto['nome'] as String,
      carrinhoData: carrinhoData,
      preco: (dadosProduto['preco'] as num).toDouble(),
      imagem: dadosProduto['imagem'] as String,
    );
  }
}
