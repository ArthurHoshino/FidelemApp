class LojaPontosModel {
  final String id;
  final String nome;
  final double preco;
  final int pontos;
  final String imagem;
  final int quantidadeNoCarrinho;

  LojaPontosModel({
    required this.id,
    required this.nome,
    required this.preco,
    required this.pontos,
    required this.imagem,
    this.quantidadeNoCarrinho = 0,
  });
}