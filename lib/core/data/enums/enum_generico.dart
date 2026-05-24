enum EnumGenerico {
  // Enums das propriedades genéricas das models
  modelID('id'),
  modelDescricao('descricao'),
  modelDataCriacao('dataCriacao'),
  modelDataAtualizacao('dataAtualizacao');

  final String descricao;
  const EnumGenerico(this.descricao);
}