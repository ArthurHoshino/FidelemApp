enum CDProdutoEnum {
  tabela('CDPRODUTO'),
  id('CDPRODID'),
  nome('CDPRODNOME'),
  descricaoProduto('CDPRODDESCRICAO'),
  precoReal('CDPRODPRECOREAL'),
  precoPonto('CDPRODPRECOPONTO'),
  precoDesconto('CDPRODPRECODESCONTO'),
  qtdEstoque('CDPRODQTDESTOQUE'),
  empresaId('CDPRODEMPRESAID'),
  categoriaId('CDPRODCATEGORIAID'),
  imagem('CDPRODIMGID'),

  // Campos da entidade
  produtoEntityPrecoReal('precoReal'),
  produtoEntityPrecoPonto('precoPronto'),
  produtoEntityPrecoDesconto('precoDesconto'),
  produtoEntityImagem('imagem');

  final String value;
  const CDProdutoEnum(this.value);
}
