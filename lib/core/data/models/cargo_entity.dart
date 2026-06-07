import 'package:fidelem_app/core/data/enums/enums.dart';
import 'package:fidelem_app/core/data/models/entidade_modelo.dart';

  class CargoEntity extends EntidadeModelo {
  final String empresaId;

  const CargoEntity({
    required super.id,
    required super.descricao,
    required this.empresaId,
  });

  factory CargoEntity.fromMap(Map<String, dynamic> map) {
    return CargoEntity(
      id: map[CDCargoEnum.id.value]?.toInt() ?? 0,
      descricao: map[CDCargoEnum.nome.value] ?? '',
      empresaId: (map[CDCargoEnum.empresaId.value] ?? '').toString(),
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      CDCargoEnum.id.value: id,
      CDCargoEnum.nome.value: descricao,
      CDCargoEnum.empresaId.value: empresaId,
    };
  }

  @override
  dynamic getPropriedade(String? prop) {
    if (prop == null) return null;

    if (prop == CDCargoEnum.cargoEntityEmpresaId.value) {
      return empresaId;
    } else {
      return super.getPropriedade(prop);
    }
  }

  @override
  CargoEntity copyWith({
    Updater<int>? id,
    Updater<String>? descricao,
    Updater<DateTime>? dataCriacao,
    Updater<DateTime>? dataAtualizacao,
    Updater<String>? empresaId,
  }) {
    return CargoEntity(
      id: id != null ? id.value! : this.id,
      descricao: descricao != null ? descricao.value! : this.descricao,
      empresaId: empresaId != null ? empresaId.value! : this.empresaId,
    );
  }
}
