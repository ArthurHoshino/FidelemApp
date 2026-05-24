enum CDSenhaEnum {
  tabela('CDSENHA'),
  id('CDSEID'),
  nome('CDSENOME'),
  senha('CDSESENHA'),
  cpfcnpj('CDSECPFCNPJ'),
  email('CDSEEMAIL'),
  telefone('CDSETELEFONE'),
  cargo('CDSECARGOID'),
  empresa('CDEMPNOME'),
  
  // Enums para as propriedades da model
  usuarioEntityEmail('email'),
  usuarioEntitySenha('senha'),
  usuarioEntityIdCargo('idCargo'),
  usuarioEntityNomeCargo('nomeCargo'),
  usuarioEntityTelefone('telefone'),
  usuarioEntityCpfCnpj('cpfcnpj'),
  usuarioEntityEmpresa('empresa');

  final String value;
  const CDSenhaEnum(this.value);
}