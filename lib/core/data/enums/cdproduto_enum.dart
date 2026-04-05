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
  imagem('CDPRODIMGID');

  final String value;
  const CDProdutoEnum(this.value);
}
