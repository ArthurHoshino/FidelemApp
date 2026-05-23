enum CDCargoEnum {
  tabela('CDCARGO'),
  id('CDCARID'),
  nome('CDCARNOME'),
  empresaId('CDCAREMPRESAID'),

  // Enums para as propriedades da entidade
  cargoEntityNome('nome'),
  cargoEntityEmpresaId('empresaId');

  final String value;
  const CDCargoEnum(this.value);
}