import 'package:fidelem_app/core/data/enums/enums.dart';
import 'package:fidelem_app/core/data/models/model_entity.dart';

class ProdutoModel extends ModelEntity {
  final String nome;
  final double precoReal;
  final int precoPonto;
  final double? precoDesconto;
  final int qtdEstoque;
  final String? imagem;

  const ProdutoModel({
    required super.id,
    required super.descricao,
    required this.nome,
    this.precoReal = 0,
    this.precoPonto = 0,
    this.precoDesconto,
    required this.qtdEstoque,
    this.imagem,
  });

  static ProdutoModel? fromMap(Map<String, dynamic> map) {
    if (map.isEmpty) return null;

    return ProdutoModel(
      id: map[CDProdutoEnum.id.value]!.toInt(),
      nome: map[CDProdutoEnum.nome.value] as String,
      descricao: map[CDProdutoEnum.descricaoProduto.value] as String,
      precoReal: double.tryParse(map[CDProdutoEnum.precoReal.value]?.toString() ?? '') ?? 0,
      precoPonto: map[CDProdutoEnum.precoPonto.value] ?? 0,
      precoDesconto: double.tryParse(map[CDProdutoEnum.precoDesconto.value]?.toString() ?? ''),
      qtdEstoque: map[CDProdutoEnum.qtdEstoque.value] ?? 0,
      imagem: map[CDProdutoEnum.imagem.value] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    return Map.fromEntries(
      [
        MapEntry(CDProdutoEnum.id.value, id),
        MapEntry(CDProdutoEnum.descricaoProduto.value, descricao),
        MapEntry(CDProdutoEnum.nome.value, nome),
        MapEntry(CDProdutoEnum.precoReal.value, precoReal),
        MapEntry(CDProdutoEnum.precoPonto.value, precoPonto),
        MapEntry(CDProdutoEnum.precoDesconto.value, precoDesconto),
        MapEntry(CDProdutoEnum.qtdEstoque.value, qtdEstoque),
        MapEntry(CDProdutoEnum.imagem.value, imagem),
      ]
    );
  }
}