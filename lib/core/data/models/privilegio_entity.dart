import 'package:fidelem_app/core/data/enums/enums.dart';
import 'package:fidelem_app/core/data/models/entidade_modelo.dart';

class PrivilegioEntity extends EntidadeModelo {
  final String chave;
  final String nome;
  final String modulo;

  const PrivilegioEntity({
    required super.id,
    required super.descricao,
    required this.chave,
    required this.nome,
    required this.modulo,
  });

  factory PrivilegioEntity.fromMap(Map<String, dynamic> map) {
    return PrivilegioEntity(
      id: map[CDPrivilegioEnum.id.value]?.toInt() ?? 0,
      descricao: map[CDPrivilegioEnum.nome.value] ?? '', // A descricao padrão será o nome
      chave: map[CDPrivilegioEnum.chave.value] ?? '',
      nome: map[CDPrivilegioEnum.nome.value] ?? '',
      modulo: map[CDPrivilegioEnum.modulo.value] ?? '',
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      CDPrivilegioEnum.id.value: id,
      CDPrivilegioEnum.chave.value: chave,
      CDPrivilegioEnum.nome.value: nome,
      CDPrivilegioEnum.modulo.value: modulo,
    };
  }

  @override
  dynamic getPropriedade(String? prop) {
    if (prop == null) return null;

    if (prop == CDPrivilegioEnum.privilegioEntityChave.value) {
      return chave;
    } else if (prop == CDPrivilegioEnum.privilegioEntityNome.value) {
      return nome;
    } else if (prop == CDPrivilegioEnum.privilegioEntityModulo.value) {
      return modulo;
    } else {
      return super.getPropriedade(prop);
    }
  }

  @override
  PrivilegioEntity copyWith({
    Updater<int>? id,
    Updater<String>? descricao,
    Updater<DateTime>? dataCriacao,
    Updater<DateTime>? dataAtualizacao,
    Updater<String>? chave,
    Updater<String>? nome,
    Updater<String>? modulo,
  }) {
    return PrivilegioEntity(
      id: id != null ? id.value! : this.id,
      descricao: descricao != null ? descricao.value! : this.descricao,
      chave: chave != null ? chave.value! : this.chave,
      nome: nome != null ? nome.value! : this.nome,
      modulo: modulo != null ? modulo.value! : this.modulo,
    );
  }
}
