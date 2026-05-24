import 'package:fidelem_app/core/data/enums/enums.dart';

abstract class EntidadeModelo {
  final int id;
  final String descricao;
  final DateTime? dataCriacao;
  final DateTime? dataAtualizacao;

  const EntidadeModelo({
    required this.id,
    required this.descricao,
    this.dataCriacao,
    this.dataAtualizacao,
  });

  dynamic getPropriedade(String? prop) {
    if (prop == null) return null;
    
    if (prop == EnumGenerico.modelID.descricao) {
      return id;
    } else if (prop == EnumGenerico.modelDescricao.descricao) {
      return descricao;
    } else if (prop == EnumGenerico.modelDataCriacao.descricao) {
      return dataCriacao;
    } else if (prop == EnumGenerico.modelDataAtualizacao.descricao) {
      return dataAtualizacao;
    } else {
      throw ArgumentError('Propriedade "$prop" não encontrada na entidade.');
    }
  }

  // Define contratos obrigatórios que as classes filhas deverão implementar
  Map<String, dynamic> toMap();

  EntidadeModelo copyWith();
}

class Updater<T> {
  final T? value;
  
  const Updater(this.value);
  
  const Updater.setNull() : value = null;
}
