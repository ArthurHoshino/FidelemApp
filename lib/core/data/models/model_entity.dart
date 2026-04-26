class ModelEntity {
  final int id;
  final String descricao;
  final DateTime? dataCriacao;
  final DateTime? dataAtualizacao;

  const ModelEntity({
    required this.id,
    required this.descricao,
    this.dataCriacao,
    this.dataAtualizacao,
  });
}