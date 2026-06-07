enum CDPrivilegioEnum {
  tabela('CDPRIVILEGIO'),
  id('CDPRIVID'),
  chave('CDPRIVCHAVE'),
  nome('CDPRIVNOME'),
  modulo('CDPRIVMODULO'),

  // Enums para as propriedades da entidade
  privilegioEntityChave('chave'),
  privilegioEntityNome('nome'),
  privilegioEntityModulo('modulo');

  final String value;
  const CDPrivilegioEnum(this.value);
}
