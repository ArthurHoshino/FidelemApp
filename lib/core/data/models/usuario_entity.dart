import 'package:fidelem_app/core/data/enums/enums.dart';
import 'package:fidelem_app/core/data/models/entidade_modelo.dart';

class UsuarioEntity extends EntidadeModelo {
  final String email;
  final String senha;
  final int idCargo;
  final String nomeCargo;
  final String? telefone;
  final String cpfcnpj;
  final String empresa;
  final int pontos;

  const UsuarioEntity({
    required super.id,
    required super.descricao,
    required this.email,
    required this.senha,
    required this.idCargo,
    required this.nomeCargo,
    this.telefone,
    required this.cpfcnpj,
    required this.empresa,
    required this.pontos,
  });

  factory UsuarioEntity.fromMap(Map<String, dynamic> map) {
    return UsuarioEntity(
      id: map[CDSenhaEnum.id.value]?.toInt() ?? 0,
      descricao: map[CDSenhaEnum.nome.value] ?? '',
      email: map[CDSenhaEnum.email.value] ?? '',
      senha: map[CDSenhaEnum.senha.value],
      idCargo: map[CDSenhaEnum.cargo.value]!.toInt(),
      nomeCargo: map[CDCargoEnum.nome.value],
      telefone: map[CDSenhaEnum.telefone.value],
      cpfcnpj: map[CDSenhaEnum.cpfcnpj.value],
      empresa: map[CDSenhaEnum.empresa.value],
      pontos: map[CDSenhaEnum.pontos.value]?.toInt() ?? 0,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      CDSenhaEnum.id.value: id,
      CDSenhaEnum.nome.value: descricao,
      CDSenhaEnum.email.value: email,
      CDSenhaEnum.senha.value: senha,
      CDSenhaEnum.cargo.value: idCargo,
      CDCargoEnum.nome.value: nomeCargo,
      CDSenhaEnum.telefone.value: telefone,
      CDSenhaEnum.cpfcnpj.value: cpfcnpj,
      CDSenhaEnum.empresa.value: empresa,
      CDSenhaEnum.pontos.value: pontos,
    };
  }

  @override
  dynamic getPropriedade(String? prop) {
    if (prop == null) return null;

    if (prop == CDSenhaEnum.usuarioEntityEmail.value) {
      return email;
    } else if (prop == CDSenhaEnum.usuarioEntitySenha.value) {
      return senha;
    } else if (prop == CDSenhaEnum.usuarioEntityIdCargo.value) {
      return idCargo;
    } else if (prop == CDSenhaEnum.usuarioEntityNomeCargo.value) {
      return nomeCargo;
    } else if (prop == CDSenhaEnum.usuarioEntityTelefone.value) {
      return telefone;
    } else if (prop == CDSenhaEnum.usuarioEntityCpfCnpj.value) {
      return cpfcnpj;
    } else if (prop == CDSenhaEnum.usuarioEntityEmpresa.value) {
      return empresa;
    } else if (prop == CDSenhaEnum.usuarioEntityPontos.value) {
      return pontos;
    } else {
      return super.getPropriedade(prop);
    }
  }

  bool get isCliente => nomeCargo.toUpperCase() == 'CLIENTE';

  @override
  UsuarioEntity copyWith({
    Updater<int>? id,
    Updater<String>? descricao,
    Updater<DateTime>? dataCriacao,
    Updater<DateTime>? dataAtualizacao,
    Updater<String>? email,
    Updater<String>? senha,
    Updater<int>? idCargo,
    Updater<String>? nomeCargo,
    Updater<String>? telefone,
    Updater<String>? cpfcnpj,
    Updater<String>? empresa,
    Updater<int>? pontos,
  }) {
    return UsuarioEntity(
      id: id != null ? id.value! : this.id,
      descricao: descricao != null ? descricao.value! : this.descricao,
      email: email != null ? email.value! : this.email,
      senha: senha != null ? senha.value! : this.senha,
      idCargo: idCargo != null ? idCargo.value! : this.idCargo,
      nomeCargo: nomeCargo != null ? nomeCargo.value! : this.nomeCargo,
      telefone: telefone != null ? telefone.value : this.telefone,
      cpfcnpj: cpfcnpj != null ? cpfcnpj.value! : this.cpfcnpj,
      empresa: empresa != null ? empresa.value! : this.empresa,
      pontos: pontos != null ? pontos.value! : this.pontos,
    );
  }
}