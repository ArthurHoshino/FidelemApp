import 'package:fidelem_app/core/data/enums/enums.dart';
import 'package:fidelem_app/core/data/models/entidade_modelo.dart';

class ProdutoEntity extends EntidadeModelo {
  final String nome;
  final double precoReal;
  final int precoPonto;
  final double? precoDesconto;
  final int qtdEstoque;
  final String? imagem;

  const ProdutoEntity({
    required super.id,
    required super.descricao,
    required this.nome,
    this.precoReal = 0,
    this.precoPonto = 0,
    this.precoDesconto,
    required this.qtdEstoque,
    this.imagem,
  });

  factory ProdutoEntity.fromMap(Map<String, dynamic> map) {
    return ProdutoEntity(
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

  @override
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

  @override
  dynamic getPropriedade(String? prop) {
    if (prop == null) return null;

    if (prop == CDProdutoEnum.produtoEntityPrecoReal.value) {
      return precoReal;
    } else if (prop == CDProdutoEnum.produtoEntityPrecoPonto.value) {
      return precoDesconto;
    } else if (prop == CDProdutoEnum.produtoEntityPrecoDesconto.value) {
      return precoDesconto;
    } else if (prop == CDProdutoEnum.produtoEntityImagem.value) {
      return imagem;
    } else {
      return super.getPropriedade(prop);
    }
  }

  @override
  ProdutoEntity copyWith({
    Updater<int>? id,
    Updater<String>? descricao,
    Updater<DateTime>? dataCriacao,
    Updater<DateTime>? dataAtualizacao,
    Updater<String>? nome,
    Updater<double>? precoReal,
    Updater<int>? precoPonto,
    Updater<double>? precoDesconto,
    Updater<int>? qtdEstoque,
    Updater<String>? imagem,
  }) {
    return ProdutoEntity(
      id: id != null ? id.value! : this.id,
      descricao: descricao != null ? descricao.value! : this.descricao,
      nome: nome != null ? nome.value! : this.nome,
      precoReal: precoReal != null ? precoReal.value! : this.precoReal,
      precoPonto: precoPonto != null ? precoPonto.value! : this.precoPonto,
      precoDesconto: precoDesconto != null ? precoDesconto.value : this.precoDesconto,
      qtdEstoque: qtdEstoque != null ? qtdEstoque.value! : this.qtdEstoque,
      imagem: imagem != null ? imagem.value : this.imagem,
    );
  }
}