// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $CDEMPRESATable extends CDEMPRESA
    with TableInfo<$CDEMPRESATable, CDEMPRESAData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CDEMPRESATable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _cdEmpIdMeta = const VerificationMeta(
    'cdEmpId',
  );
  @override
  late final GeneratedColumn<int> cdEmpId = GeneratedColumn<int>(
    'CDEMPID',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _cdEmpNomeMeta = const VerificationMeta(
    'cdEmpNome',
  );
  @override
  late final GeneratedColumn<String> cdEmpNome = GeneratedColumn<String>(
    'CDEMPNOME',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 45,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [cdEmpId, cdEmpNome];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cdempresa';
  @override
  VerificationContext validateIntegrity(
    Insertable<CDEMPRESAData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('CDEMPID')) {
      context.handle(
        _cdEmpIdMeta,
        cdEmpId.isAcceptableOrUnknown(data['CDEMPID']!, _cdEmpIdMeta),
      );
    }
    if (data.containsKey('CDEMPNOME')) {
      context.handle(
        _cdEmpNomeMeta,
        cdEmpNome.isAcceptableOrUnknown(data['CDEMPNOME']!, _cdEmpNomeMeta),
      );
    } else if (isInserting) {
      context.missing(_cdEmpNomeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {cdEmpId};
  @override
  CDEMPRESAData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CDEMPRESAData(
      cdEmpId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}CDEMPID'],
      )!,
      cdEmpNome: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}CDEMPNOME'],
      )!,
    );
  }

  @override
  $CDEMPRESATable createAlias(String alias) {
    return $CDEMPRESATable(attachedDatabase, alias);
  }
}

class CDEMPRESAData extends DataClass implements Insertable<CDEMPRESAData> {
  final int cdEmpId;
  final String cdEmpNome;
  const CDEMPRESAData({required this.cdEmpId, required this.cdEmpNome});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['CDEMPID'] = Variable<int>(cdEmpId);
    map['CDEMPNOME'] = Variable<String>(cdEmpNome);
    return map;
  }

  CDEMPRESACompanion toCompanion(bool nullToAbsent) {
    return CDEMPRESACompanion(
      cdEmpId: Value(cdEmpId),
      cdEmpNome: Value(cdEmpNome),
    );
  }

  factory CDEMPRESAData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CDEMPRESAData(
      cdEmpId: serializer.fromJson<int>(json['cdEmpId']),
      cdEmpNome: serializer.fromJson<String>(json['cdEmpNome']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'cdEmpId': serializer.toJson<int>(cdEmpId),
      'cdEmpNome': serializer.toJson<String>(cdEmpNome),
    };
  }

  CDEMPRESAData copyWith({int? cdEmpId, String? cdEmpNome}) => CDEMPRESAData(
    cdEmpId: cdEmpId ?? this.cdEmpId,
    cdEmpNome: cdEmpNome ?? this.cdEmpNome,
  );
  CDEMPRESAData copyWithCompanion(CDEMPRESACompanion data) {
    return CDEMPRESAData(
      cdEmpId: data.cdEmpId.present ? data.cdEmpId.value : this.cdEmpId,
      cdEmpNome: data.cdEmpNome.present ? data.cdEmpNome.value : this.cdEmpNome,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CDEMPRESAData(')
          ..write('cdEmpId: $cdEmpId, ')
          ..write('cdEmpNome: $cdEmpNome')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(cdEmpId, cdEmpNome);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CDEMPRESAData &&
          other.cdEmpId == this.cdEmpId &&
          other.cdEmpNome == this.cdEmpNome);
}

class CDEMPRESACompanion extends UpdateCompanion<CDEMPRESAData> {
  final Value<int> cdEmpId;
  final Value<String> cdEmpNome;
  const CDEMPRESACompanion({
    this.cdEmpId = const Value.absent(),
    this.cdEmpNome = const Value.absent(),
  });
  CDEMPRESACompanion.insert({
    this.cdEmpId = const Value.absent(),
    required String cdEmpNome,
  }) : cdEmpNome = Value(cdEmpNome);
  static Insertable<CDEMPRESAData> custom({
    Expression<int>? cdEmpId,
    Expression<String>? cdEmpNome,
  }) {
    return RawValuesInsertable({
      if (cdEmpId != null) 'CDEMPID': cdEmpId,
      if (cdEmpNome != null) 'CDEMPNOME': cdEmpNome,
    });
  }

  CDEMPRESACompanion copyWith({Value<int>? cdEmpId, Value<String>? cdEmpNome}) {
    return CDEMPRESACompanion(
      cdEmpId: cdEmpId ?? this.cdEmpId,
      cdEmpNome: cdEmpNome ?? this.cdEmpNome,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (cdEmpId.present) {
      map['CDEMPID'] = Variable<int>(cdEmpId.value);
    }
    if (cdEmpNome.present) {
      map['CDEMPNOME'] = Variable<String>(cdEmpNome.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CDEMPRESACompanion(')
          ..write('cdEmpId: $cdEmpId, ')
          ..write('cdEmpNome: $cdEmpNome')
          ..write(')'))
        .toString();
  }
}

class $CDCARGOTable extends CDCARGO with TableInfo<$CDCARGOTable, CDCARGOData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CDCARGOTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _cdCaridMeta = const VerificationMeta(
    'cdCarid',
  );
  @override
  late final GeneratedColumn<int> cdCarid = GeneratedColumn<int>(
    'CDCARID',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _cdCarNomeMeta = const VerificationMeta(
    'cdCarNome',
  );
  @override
  late final GeneratedColumn<String> cdCarNome = GeneratedColumn<String>(
    'CDCARNOME',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 45,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cdCarEmpresaIdMeta = const VerificationMeta(
    'cdCarEmpresaId',
  );
  @override
  late final GeneratedColumn<int> cdCarEmpresaId = GeneratedColumn<int>(
    'CDCAREMPRESAID',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES cdempresa (CDEMPID)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [cdCarid, cdCarNome, cdCarEmpresaId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cdcargo';
  @override
  VerificationContext validateIntegrity(
    Insertable<CDCARGOData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('CDCARID')) {
      context.handle(
        _cdCaridMeta,
        cdCarid.isAcceptableOrUnknown(data['CDCARID']!, _cdCaridMeta),
      );
    }
    if (data.containsKey('CDCARNOME')) {
      context.handle(
        _cdCarNomeMeta,
        cdCarNome.isAcceptableOrUnknown(data['CDCARNOME']!, _cdCarNomeMeta),
      );
    } else if (isInserting) {
      context.missing(_cdCarNomeMeta);
    }
    if (data.containsKey('CDCAREMPRESAID')) {
      context.handle(
        _cdCarEmpresaIdMeta,
        cdCarEmpresaId.isAcceptableOrUnknown(
          data['CDCAREMPRESAID']!,
          _cdCarEmpresaIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_cdCarEmpresaIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {cdCarid};
  @override
  CDCARGOData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CDCARGOData(
      cdCarid: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}CDCARID'],
      )!,
      cdCarNome: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}CDCARNOME'],
      )!,
      cdCarEmpresaId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}CDCAREMPRESAID'],
      )!,
    );
  }

  @override
  $CDCARGOTable createAlias(String alias) {
    return $CDCARGOTable(attachedDatabase, alias);
  }
}

class CDCARGOData extends DataClass implements Insertable<CDCARGOData> {
  final int cdCarid;
  final String cdCarNome;
  final int cdCarEmpresaId;
  const CDCARGOData({
    required this.cdCarid,
    required this.cdCarNome,
    required this.cdCarEmpresaId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['CDCARID'] = Variable<int>(cdCarid);
    map['CDCARNOME'] = Variable<String>(cdCarNome);
    map['CDCAREMPRESAID'] = Variable<int>(cdCarEmpresaId);
    return map;
  }

  CDCARGOCompanion toCompanion(bool nullToAbsent) {
    return CDCARGOCompanion(
      cdCarid: Value(cdCarid),
      cdCarNome: Value(cdCarNome),
      cdCarEmpresaId: Value(cdCarEmpresaId),
    );
  }

  factory CDCARGOData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CDCARGOData(
      cdCarid: serializer.fromJson<int>(json['cdCarid']),
      cdCarNome: serializer.fromJson<String>(json['cdCarNome']),
      cdCarEmpresaId: serializer.fromJson<int>(json['cdCarEmpresaId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'cdCarid': serializer.toJson<int>(cdCarid),
      'cdCarNome': serializer.toJson<String>(cdCarNome),
      'cdCarEmpresaId': serializer.toJson<int>(cdCarEmpresaId),
    };
  }

  CDCARGOData copyWith({
    int? cdCarid,
    String? cdCarNome,
    int? cdCarEmpresaId,
  }) => CDCARGOData(
    cdCarid: cdCarid ?? this.cdCarid,
    cdCarNome: cdCarNome ?? this.cdCarNome,
    cdCarEmpresaId: cdCarEmpresaId ?? this.cdCarEmpresaId,
  );
  CDCARGOData copyWithCompanion(CDCARGOCompanion data) {
    return CDCARGOData(
      cdCarid: data.cdCarid.present ? data.cdCarid.value : this.cdCarid,
      cdCarNome: data.cdCarNome.present ? data.cdCarNome.value : this.cdCarNome,
      cdCarEmpresaId: data.cdCarEmpresaId.present
          ? data.cdCarEmpresaId.value
          : this.cdCarEmpresaId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CDCARGOData(')
          ..write('cdCarid: $cdCarid, ')
          ..write('cdCarNome: $cdCarNome, ')
          ..write('cdCarEmpresaId: $cdCarEmpresaId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(cdCarid, cdCarNome, cdCarEmpresaId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CDCARGOData &&
          other.cdCarid == this.cdCarid &&
          other.cdCarNome == this.cdCarNome &&
          other.cdCarEmpresaId == this.cdCarEmpresaId);
}

class CDCARGOCompanion extends UpdateCompanion<CDCARGOData> {
  final Value<int> cdCarid;
  final Value<String> cdCarNome;
  final Value<int> cdCarEmpresaId;
  const CDCARGOCompanion({
    this.cdCarid = const Value.absent(),
    this.cdCarNome = const Value.absent(),
    this.cdCarEmpresaId = const Value.absent(),
  });
  CDCARGOCompanion.insert({
    this.cdCarid = const Value.absent(),
    required String cdCarNome,
    required int cdCarEmpresaId,
  }) : cdCarNome = Value(cdCarNome),
       cdCarEmpresaId = Value(cdCarEmpresaId);
  static Insertable<CDCARGOData> custom({
    Expression<int>? cdCarid,
    Expression<String>? cdCarNome,
    Expression<int>? cdCarEmpresaId,
  }) {
    return RawValuesInsertable({
      if (cdCarid != null) 'CDCARID': cdCarid,
      if (cdCarNome != null) 'CDCARNOME': cdCarNome,
      if (cdCarEmpresaId != null) 'CDCAREMPRESAID': cdCarEmpresaId,
    });
  }

  CDCARGOCompanion copyWith({
    Value<int>? cdCarid,
    Value<String>? cdCarNome,
    Value<int>? cdCarEmpresaId,
  }) {
    return CDCARGOCompanion(
      cdCarid: cdCarid ?? this.cdCarid,
      cdCarNome: cdCarNome ?? this.cdCarNome,
      cdCarEmpresaId: cdCarEmpresaId ?? this.cdCarEmpresaId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (cdCarid.present) {
      map['CDCARID'] = Variable<int>(cdCarid.value);
    }
    if (cdCarNome.present) {
      map['CDCARNOME'] = Variable<String>(cdCarNome.value);
    }
    if (cdCarEmpresaId.present) {
      map['CDCAREMPRESAID'] = Variable<int>(cdCarEmpresaId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CDCARGOCompanion(')
          ..write('cdCarid: $cdCarid, ')
          ..write('cdCarNome: $cdCarNome, ')
          ..write('cdCarEmpresaId: $cdCarEmpresaId')
          ..write(')'))
        .toString();
  }
}

class $CDSENHATable extends CDSENHA with TableInfo<$CDSENHATable, CDSENHAData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CDSENHATable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _cdSeIdMeta = const VerificationMeta('cdSeId');
  @override
  late final GeneratedColumn<int> cdSeId = GeneratedColumn<int>(
    'CDSEID',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _cdSeNomeMeta = const VerificationMeta(
    'cdSeNome',
  );
  @override
  late final GeneratedColumn<String> cdSeNome = GeneratedColumn<String>(
    'CDSENOME',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 255,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cdSeSenhaMeta = const VerificationMeta(
    'cdSeSenha',
  );
  @override
  late final GeneratedColumn<String> cdSeSenha = GeneratedColumn<String>(
    'CDSESENHA',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cdSeCpfCnpjMeta = const VerificationMeta(
    'cdSeCpfCnpj',
  );
  @override
  late final GeneratedColumn<String> cdSeCpfCnpj = GeneratedColumn<String>(
    'CDSECPFCNPJ',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 14,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _cdSeEmailMeta = const VerificationMeta(
    'cdSeEmail',
  );
  @override
  late final GeneratedColumn<String> cdSeEmail = GeneratedColumn<String>(
    'CDSEEMAIL',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 255,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cdSeTelefoneMeta = const VerificationMeta(
    'cdSeTelefone',
  );
  @override
  late final GeneratedColumn<String> cdSeTelefone = GeneratedColumn<String>(
    'CDSETELEFONE',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 45,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _cdSeCargoIdMeta = const VerificationMeta(
    'cdSeCargoId',
  );
  @override
  late final GeneratedColumn<int> cdSeCargoId = GeneratedColumn<int>(
    'CDSECARGOID',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES cdcargo (CDCARID)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    cdSeId,
    cdSeNome,
    cdSeSenha,
    cdSeCpfCnpj,
    cdSeEmail,
    cdSeTelefone,
    cdSeCargoId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cdsenha';
  @override
  VerificationContext validateIntegrity(
    Insertable<CDSENHAData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('CDSEID')) {
      context.handle(
        _cdSeIdMeta,
        cdSeId.isAcceptableOrUnknown(data['CDSEID']!, _cdSeIdMeta),
      );
    }
    if (data.containsKey('CDSENOME')) {
      context.handle(
        _cdSeNomeMeta,
        cdSeNome.isAcceptableOrUnknown(data['CDSENOME']!, _cdSeNomeMeta),
      );
    } else if (isInserting) {
      context.missing(_cdSeNomeMeta);
    }
    if (data.containsKey('CDSESENHA')) {
      context.handle(
        _cdSeSenhaMeta,
        cdSeSenha.isAcceptableOrUnknown(data['CDSESENHA']!, _cdSeSenhaMeta),
      );
    } else if (isInserting) {
      context.missing(_cdSeSenhaMeta);
    }
    if (data.containsKey('CDSECPFCNPJ')) {
      context.handle(
        _cdSeCpfCnpjMeta,
        cdSeCpfCnpj.isAcceptableOrUnknown(
          data['CDSECPFCNPJ']!,
          _cdSeCpfCnpjMeta,
        ),
      );
    }
    if (data.containsKey('CDSEEMAIL')) {
      context.handle(
        _cdSeEmailMeta,
        cdSeEmail.isAcceptableOrUnknown(data['CDSEEMAIL']!, _cdSeEmailMeta),
      );
    } else if (isInserting) {
      context.missing(_cdSeEmailMeta);
    }
    if (data.containsKey('CDSETELEFONE')) {
      context.handle(
        _cdSeTelefoneMeta,
        cdSeTelefone.isAcceptableOrUnknown(
          data['CDSETELEFONE']!,
          _cdSeTelefoneMeta,
        ),
      );
    }
    if (data.containsKey('CDSECARGOID')) {
      context.handle(
        _cdSeCargoIdMeta,
        cdSeCargoId.isAcceptableOrUnknown(
          data['CDSECARGOID']!,
          _cdSeCargoIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_cdSeCargoIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {cdSeId};
  @override
  CDSENHAData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CDSENHAData(
      cdSeId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}CDSEID'],
      )!,
      cdSeNome: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}CDSENOME'],
      )!,
      cdSeSenha: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}CDSESENHA'],
      )!,
      cdSeCpfCnpj: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}CDSECPFCNPJ'],
      ),
      cdSeEmail: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}CDSEEMAIL'],
      )!,
      cdSeTelefone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}CDSETELEFONE'],
      ),
      cdSeCargoId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}CDSECARGOID'],
      )!,
    );
  }

  @override
  $CDSENHATable createAlias(String alias) {
    return $CDSENHATable(attachedDatabase, alias);
  }
}

class CDSENHAData extends DataClass implements Insertable<CDSENHAData> {
  final int cdSeId;
  final String cdSeNome;
  final String cdSeSenha;
  final String? cdSeCpfCnpj;
  final String cdSeEmail;
  final String? cdSeTelefone;
  final int cdSeCargoId;
  const CDSENHAData({
    required this.cdSeId,
    required this.cdSeNome,
    required this.cdSeSenha,
    this.cdSeCpfCnpj,
    required this.cdSeEmail,
    this.cdSeTelefone,
    required this.cdSeCargoId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['CDSEID'] = Variable<int>(cdSeId);
    map['CDSENOME'] = Variable<String>(cdSeNome);
    map['CDSESENHA'] = Variable<String>(cdSeSenha);
    if (!nullToAbsent || cdSeCpfCnpj != null) {
      map['CDSECPFCNPJ'] = Variable<String>(cdSeCpfCnpj);
    }
    map['CDSEEMAIL'] = Variable<String>(cdSeEmail);
    if (!nullToAbsent || cdSeTelefone != null) {
      map['CDSETELEFONE'] = Variable<String>(cdSeTelefone);
    }
    map['CDSECARGOID'] = Variable<int>(cdSeCargoId);
    return map;
  }

  CDSENHACompanion toCompanion(bool nullToAbsent) {
    return CDSENHACompanion(
      cdSeId: Value(cdSeId),
      cdSeNome: Value(cdSeNome),
      cdSeSenha: Value(cdSeSenha),
      cdSeCpfCnpj: cdSeCpfCnpj == null && nullToAbsent
          ? const Value.absent()
          : Value(cdSeCpfCnpj),
      cdSeEmail: Value(cdSeEmail),
      cdSeTelefone: cdSeTelefone == null && nullToAbsent
          ? const Value.absent()
          : Value(cdSeTelefone),
      cdSeCargoId: Value(cdSeCargoId),
    );
  }

  factory CDSENHAData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CDSENHAData(
      cdSeId: serializer.fromJson<int>(json['cdSeId']),
      cdSeNome: serializer.fromJson<String>(json['cdSeNome']),
      cdSeSenha: serializer.fromJson<String>(json['cdSeSenha']),
      cdSeCpfCnpj: serializer.fromJson<String?>(json['cdSeCpfCnpj']),
      cdSeEmail: serializer.fromJson<String>(json['cdSeEmail']),
      cdSeTelefone: serializer.fromJson<String?>(json['cdSeTelefone']),
      cdSeCargoId: serializer.fromJson<int>(json['cdSeCargoId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'cdSeId': serializer.toJson<int>(cdSeId),
      'cdSeNome': serializer.toJson<String>(cdSeNome),
      'cdSeSenha': serializer.toJson<String>(cdSeSenha),
      'cdSeCpfCnpj': serializer.toJson<String?>(cdSeCpfCnpj),
      'cdSeEmail': serializer.toJson<String>(cdSeEmail),
      'cdSeTelefone': serializer.toJson<String?>(cdSeTelefone),
      'cdSeCargoId': serializer.toJson<int>(cdSeCargoId),
    };
  }

  CDSENHAData copyWith({
    int? cdSeId,
    String? cdSeNome,
    String? cdSeSenha,
    Value<String?> cdSeCpfCnpj = const Value.absent(),
    String? cdSeEmail,
    Value<String?> cdSeTelefone = const Value.absent(),
    int? cdSeCargoId,
  }) => CDSENHAData(
    cdSeId: cdSeId ?? this.cdSeId,
    cdSeNome: cdSeNome ?? this.cdSeNome,
    cdSeSenha: cdSeSenha ?? this.cdSeSenha,
    cdSeCpfCnpj: cdSeCpfCnpj.present ? cdSeCpfCnpj.value : this.cdSeCpfCnpj,
    cdSeEmail: cdSeEmail ?? this.cdSeEmail,
    cdSeTelefone: cdSeTelefone.present ? cdSeTelefone.value : this.cdSeTelefone,
    cdSeCargoId: cdSeCargoId ?? this.cdSeCargoId,
  );
  CDSENHAData copyWithCompanion(CDSENHACompanion data) {
    return CDSENHAData(
      cdSeId: data.cdSeId.present ? data.cdSeId.value : this.cdSeId,
      cdSeNome: data.cdSeNome.present ? data.cdSeNome.value : this.cdSeNome,
      cdSeSenha: data.cdSeSenha.present ? data.cdSeSenha.value : this.cdSeSenha,
      cdSeCpfCnpj: data.cdSeCpfCnpj.present
          ? data.cdSeCpfCnpj.value
          : this.cdSeCpfCnpj,
      cdSeEmail: data.cdSeEmail.present ? data.cdSeEmail.value : this.cdSeEmail,
      cdSeTelefone: data.cdSeTelefone.present
          ? data.cdSeTelefone.value
          : this.cdSeTelefone,
      cdSeCargoId: data.cdSeCargoId.present
          ? data.cdSeCargoId.value
          : this.cdSeCargoId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CDSENHAData(')
          ..write('cdSeId: $cdSeId, ')
          ..write('cdSeNome: $cdSeNome, ')
          ..write('cdSeSenha: $cdSeSenha, ')
          ..write('cdSeCpfCnpj: $cdSeCpfCnpj, ')
          ..write('cdSeEmail: $cdSeEmail, ')
          ..write('cdSeTelefone: $cdSeTelefone, ')
          ..write('cdSeCargoId: $cdSeCargoId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    cdSeId,
    cdSeNome,
    cdSeSenha,
    cdSeCpfCnpj,
    cdSeEmail,
    cdSeTelefone,
    cdSeCargoId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CDSENHAData &&
          other.cdSeId == this.cdSeId &&
          other.cdSeNome == this.cdSeNome &&
          other.cdSeSenha == this.cdSeSenha &&
          other.cdSeCpfCnpj == this.cdSeCpfCnpj &&
          other.cdSeEmail == this.cdSeEmail &&
          other.cdSeTelefone == this.cdSeTelefone &&
          other.cdSeCargoId == this.cdSeCargoId);
}

class CDSENHACompanion extends UpdateCompanion<CDSENHAData> {
  final Value<int> cdSeId;
  final Value<String> cdSeNome;
  final Value<String> cdSeSenha;
  final Value<String?> cdSeCpfCnpj;
  final Value<String> cdSeEmail;
  final Value<String?> cdSeTelefone;
  final Value<int> cdSeCargoId;
  const CDSENHACompanion({
    this.cdSeId = const Value.absent(),
    this.cdSeNome = const Value.absent(),
    this.cdSeSenha = const Value.absent(),
    this.cdSeCpfCnpj = const Value.absent(),
    this.cdSeEmail = const Value.absent(),
    this.cdSeTelefone = const Value.absent(),
    this.cdSeCargoId = const Value.absent(),
  });
  CDSENHACompanion.insert({
    this.cdSeId = const Value.absent(),
    required String cdSeNome,
    required String cdSeSenha,
    this.cdSeCpfCnpj = const Value.absent(),
    required String cdSeEmail,
    this.cdSeTelefone = const Value.absent(),
    required int cdSeCargoId,
  }) : cdSeNome = Value(cdSeNome),
       cdSeSenha = Value(cdSeSenha),
       cdSeEmail = Value(cdSeEmail),
       cdSeCargoId = Value(cdSeCargoId);
  static Insertable<CDSENHAData> custom({
    Expression<int>? cdSeId,
    Expression<String>? cdSeNome,
    Expression<String>? cdSeSenha,
    Expression<String>? cdSeCpfCnpj,
    Expression<String>? cdSeEmail,
    Expression<String>? cdSeTelefone,
    Expression<int>? cdSeCargoId,
  }) {
    return RawValuesInsertable({
      if (cdSeId != null) 'CDSEID': cdSeId,
      if (cdSeNome != null) 'CDSENOME': cdSeNome,
      if (cdSeSenha != null) 'CDSESENHA': cdSeSenha,
      if (cdSeCpfCnpj != null) 'CDSECPFCNPJ': cdSeCpfCnpj,
      if (cdSeEmail != null) 'CDSEEMAIL': cdSeEmail,
      if (cdSeTelefone != null) 'CDSETELEFONE': cdSeTelefone,
      if (cdSeCargoId != null) 'CDSECARGOID': cdSeCargoId,
    });
  }

  CDSENHACompanion copyWith({
    Value<int>? cdSeId,
    Value<String>? cdSeNome,
    Value<String>? cdSeSenha,
    Value<String?>? cdSeCpfCnpj,
    Value<String>? cdSeEmail,
    Value<String?>? cdSeTelefone,
    Value<int>? cdSeCargoId,
  }) {
    return CDSENHACompanion(
      cdSeId: cdSeId ?? this.cdSeId,
      cdSeNome: cdSeNome ?? this.cdSeNome,
      cdSeSenha: cdSeSenha ?? this.cdSeSenha,
      cdSeCpfCnpj: cdSeCpfCnpj ?? this.cdSeCpfCnpj,
      cdSeEmail: cdSeEmail ?? this.cdSeEmail,
      cdSeTelefone: cdSeTelefone ?? this.cdSeTelefone,
      cdSeCargoId: cdSeCargoId ?? this.cdSeCargoId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (cdSeId.present) {
      map['CDSEID'] = Variable<int>(cdSeId.value);
    }
    if (cdSeNome.present) {
      map['CDSENOME'] = Variable<String>(cdSeNome.value);
    }
    if (cdSeSenha.present) {
      map['CDSESENHA'] = Variable<String>(cdSeSenha.value);
    }
    if (cdSeCpfCnpj.present) {
      map['CDSECPFCNPJ'] = Variable<String>(cdSeCpfCnpj.value);
    }
    if (cdSeEmail.present) {
      map['CDSEEMAIL'] = Variable<String>(cdSeEmail.value);
    }
    if (cdSeTelefone.present) {
      map['CDSETELEFONE'] = Variable<String>(cdSeTelefone.value);
    }
    if (cdSeCargoId.present) {
      map['CDSECARGOID'] = Variable<int>(cdSeCargoId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CDSENHACompanion(')
          ..write('cdSeId: $cdSeId, ')
          ..write('cdSeNome: $cdSeNome, ')
          ..write('cdSeSenha: $cdSeSenha, ')
          ..write('cdSeCpfCnpj: $cdSeCpfCnpj, ')
          ..write('cdSeEmail: $cdSeEmail, ')
          ..write('cdSeTelefone: $cdSeTelefone, ')
          ..write('cdSeCargoId: $cdSeCargoId')
          ..write(')'))
        .toString();
  }
}

class $FIDELSESSAOTable extends FIDELSESSAO
    with TableInfo<$FIDELSESSAOTable, FIDELSESSAOData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FIDELSESSAOTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _fidelSesIdMeta = const VerificationMeta(
    'fidelSesId',
  );
  @override
  late final GeneratedColumn<int> fidelSesId = GeneratedColumn<int>(
    'FIDELSESID',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _fidelSesExpiraMeta = const VerificationMeta(
    'fidelSesExpira',
  );
  @override
  late final GeneratedColumn<int> fidelSesExpira = GeneratedColumn<int>(
    'FIDELSESEXPIRA',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fidelSesDtSessaoMeta = const VerificationMeta(
    'fidelSesDtSessao',
  );
  @override
  late final GeneratedColumn<DateTime> fidelSesDtSessao =
      GeneratedColumn<DateTime>(
        'FIDELSESDTSESSAO',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _fidelSesSenhaIdMeta = const VerificationMeta(
    'fidelSesSenhaId',
  );
  @override
  late final GeneratedColumn<int> fidelSesSenhaId = GeneratedColumn<int>(
    'FIDELSESSENHAID',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES cdsenha (CDSEID)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    fidelSesId,
    fidelSesExpira,
    fidelSesDtSessao,
    fidelSesSenhaId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'fidelsessao';
  @override
  VerificationContext validateIntegrity(
    Insertable<FIDELSESSAOData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('FIDELSESID')) {
      context.handle(
        _fidelSesIdMeta,
        fidelSesId.isAcceptableOrUnknown(data['FIDELSESID']!, _fidelSesIdMeta),
      );
    }
    if (data.containsKey('FIDELSESEXPIRA')) {
      context.handle(
        _fidelSesExpiraMeta,
        fidelSesExpira.isAcceptableOrUnknown(
          data['FIDELSESEXPIRA']!,
          _fidelSesExpiraMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_fidelSesExpiraMeta);
    }
    if (data.containsKey('FIDELSESDTSESSAO')) {
      context.handle(
        _fidelSesDtSessaoMeta,
        fidelSesDtSessao.isAcceptableOrUnknown(
          data['FIDELSESDTSESSAO']!,
          _fidelSesDtSessaoMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_fidelSesDtSessaoMeta);
    }
    if (data.containsKey('FIDELSESSENHAID')) {
      context.handle(
        _fidelSesSenhaIdMeta,
        fidelSesSenhaId.isAcceptableOrUnknown(
          data['FIDELSESSENHAID']!,
          _fidelSesSenhaIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_fidelSesSenhaIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {fidelSesId};
  @override
  FIDELSESSAOData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FIDELSESSAOData(
      fidelSesId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}FIDELSESID'],
      )!,
      fidelSesExpira: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}FIDELSESEXPIRA'],
      )!,
      fidelSesDtSessao: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}FIDELSESDTSESSAO'],
      )!,
      fidelSesSenhaId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}FIDELSESSENHAID'],
      )!,
    );
  }

  @override
  $FIDELSESSAOTable createAlias(String alias) {
    return $FIDELSESSAOTable(attachedDatabase, alias);
  }
}

class FIDELSESSAOData extends DataClass implements Insertable<FIDELSESSAOData> {
  final int fidelSesId;
  final int fidelSesExpira;
  final DateTime fidelSesDtSessao;
  final int fidelSesSenhaId;
  const FIDELSESSAOData({
    required this.fidelSesId,
    required this.fidelSesExpira,
    required this.fidelSesDtSessao,
    required this.fidelSesSenhaId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['FIDELSESID'] = Variable<int>(fidelSesId);
    map['FIDELSESEXPIRA'] = Variable<int>(fidelSesExpira);
    map['FIDELSESDTSESSAO'] = Variable<DateTime>(fidelSesDtSessao);
    map['FIDELSESSENHAID'] = Variable<int>(fidelSesSenhaId);
    return map;
  }

  FIDELSESSAOCompanion toCompanion(bool nullToAbsent) {
    return FIDELSESSAOCompanion(
      fidelSesId: Value(fidelSesId),
      fidelSesExpira: Value(fidelSesExpira),
      fidelSesDtSessao: Value(fidelSesDtSessao),
      fidelSesSenhaId: Value(fidelSesSenhaId),
    );
  }

  factory FIDELSESSAOData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FIDELSESSAOData(
      fidelSesId: serializer.fromJson<int>(json['fidelSesId']),
      fidelSesExpira: serializer.fromJson<int>(json['fidelSesExpira']),
      fidelSesDtSessao: serializer.fromJson<DateTime>(json['fidelSesDtSessao']),
      fidelSesSenhaId: serializer.fromJson<int>(json['fidelSesSenhaId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'fidelSesId': serializer.toJson<int>(fidelSesId),
      'fidelSesExpira': serializer.toJson<int>(fidelSesExpira),
      'fidelSesDtSessao': serializer.toJson<DateTime>(fidelSesDtSessao),
      'fidelSesSenhaId': serializer.toJson<int>(fidelSesSenhaId),
    };
  }

  FIDELSESSAOData copyWith({
    int? fidelSesId,
    int? fidelSesExpira,
    DateTime? fidelSesDtSessao,
    int? fidelSesSenhaId,
  }) => FIDELSESSAOData(
    fidelSesId: fidelSesId ?? this.fidelSesId,
    fidelSesExpira: fidelSesExpira ?? this.fidelSesExpira,
    fidelSesDtSessao: fidelSesDtSessao ?? this.fidelSesDtSessao,
    fidelSesSenhaId: fidelSesSenhaId ?? this.fidelSesSenhaId,
  );
  FIDELSESSAOData copyWithCompanion(FIDELSESSAOCompanion data) {
    return FIDELSESSAOData(
      fidelSesId: data.fidelSesId.present
          ? data.fidelSesId.value
          : this.fidelSesId,
      fidelSesExpira: data.fidelSesExpira.present
          ? data.fidelSesExpira.value
          : this.fidelSesExpira,
      fidelSesDtSessao: data.fidelSesDtSessao.present
          ? data.fidelSesDtSessao.value
          : this.fidelSesDtSessao,
      fidelSesSenhaId: data.fidelSesSenhaId.present
          ? data.fidelSesSenhaId.value
          : this.fidelSesSenhaId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FIDELSESSAOData(')
          ..write('fidelSesId: $fidelSesId, ')
          ..write('fidelSesExpira: $fidelSesExpira, ')
          ..write('fidelSesDtSessao: $fidelSesDtSessao, ')
          ..write('fidelSesSenhaId: $fidelSesSenhaId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    fidelSesId,
    fidelSesExpira,
    fidelSesDtSessao,
    fidelSesSenhaId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FIDELSESSAOData &&
          other.fidelSesId == this.fidelSesId &&
          other.fidelSesExpira == this.fidelSesExpira &&
          other.fidelSesDtSessao == this.fidelSesDtSessao &&
          other.fidelSesSenhaId == this.fidelSesSenhaId);
}

class FIDELSESSAOCompanion extends UpdateCompanion<FIDELSESSAOData> {
  final Value<int> fidelSesId;
  final Value<int> fidelSesExpira;
  final Value<DateTime> fidelSesDtSessao;
  final Value<int> fidelSesSenhaId;
  const FIDELSESSAOCompanion({
    this.fidelSesId = const Value.absent(),
    this.fidelSesExpira = const Value.absent(),
    this.fidelSesDtSessao = const Value.absent(),
    this.fidelSesSenhaId = const Value.absent(),
  });
  FIDELSESSAOCompanion.insert({
    this.fidelSesId = const Value.absent(),
    required int fidelSesExpira,
    required DateTime fidelSesDtSessao,
    required int fidelSesSenhaId,
  }) : fidelSesExpira = Value(fidelSesExpira),
       fidelSesDtSessao = Value(fidelSesDtSessao),
       fidelSesSenhaId = Value(fidelSesSenhaId);
  static Insertable<FIDELSESSAOData> custom({
    Expression<int>? fidelSesId,
    Expression<int>? fidelSesExpira,
    Expression<DateTime>? fidelSesDtSessao,
    Expression<int>? fidelSesSenhaId,
  }) {
    return RawValuesInsertable({
      if (fidelSesId != null) 'FIDELSESID': fidelSesId,
      if (fidelSesExpira != null) 'FIDELSESEXPIRA': fidelSesExpira,
      if (fidelSesDtSessao != null) 'FIDELSESDTSESSAO': fidelSesDtSessao,
      if (fidelSesSenhaId != null) 'FIDELSESSENHAID': fidelSesSenhaId,
    });
  }

  FIDELSESSAOCompanion copyWith({
    Value<int>? fidelSesId,
    Value<int>? fidelSesExpira,
    Value<DateTime>? fidelSesDtSessao,
    Value<int>? fidelSesSenhaId,
  }) {
    return FIDELSESSAOCompanion(
      fidelSesId: fidelSesId ?? this.fidelSesId,
      fidelSesExpira: fidelSesExpira ?? this.fidelSesExpira,
      fidelSesDtSessao: fidelSesDtSessao ?? this.fidelSesDtSessao,
      fidelSesSenhaId: fidelSesSenhaId ?? this.fidelSesSenhaId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (fidelSesId.present) {
      map['FIDELSESID'] = Variable<int>(fidelSesId.value);
    }
    if (fidelSesExpira.present) {
      map['FIDELSESEXPIRA'] = Variable<int>(fidelSesExpira.value);
    }
    if (fidelSesDtSessao.present) {
      map['FIDELSESDTSESSAO'] = Variable<DateTime>(fidelSesDtSessao.value);
    }
    if (fidelSesSenhaId.present) {
      map['FIDELSESSENHAID'] = Variable<int>(fidelSesSenhaId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FIDELSESSAOCompanion(')
          ..write('fidelSesId: $fidelSesId, ')
          ..write('fidelSesExpira: $fidelSesExpira, ')
          ..write('fidelSesDtSessao: $fidelSesDtSessao, ')
          ..write('fidelSesSenhaId: $fidelSesSenhaId')
          ..write(')'))
        .toString();
  }
}

class $LCVENDATable extends LCVENDA with TableInfo<$LCVENDATable, LCVENDAData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LCVENDATable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _lcVenIdMeta = const VerificationMeta(
    'lcVenId',
  );
  @override
  late final GeneratedColumn<int> lcVenId = GeneratedColumn<int>(
    'LCVENID',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _lcVenSenhaIdMeta = const VerificationMeta(
    'lcVenSenhaId',
  );
  @override
  late final GeneratedColumn<int> lcVenSenhaId = GeneratedColumn<int>(
    'LCVENSENHAID',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES cdsenha (CDSEID)',
    ),
  );
  static const VerificationMeta _lcVenProdutosMeta = const VerificationMeta(
    'lcVenProdutos',
  );
  @override
  late final GeneratedColumn<String> lcVenProdutos = GeneratedColumn<String>(
    'LCVENPRODUTOS',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lcvenDataMeta = const VerificationMeta(
    'lcvenData',
  );
  @override
  late final GeneratedColumn<DateTime> lcvenData = GeneratedColumn<DateTime>(
    'LCVENDATA',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    lcVenId,
    lcVenSenhaId,
    lcVenProdutos,
    lcvenData,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'lcvenda';
  @override
  VerificationContext validateIntegrity(
    Insertable<LCVENDAData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('LCVENID')) {
      context.handle(
        _lcVenIdMeta,
        lcVenId.isAcceptableOrUnknown(data['LCVENID']!, _lcVenIdMeta),
      );
    }
    if (data.containsKey('LCVENSENHAID')) {
      context.handle(
        _lcVenSenhaIdMeta,
        lcVenSenhaId.isAcceptableOrUnknown(
          data['LCVENSENHAID']!,
          _lcVenSenhaIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_lcVenSenhaIdMeta);
    }
    if (data.containsKey('LCVENPRODUTOS')) {
      context.handle(
        _lcVenProdutosMeta,
        lcVenProdutos.isAcceptableOrUnknown(
          data['LCVENPRODUTOS']!,
          _lcVenProdutosMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_lcVenProdutosMeta);
    }
    if (data.containsKey('LCVENDATA')) {
      context.handle(
        _lcvenDataMeta,
        lcvenData.isAcceptableOrUnknown(data['LCVENDATA']!, _lcvenDataMeta),
      );
    } else if (isInserting) {
      context.missing(_lcvenDataMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {lcVenId};
  @override
  LCVENDAData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LCVENDAData(
      lcVenId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}LCVENID'],
      )!,
      lcVenSenhaId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}LCVENSENHAID'],
      )!,
      lcVenProdutos: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}LCVENPRODUTOS'],
      )!,
      lcvenData: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}LCVENDATA'],
      )!,
    );
  }

  @override
  $LCVENDATable createAlias(String alias) {
    return $LCVENDATable(attachedDatabase, alias);
  }
}

class LCVENDAData extends DataClass implements Insertable<LCVENDAData> {
  final int lcVenId;
  final int lcVenSenhaId;
  final String lcVenProdutos;
  final DateTime lcvenData;
  const LCVENDAData({
    required this.lcVenId,
    required this.lcVenSenhaId,
    required this.lcVenProdutos,
    required this.lcvenData,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['LCVENID'] = Variable<int>(lcVenId);
    map['LCVENSENHAID'] = Variable<int>(lcVenSenhaId);
    map['LCVENPRODUTOS'] = Variable<String>(lcVenProdutos);
    map['LCVENDATA'] = Variable<DateTime>(lcvenData);
    return map;
  }

  LCVENDACompanion toCompanion(bool nullToAbsent) {
    return LCVENDACompanion(
      lcVenId: Value(lcVenId),
      lcVenSenhaId: Value(lcVenSenhaId),
      lcVenProdutos: Value(lcVenProdutos),
      lcvenData: Value(lcvenData),
    );
  }

  factory LCVENDAData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LCVENDAData(
      lcVenId: serializer.fromJson<int>(json['lcVenId']),
      lcVenSenhaId: serializer.fromJson<int>(json['lcVenSenhaId']),
      lcVenProdutos: serializer.fromJson<String>(json['lcVenProdutos']),
      lcvenData: serializer.fromJson<DateTime>(json['lcvenData']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'lcVenId': serializer.toJson<int>(lcVenId),
      'lcVenSenhaId': serializer.toJson<int>(lcVenSenhaId),
      'lcVenProdutos': serializer.toJson<String>(lcVenProdutos),
      'lcvenData': serializer.toJson<DateTime>(lcvenData),
    };
  }

  LCVENDAData copyWith({
    int? lcVenId,
    int? lcVenSenhaId,
    String? lcVenProdutos,
    DateTime? lcvenData,
  }) => LCVENDAData(
    lcVenId: lcVenId ?? this.lcVenId,
    lcVenSenhaId: lcVenSenhaId ?? this.lcVenSenhaId,
    lcVenProdutos: lcVenProdutos ?? this.lcVenProdutos,
    lcvenData: lcvenData ?? this.lcvenData,
  );
  LCVENDAData copyWithCompanion(LCVENDACompanion data) {
    return LCVENDAData(
      lcVenId: data.lcVenId.present ? data.lcVenId.value : this.lcVenId,
      lcVenSenhaId: data.lcVenSenhaId.present
          ? data.lcVenSenhaId.value
          : this.lcVenSenhaId,
      lcVenProdutos: data.lcVenProdutos.present
          ? data.lcVenProdutos.value
          : this.lcVenProdutos,
      lcvenData: data.lcvenData.present ? data.lcvenData.value : this.lcvenData,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LCVENDAData(')
          ..write('lcVenId: $lcVenId, ')
          ..write('lcVenSenhaId: $lcVenSenhaId, ')
          ..write('lcVenProdutos: $lcVenProdutos, ')
          ..write('lcvenData: $lcvenData')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(lcVenId, lcVenSenhaId, lcVenProdutos, lcvenData);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LCVENDAData &&
          other.lcVenId == this.lcVenId &&
          other.lcVenSenhaId == this.lcVenSenhaId &&
          other.lcVenProdutos == this.lcVenProdutos &&
          other.lcvenData == this.lcvenData);
}

class LCVENDACompanion extends UpdateCompanion<LCVENDAData> {
  final Value<int> lcVenId;
  final Value<int> lcVenSenhaId;
  final Value<String> lcVenProdutos;
  final Value<DateTime> lcvenData;
  const LCVENDACompanion({
    this.lcVenId = const Value.absent(),
    this.lcVenSenhaId = const Value.absent(),
    this.lcVenProdutos = const Value.absent(),
    this.lcvenData = const Value.absent(),
  });
  LCVENDACompanion.insert({
    this.lcVenId = const Value.absent(),
    required int lcVenSenhaId,
    required String lcVenProdutos,
    required DateTime lcvenData,
  }) : lcVenSenhaId = Value(lcVenSenhaId),
       lcVenProdutos = Value(lcVenProdutos),
       lcvenData = Value(lcvenData);
  static Insertable<LCVENDAData> custom({
    Expression<int>? lcVenId,
    Expression<int>? lcVenSenhaId,
    Expression<String>? lcVenProdutos,
    Expression<DateTime>? lcvenData,
  }) {
    return RawValuesInsertable({
      if (lcVenId != null) 'LCVENID': lcVenId,
      if (lcVenSenhaId != null) 'LCVENSENHAID': lcVenSenhaId,
      if (lcVenProdutos != null) 'LCVENPRODUTOS': lcVenProdutos,
      if (lcvenData != null) 'LCVENDATA': lcvenData,
    });
  }

  LCVENDACompanion copyWith({
    Value<int>? lcVenId,
    Value<int>? lcVenSenhaId,
    Value<String>? lcVenProdutos,
    Value<DateTime>? lcvenData,
  }) {
    return LCVENDACompanion(
      lcVenId: lcVenId ?? this.lcVenId,
      lcVenSenhaId: lcVenSenhaId ?? this.lcVenSenhaId,
      lcVenProdutos: lcVenProdutos ?? this.lcVenProdutos,
      lcvenData: lcvenData ?? this.lcvenData,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (lcVenId.present) {
      map['LCVENID'] = Variable<int>(lcVenId.value);
    }
    if (lcVenSenhaId.present) {
      map['LCVENSENHAID'] = Variable<int>(lcVenSenhaId.value);
    }
    if (lcVenProdutos.present) {
      map['LCVENPRODUTOS'] = Variable<String>(lcVenProdutos.value);
    }
    if (lcvenData.present) {
      map['LCVENDATA'] = Variable<DateTime>(lcvenData.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LCVENDACompanion(')
          ..write('lcVenId: $lcVenId, ')
          ..write('lcVenSenhaId: $lcVenSenhaId, ')
          ..write('lcVenProdutos: $lcVenProdutos, ')
          ..write('lcvenData: $lcvenData')
          ..write(')'))
        .toString();
  }
}

class $CDCATEGORIATable extends CDCATEGORIA
    with TableInfo<$CDCATEGORIATable, CDCATEGORIAData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CDCATEGORIATable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _cdCatIdMeta = const VerificationMeta(
    'cdCatId',
  );
  @override
  late final GeneratedColumn<int> cdCatId = GeneratedColumn<int>(
    'CDCATID',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _cdCatNomeMeta = const VerificationMeta(
    'cdCatNome',
  );
  @override
  late final GeneratedColumn<String> cdCatNome = GeneratedColumn<String>(
    'CDCATNOME',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 45,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [cdCatId, cdCatNome];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cdcategoria';
  @override
  VerificationContext validateIntegrity(
    Insertable<CDCATEGORIAData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('CDCATID')) {
      context.handle(
        _cdCatIdMeta,
        cdCatId.isAcceptableOrUnknown(data['CDCATID']!, _cdCatIdMeta),
      );
    }
    if (data.containsKey('CDCATNOME')) {
      context.handle(
        _cdCatNomeMeta,
        cdCatNome.isAcceptableOrUnknown(data['CDCATNOME']!, _cdCatNomeMeta),
      );
    } else if (isInserting) {
      context.missing(_cdCatNomeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {cdCatId};
  @override
  CDCATEGORIAData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CDCATEGORIAData(
      cdCatId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}CDCATID'],
      )!,
      cdCatNome: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}CDCATNOME'],
      )!,
    );
  }

  @override
  $CDCATEGORIATable createAlias(String alias) {
    return $CDCATEGORIATable(attachedDatabase, alias);
  }
}

class CDCATEGORIAData extends DataClass implements Insertable<CDCATEGORIAData> {
  final int cdCatId;
  final String cdCatNome;
  const CDCATEGORIAData({required this.cdCatId, required this.cdCatNome});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['CDCATID'] = Variable<int>(cdCatId);
    map['CDCATNOME'] = Variable<String>(cdCatNome);
    return map;
  }

  CDCATEGORIACompanion toCompanion(bool nullToAbsent) {
    return CDCATEGORIACompanion(
      cdCatId: Value(cdCatId),
      cdCatNome: Value(cdCatNome),
    );
  }

  factory CDCATEGORIAData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CDCATEGORIAData(
      cdCatId: serializer.fromJson<int>(json['cdCatId']),
      cdCatNome: serializer.fromJson<String>(json['cdCatNome']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'cdCatId': serializer.toJson<int>(cdCatId),
      'cdCatNome': serializer.toJson<String>(cdCatNome),
    };
  }

  CDCATEGORIAData copyWith({int? cdCatId, String? cdCatNome}) =>
      CDCATEGORIAData(
        cdCatId: cdCatId ?? this.cdCatId,
        cdCatNome: cdCatNome ?? this.cdCatNome,
      );
  CDCATEGORIAData copyWithCompanion(CDCATEGORIACompanion data) {
    return CDCATEGORIAData(
      cdCatId: data.cdCatId.present ? data.cdCatId.value : this.cdCatId,
      cdCatNome: data.cdCatNome.present ? data.cdCatNome.value : this.cdCatNome,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CDCATEGORIAData(')
          ..write('cdCatId: $cdCatId, ')
          ..write('cdCatNome: $cdCatNome')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(cdCatId, cdCatNome);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CDCATEGORIAData &&
          other.cdCatId == this.cdCatId &&
          other.cdCatNome == this.cdCatNome);
}

class CDCATEGORIACompanion extends UpdateCompanion<CDCATEGORIAData> {
  final Value<int> cdCatId;
  final Value<String> cdCatNome;
  const CDCATEGORIACompanion({
    this.cdCatId = const Value.absent(),
    this.cdCatNome = const Value.absent(),
  });
  CDCATEGORIACompanion.insert({
    this.cdCatId = const Value.absent(),
    required String cdCatNome,
  }) : cdCatNome = Value(cdCatNome);
  static Insertable<CDCATEGORIAData> custom({
    Expression<int>? cdCatId,
    Expression<String>? cdCatNome,
  }) {
    return RawValuesInsertable({
      if (cdCatId != null) 'CDCATID': cdCatId,
      if (cdCatNome != null) 'CDCATNOME': cdCatNome,
    });
  }

  CDCATEGORIACompanion copyWith({
    Value<int>? cdCatId,
    Value<String>? cdCatNome,
  }) {
    return CDCATEGORIACompanion(
      cdCatId: cdCatId ?? this.cdCatId,
      cdCatNome: cdCatNome ?? this.cdCatNome,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (cdCatId.present) {
      map['CDCATID'] = Variable<int>(cdCatId.value);
    }
    if (cdCatNome.present) {
      map['CDCATNOME'] = Variable<String>(cdCatNome.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CDCATEGORIACompanion(')
          ..write('cdCatId: $cdCatId, ')
          ..write('cdCatNome: $cdCatNome')
          ..write(')'))
        .toString();
  }
}

class $CDPRODUTOTable extends CDPRODUTO
    with TableInfo<$CDPRODUTOTable, CDPRODUTOData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CDPRODUTOTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _cdProdIdMeta = const VerificationMeta(
    'cdProdId',
  );
  @override
  late final GeneratedColumn<int> cdProdId = GeneratedColumn<int>(
    'CDPRODID',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _cdProdNomeMeta = const VerificationMeta(
    'cdProdNome',
  );
  @override
  late final GeneratedColumn<String> cdProdNome = GeneratedColumn<String>(
    'CDPRODNOME',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 45,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cdProdDescricaoMeta = const VerificationMeta(
    'cdProdDescricao',
  );
  @override
  late final GeneratedColumn<String> cdProdDescricao = GeneratedColumn<String>(
    'CDPRODDESCRICAO',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 45,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<Decimal, String> cdProdPrecoReal =
      GeneratedColumn<String>(
        'CDPRODPRECOREAL',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: Constant(Decimal.zero.toString()),
      ).withConverter<Decimal>($CDPRODUTOTable.$convertercdProdPrecoReal);
  static const VerificationMeta _cdProdPrecoPontoMeta = const VerificationMeta(
    'cdProdPrecoPonto',
  );
  @override
  late final GeneratedColumn<int> cdProdPrecoPonto = GeneratedColumn<int>(
    'CDPRODPRECOPONTO',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<Decimal, String>
  cdProdPrecoDesconto = GeneratedColumn<String>(
    'CDPRODPRECODESCONTO',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: Constant(Decimal.zero.toString()),
  ).withConverter<Decimal>($CDPRODUTOTable.$convertercdProdPrecoDesconto);
  static const VerificationMeta _cdProdPrecoQtdEstoqueMeta =
      const VerificationMeta('cdProdPrecoQtdEstoque');
  @override
  late final GeneratedColumn<int> cdProdPrecoQtdEstoque = GeneratedColumn<int>(
    'CDPRODQTDESTOQUE',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cdProdEmpresaIdMeta = const VerificationMeta(
    'cdProdEmpresaId',
  );
  @override
  late final GeneratedColumn<int> cdProdEmpresaId = GeneratedColumn<int>(
    'CDPRODEMPRESAID',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES cdempresa (CDEMPID)',
    ),
  );
  static const VerificationMeta _cdProdCategoriaIdMeta = const VerificationMeta(
    'cdProdCategoriaId',
  );
  @override
  late final GeneratedColumn<int> cdProdCategoriaId = GeneratedColumn<int>(
    'CDPRODCATEGORIAID',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES cdcategoria (CDCATID)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    cdProdId,
    cdProdNome,
    cdProdDescricao,
    cdProdPrecoReal,
    cdProdPrecoPonto,
    cdProdPrecoDesconto,
    cdProdPrecoQtdEstoque,
    cdProdEmpresaId,
    cdProdCategoriaId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cdproduto';
  @override
  VerificationContext validateIntegrity(
    Insertable<CDPRODUTOData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('CDPRODID')) {
      context.handle(
        _cdProdIdMeta,
        cdProdId.isAcceptableOrUnknown(data['CDPRODID']!, _cdProdIdMeta),
      );
    }
    if (data.containsKey('CDPRODNOME')) {
      context.handle(
        _cdProdNomeMeta,
        cdProdNome.isAcceptableOrUnknown(data['CDPRODNOME']!, _cdProdNomeMeta),
      );
    } else if (isInserting) {
      context.missing(_cdProdNomeMeta);
    }
    if (data.containsKey('CDPRODDESCRICAO')) {
      context.handle(
        _cdProdDescricaoMeta,
        cdProdDescricao.isAcceptableOrUnknown(
          data['CDPRODDESCRICAO']!,
          _cdProdDescricaoMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_cdProdDescricaoMeta);
    }
    if (data.containsKey('CDPRODPRECOPONTO')) {
      context.handle(
        _cdProdPrecoPontoMeta,
        cdProdPrecoPonto.isAcceptableOrUnknown(
          data['CDPRODPRECOPONTO']!,
          _cdProdPrecoPontoMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_cdProdPrecoPontoMeta);
    }
    if (data.containsKey('CDPRODQTDESTOQUE')) {
      context.handle(
        _cdProdPrecoQtdEstoqueMeta,
        cdProdPrecoQtdEstoque.isAcceptableOrUnknown(
          data['CDPRODQTDESTOQUE']!,
          _cdProdPrecoQtdEstoqueMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_cdProdPrecoQtdEstoqueMeta);
    }
    if (data.containsKey('CDPRODEMPRESAID')) {
      context.handle(
        _cdProdEmpresaIdMeta,
        cdProdEmpresaId.isAcceptableOrUnknown(
          data['CDPRODEMPRESAID']!,
          _cdProdEmpresaIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_cdProdEmpresaIdMeta);
    }
    if (data.containsKey('CDPRODCATEGORIAID')) {
      context.handle(
        _cdProdCategoriaIdMeta,
        cdProdCategoriaId.isAcceptableOrUnknown(
          data['CDPRODCATEGORIAID']!,
          _cdProdCategoriaIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_cdProdCategoriaIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {cdProdId};
  @override
  CDPRODUTOData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CDPRODUTOData(
      cdProdId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}CDPRODID'],
      )!,
      cdProdNome: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}CDPRODNOME'],
      )!,
      cdProdDescricao: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}CDPRODDESCRICAO'],
      )!,
      cdProdPrecoReal: $CDPRODUTOTable.$convertercdProdPrecoReal.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}CDPRODPRECOREAL'],
        )!,
      ),
      cdProdPrecoPonto: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}CDPRODPRECOPONTO'],
      )!,
      cdProdPrecoDesconto: $CDPRODUTOTable.$convertercdProdPrecoDesconto
          .fromSql(
            attachedDatabase.typeMapping.read(
              DriftSqlType.string,
              data['${effectivePrefix}CDPRODPRECODESCONTO'],
            )!,
          ),
      cdProdPrecoQtdEstoque: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}CDPRODQTDESTOQUE'],
      )!,
      cdProdEmpresaId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}CDPRODEMPRESAID'],
      )!,
      cdProdCategoriaId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}CDPRODCATEGORIAID'],
      )!,
    );
  }

  @override
  $CDPRODUTOTable createAlias(String alias) {
    return $CDPRODUTOTable(attachedDatabase, alias);
  }

  static TypeConverter<Decimal, String> $convertercdProdPrecoReal =
      const DecimalConverter();
  static TypeConverter<Decimal, String> $convertercdProdPrecoDesconto =
      const DecimalConverter();
}

class CDPRODUTOData extends DataClass implements Insertable<CDPRODUTOData> {
  final int cdProdId;
  final String cdProdNome;
  final String cdProdDescricao;
  final Decimal cdProdPrecoReal;
  final int cdProdPrecoPonto;
  final Decimal cdProdPrecoDesconto;
  final int cdProdPrecoQtdEstoque;
  final int cdProdEmpresaId;
  final int cdProdCategoriaId;
  const CDPRODUTOData({
    required this.cdProdId,
    required this.cdProdNome,
    required this.cdProdDescricao,
    required this.cdProdPrecoReal,
    required this.cdProdPrecoPonto,
    required this.cdProdPrecoDesconto,
    required this.cdProdPrecoQtdEstoque,
    required this.cdProdEmpresaId,
    required this.cdProdCategoriaId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['CDPRODID'] = Variable<int>(cdProdId);
    map['CDPRODNOME'] = Variable<String>(cdProdNome);
    map['CDPRODDESCRICAO'] = Variable<String>(cdProdDescricao);
    {
      map['CDPRODPRECOREAL'] = Variable<String>(
        $CDPRODUTOTable.$convertercdProdPrecoReal.toSql(cdProdPrecoReal),
      );
    }
    map['CDPRODPRECOPONTO'] = Variable<int>(cdProdPrecoPonto);
    {
      map['CDPRODPRECODESCONTO'] = Variable<String>(
        $CDPRODUTOTable.$convertercdProdPrecoDesconto.toSql(
          cdProdPrecoDesconto,
        ),
      );
    }
    map['CDPRODQTDESTOQUE'] = Variable<int>(cdProdPrecoQtdEstoque);
    map['CDPRODEMPRESAID'] = Variable<int>(cdProdEmpresaId);
    map['CDPRODCATEGORIAID'] = Variable<int>(cdProdCategoriaId);
    return map;
  }

  CDPRODUTOCompanion toCompanion(bool nullToAbsent) {
    return CDPRODUTOCompanion(
      cdProdId: Value(cdProdId),
      cdProdNome: Value(cdProdNome),
      cdProdDescricao: Value(cdProdDescricao),
      cdProdPrecoReal: Value(cdProdPrecoReal),
      cdProdPrecoPonto: Value(cdProdPrecoPonto),
      cdProdPrecoDesconto: Value(cdProdPrecoDesconto),
      cdProdPrecoQtdEstoque: Value(cdProdPrecoQtdEstoque),
      cdProdEmpresaId: Value(cdProdEmpresaId),
      cdProdCategoriaId: Value(cdProdCategoriaId),
    );
  }

  factory CDPRODUTOData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CDPRODUTOData(
      cdProdId: serializer.fromJson<int>(json['cdProdId']),
      cdProdNome: serializer.fromJson<String>(json['cdProdNome']),
      cdProdDescricao: serializer.fromJson<String>(json['cdProdDescricao']),
      cdProdPrecoReal: serializer.fromJson<Decimal>(json['cdProdPrecoReal']),
      cdProdPrecoPonto: serializer.fromJson<int>(json['cdProdPrecoPonto']),
      cdProdPrecoDesconto: serializer.fromJson<Decimal>(
        json['cdProdPrecoDesconto'],
      ),
      cdProdPrecoQtdEstoque: serializer.fromJson<int>(
        json['cdProdPrecoQtdEstoque'],
      ),
      cdProdEmpresaId: serializer.fromJson<int>(json['cdProdEmpresaId']),
      cdProdCategoriaId: serializer.fromJson<int>(json['cdProdCategoriaId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'cdProdId': serializer.toJson<int>(cdProdId),
      'cdProdNome': serializer.toJson<String>(cdProdNome),
      'cdProdDescricao': serializer.toJson<String>(cdProdDescricao),
      'cdProdPrecoReal': serializer.toJson<Decimal>(cdProdPrecoReal),
      'cdProdPrecoPonto': serializer.toJson<int>(cdProdPrecoPonto),
      'cdProdPrecoDesconto': serializer.toJson<Decimal>(cdProdPrecoDesconto),
      'cdProdPrecoQtdEstoque': serializer.toJson<int>(cdProdPrecoQtdEstoque),
      'cdProdEmpresaId': serializer.toJson<int>(cdProdEmpresaId),
      'cdProdCategoriaId': serializer.toJson<int>(cdProdCategoriaId),
    };
  }

  CDPRODUTOData copyWith({
    int? cdProdId,
    String? cdProdNome,
    String? cdProdDescricao,
    Decimal? cdProdPrecoReal,
    int? cdProdPrecoPonto,
    Decimal? cdProdPrecoDesconto,
    int? cdProdPrecoQtdEstoque,
    int? cdProdEmpresaId,
    int? cdProdCategoriaId,
  }) => CDPRODUTOData(
    cdProdId: cdProdId ?? this.cdProdId,
    cdProdNome: cdProdNome ?? this.cdProdNome,
    cdProdDescricao: cdProdDescricao ?? this.cdProdDescricao,
    cdProdPrecoReal: cdProdPrecoReal ?? this.cdProdPrecoReal,
    cdProdPrecoPonto: cdProdPrecoPonto ?? this.cdProdPrecoPonto,
    cdProdPrecoDesconto: cdProdPrecoDesconto ?? this.cdProdPrecoDesconto,
    cdProdPrecoQtdEstoque: cdProdPrecoQtdEstoque ?? this.cdProdPrecoQtdEstoque,
    cdProdEmpresaId: cdProdEmpresaId ?? this.cdProdEmpresaId,
    cdProdCategoriaId: cdProdCategoriaId ?? this.cdProdCategoriaId,
  );
  CDPRODUTOData copyWithCompanion(CDPRODUTOCompanion data) {
    return CDPRODUTOData(
      cdProdId: data.cdProdId.present ? data.cdProdId.value : this.cdProdId,
      cdProdNome: data.cdProdNome.present
          ? data.cdProdNome.value
          : this.cdProdNome,
      cdProdDescricao: data.cdProdDescricao.present
          ? data.cdProdDescricao.value
          : this.cdProdDescricao,
      cdProdPrecoReal: data.cdProdPrecoReal.present
          ? data.cdProdPrecoReal.value
          : this.cdProdPrecoReal,
      cdProdPrecoPonto: data.cdProdPrecoPonto.present
          ? data.cdProdPrecoPonto.value
          : this.cdProdPrecoPonto,
      cdProdPrecoDesconto: data.cdProdPrecoDesconto.present
          ? data.cdProdPrecoDesconto.value
          : this.cdProdPrecoDesconto,
      cdProdPrecoQtdEstoque: data.cdProdPrecoQtdEstoque.present
          ? data.cdProdPrecoQtdEstoque.value
          : this.cdProdPrecoQtdEstoque,
      cdProdEmpresaId: data.cdProdEmpresaId.present
          ? data.cdProdEmpresaId.value
          : this.cdProdEmpresaId,
      cdProdCategoriaId: data.cdProdCategoriaId.present
          ? data.cdProdCategoriaId.value
          : this.cdProdCategoriaId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CDPRODUTOData(')
          ..write('cdProdId: $cdProdId, ')
          ..write('cdProdNome: $cdProdNome, ')
          ..write('cdProdDescricao: $cdProdDescricao, ')
          ..write('cdProdPrecoReal: $cdProdPrecoReal, ')
          ..write('cdProdPrecoPonto: $cdProdPrecoPonto, ')
          ..write('cdProdPrecoDesconto: $cdProdPrecoDesconto, ')
          ..write('cdProdPrecoQtdEstoque: $cdProdPrecoQtdEstoque, ')
          ..write('cdProdEmpresaId: $cdProdEmpresaId, ')
          ..write('cdProdCategoriaId: $cdProdCategoriaId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    cdProdId,
    cdProdNome,
    cdProdDescricao,
    cdProdPrecoReal,
    cdProdPrecoPonto,
    cdProdPrecoDesconto,
    cdProdPrecoQtdEstoque,
    cdProdEmpresaId,
    cdProdCategoriaId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CDPRODUTOData &&
          other.cdProdId == this.cdProdId &&
          other.cdProdNome == this.cdProdNome &&
          other.cdProdDescricao == this.cdProdDescricao &&
          other.cdProdPrecoReal == this.cdProdPrecoReal &&
          other.cdProdPrecoPonto == this.cdProdPrecoPonto &&
          other.cdProdPrecoDesconto == this.cdProdPrecoDesconto &&
          other.cdProdPrecoQtdEstoque == this.cdProdPrecoQtdEstoque &&
          other.cdProdEmpresaId == this.cdProdEmpresaId &&
          other.cdProdCategoriaId == this.cdProdCategoriaId);
}

class CDPRODUTOCompanion extends UpdateCompanion<CDPRODUTOData> {
  final Value<int> cdProdId;
  final Value<String> cdProdNome;
  final Value<String> cdProdDescricao;
  final Value<Decimal> cdProdPrecoReal;
  final Value<int> cdProdPrecoPonto;
  final Value<Decimal> cdProdPrecoDesconto;
  final Value<int> cdProdPrecoQtdEstoque;
  final Value<int> cdProdEmpresaId;
  final Value<int> cdProdCategoriaId;
  const CDPRODUTOCompanion({
    this.cdProdId = const Value.absent(),
    this.cdProdNome = const Value.absent(),
    this.cdProdDescricao = const Value.absent(),
    this.cdProdPrecoReal = const Value.absent(),
    this.cdProdPrecoPonto = const Value.absent(),
    this.cdProdPrecoDesconto = const Value.absent(),
    this.cdProdPrecoQtdEstoque = const Value.absent(),
    this.cdProdEmpresaId = const Value.absent(),
    this.cdProdCategoriaId = const Value.absent(),
  });
  CDPRODUTOCompanion.insert({
    this.cdProdId = const Value.absent(),
    required String cdProdNome,
    required String cdProdDescricao,
    this.cdProdPrecoReal = const Value.absent(),
    required int cdProdPrecoPonto,
    this.cdProdPrecoDesconto = const Value.absent(),
    required int cdProdPrecoQtdEstoque,
    required int cdProdEmpresaId,
    required int cdProdCategoriaId,
  }) : cdProdNome = Value(cdProdNome),
       cdProdDescricao = Value(cdProdDescricao),
       cdProdPrecoPonto = Value(cdProdPrecoPonto),
       cdProdPrecoQtdEstoque = Value(cdProdPrecoQtdEstoque),
       cdProdEmpresaId = Value(cdProdEmpresaId),
       cdProdCategoriaId = Value(cdProdCategoriaId);
  static Insertable<CDPRODUTOData> custom({
    Expression<int>? cdProdId,
    Expression<String>? cdProdNome,
    Expression<String>? cdProdDescricao,
    Expression<String>? cdProdPrecoReal,
    Expression<int>? cdProdPrecoPonto,
    Expression<String>? cdProdPrecoDesconto,
    Expression<int>? cdProdPrecoQtdEstoque,
    Expression<int>? cdProdEmpresaId,
    Expression<int>? cdProdCategoriaId,
  }) {
    return RawValuesInsertable({
      if (cdProdId != null) 'CDPRODID': cdProdId,
      if (cdProdNome != null) 'CDPRODNOME': cdProdNome,
      if (cdProdDescricao != null) 'CDPRODDESCRICAO': cdProdDescricao,
      if (cdProdPrecoReal != null) 'CDPRODPRECOREAL': cdProdPrecoReal,
      if (cdProdPrecoPonto != null) 'CDPRODPRECOPONTO': cdProdPrecoPonto,
      if (cdProdPrecoDesconto != null)
        'CDPRODPRECODESCONTO': cdProdPrecoDesconto,
      if (cdProdPrecoQtdEstoque != null)
        'CDPRODQTDESTOQUE': cdProdPrecoQtdEstoque,
      if (cdProdEmpresaId != null) 'CDPRODEMPRESAID': cdProdEmpresaId,
      if (cdProdCategoriaId != null) 'CDPRODCATEGORIAID': cdProdCategoriaId,
    });
  }

  CDPRODUTOCompanion copyWith({
    Value<int>? cdProdId,
    Value<String>? cdProdNome,
    Value<String>? cdProdDescricao,
    Value<Decimal>? cdProdPrecoReal,
    Value<int>? cdProdPrecoPonto,
    Value<Decimal>? cdProdPrecoDesconto,
    Value<int>? cdProdPrecoQtdEstoque,
    Value<int>? cdProdEmpresaId,
    Value<int>? cdProdCategoriaId,
  }) {
    return CDPRODUTOCompanion(
      cdProdId: cdProdId ?? this.cdProdId,
      cdProdNome: cdProdNome ?? this.cdProdNome,
      cdProdDescricao: cdProdDescricao ?? this.cdProdDescricao,
      cdProdPrecoReal: cdProdPrecoReal ?? this.cdProdPrecoReal,
      cdProdPrecoPonto: cdProdPrecoPonto ?? this.cdProdPrecoPonto,
      cdProdPrecoDesconto: cdProdPrecoDesconto ?? this.cdProdPrecoDesconto,
      cdProdPrecoQtdEstoque:
          cdProdPrecoQtdEstoque ?? this.cdProdPrecoQtdEstoque,
      cdProdEmpresaId: cdProdEmpresaId ?? this.cdProdEmpresaId,
      cdProdCategoriaId: cdProdCategoriaId ?? this.cdProdCategoriaId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (cdProdId.present) {
      map['CDPRODID'] = Variable<int>(cdProdId.value);
    }
    if (cdProdNome.present) {
      map['CDPRODNOME'] = Variable<String>(cdProdNome.value);
    }
    if (cdProdDescricao.present) {
      map['CDPRODDESCRICAO'] = Variable<String>(cdProdDescricao.value);
    }
    if (cdProdPrecoReal.present) {
      map['CDPRODPRECOREAL'] = Variable<String>(
        $CDPRODUTOTable.$convertercdProdPrecoReal.toSql(cdProdPrecoReal.value),
      );
    }
    if (cdProdPrecoPonto.present) {
      map['CDPRODPRECOPONTO'] = Variable<int>(cdProdPrecoPonto.value);
    }
    if (cdProdPrecoDesconto.present) {
      map['CDPRODPRECODESCONTO'] = Variable<String>(
        $CDPRODUTOTable.$convertercdProdPrecoDesconto.toSql(
          cdProdPrecoDesconto.value,
        ),
      );
    }
    if (cdProdPrecoQtdEstoque.present) {
      map['CDPRODQTDESTOQUE'] = Variable<int>(cdProdPrecoQtdEstoque.value);
    }
    if (cdProdEmpresaId.present) {
      map['CDPRODEMPRESAID'] = Variable<int>(cdProdEmpresaId.value);
    }
    if (cdProdCategoriaId.present) {
      map['CDPRODCATEGORIAID'] = Variable<int>(cdProdCategoriaId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CDPRODUTOCompanion(')
          ..write('cdProdId: $cdProdId, ')
          ..write('cdProdNome: $cdProdNome, ')
          ..write('cdProdDescricao: $cdProdDescricao, ')
          ..write('cdProdPrecoReal: $cdProdPrecoReal, ')
          ..write('cdProdPrecoPonto: $cdProdPrecoPonto, ')
          ..write('cdProdPrecoDesconto: $cdProdPrecoDesconto, ')
          ..write('cdProdPrecoQtdEstoque: $cdProdPrecoQtdEstoque, ')
          ..write('cdProdEmpresaId: $cdProdEmpresaId, ')
          ..write('cdProdCategoriaId: $cdProdCategoriaId')
          ..write(')'))
        .toString();
  }
}

class $CDPRODUTOIMAGEMTable extends CDPRODUTOIMAGEM
    with TableInfo<$CDPRODUTOIMAGEMTable, CDPRODUTOIMAGEMData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CDPRODUTOIMAGEMTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _cdProdImgIdMeta = const VerificationMeta(
    'cdProdImgId',
  );
  @override
  late final GeneratedColumn<int> cdProdImgId = GeneratedColumn<int>(
    'CDPRODIMGID',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _cdProdImgBlobMeta = const VerificationMeta(
    'cdProdImgBlob',
  );
  @override
  late final GeneratedColumn<Uint8List> cdProdImgBlob =
      GeneratedColumn<Uint8List>(
        'CDPRODIMGBLOB',
        aliasedName,
        false,
        type: DriftSqlType.blob,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _cdProdImgProdutoIdMeta =
      const VerificationMeta('cdProdImgProdutoId');
  @override
  late final GeneratedColumn<int> cdProdImgProdutoId = GeneratedColumn<int>(
    'CDPRODIMGPRODUTOID',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES cdproduto (CDPRODID)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    cdProdImgId,
    cdProdImgBlob,
    cdProdImgProdutoId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cdprodutoimagem';
  @override
  VerificationContext validateIntegrity(
    Insertable<CDPRODUTOIMAGEMData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('CDPRODIMGID')) {
      context.handle(
        _cdProdImgIdMeta,
        cdProdImgId.isAcceptableOrUnknown(
          data['CDPRODIMGID']!,
          _cdProdImgIdMeta,
        ),
      );
    }
    if (data.containsKey('CDPRODIMGBLOB')) {
      context.handle(
        _cdProdImgBlobMeta,
        cdProdImgBlob.isAcceptableOrUnknown(
          data['CDPRODIMGBLOB']!,
          _cdProdImgBlobMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_cdProdImgBlobMeta);
    }
    if (data.containsKey('CDPRODIMGPRODUTOID')) {
      context.handle(
        _cdProdImgProdutoIdMeta,
        cdProdImgProdutoId.isAcceptableOrUnknown(
          data['CDPRODIMGPRODUTOID']!,
          _cdProdImgProdutoIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_cdProdImgProdutoIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {cdProdImgId};
  @override
  CDPRODUTOIMAGEMData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CDPRODUTOIMAGEMData(
      cdProdImgId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}CDPRODIMGID'],
      )!,
      cdProdImgBlob: attachedDatabase.typeMapping.read(
        DriftSqlType.blob,
        data['${effectivePrefix}CDPRODIMGBLOB'],
      )!,
      cdProdImgProdutoId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}CDPRODIMGPRODUTOID'],
      )!,
    );
  }

  @override
  $CDPRODUTOIMAGEMTable createAlias(String alias) {
    return $CDPRODUTOIMAGEMTable(attachedDatabase, alias);
  }
}

class CDPRODUTOIMAGEMData extends DataClass
    implements Insertable<CDPRODUTOIMAGEMData> {
  final int cdProdImgId;
  final Uint8List cdProdImgBlob;
  final int cdProdImgProdutoId;
  const CDPRODUTOIMAGEMData({
    required this.cdProdImgId,
    required this.cdProdImgBlob,
    required this.cdProdImgProdutoId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['CDPRODIMGID'] = Variable<int>(cdProdImgId);
    map['CDPRODIMGBLOB'] = Variable<Uint8List>(cdProdImgBlob);
    map['CDPRODIMGPRODUTOID'] = Variable<int>(cdProdImgProdutoId);
    return map;
  }

  CDPRODUTOIMAGEMCompanion toCompanion(bool nullToAbsent) {
    return CDPRODUTOIMAGEMCompanion(
      cdProdImgId: Value(cdProdImgId),
      cdProdImgBlob: Value(cdProdImgBlob),
      cdProdImgProdutoId: Value(cdProdImgProdutoId),
    );
  }

  factory CDPRODUTOIMAGEMData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CDPRODUTOIMAGEMData(
      cdProdImgId: serializer.fromJson<int>(json['cdProdImgId']),
      cdProdImgBlob: serializer.fromJson<Uint8List>(json['cdProdImgBlob']),
      cdProdImgProdutoId: serializer.fromJson<int>(json['cdProdImgProdutoId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'cdProdImgId': serializer.toJson<int>(cdProdImgId),
      'cdProdImgBlob': serializer.toJson<Uint8List>(cdProdImgBlob),
      'cdProdImgProdutoId': serializer.toJson<int>(cdProdImgProdutoId),
    };
  }

  CDPRODUTOIMAGEMData copyWith({
    int? cdProdImgId,
    Uint8List? cdProdImgBlob,
    int? cdProdImgProdutoId,
  }) => CDPRODUTOIMAGEMData(
    cdProdImgId: cdProdImgId ?? this.cdProdImgId,
    cdProdImgBlob: cdProdImgBlob ?? this.cdProdImgBlob,
    cdProdImgProdutoId: cdProdImgProdutoId ?? this.cdProdImgProdutoId,
  );
  CDPRODUTOIMAGEMData copyWithCompanion(CDPRODUTOIMAGEMCompanion data) {
    return CDPRODUTOIMAGEMData(
      cdProdImgId: data.cdProdImgId.present
          ? data.cdProdImgId.value
          : this.cdProdImgId,
      cdProdImgBlob: data.cdProdImgBlob.present
          ? data.cdProdImgBlob.value
          : this.cdProdImgBlob,
      cdProdImgProdutoId: data.cdProdImgProdutoId.present
          ? data.cdProdImgProdutoId.value
          : this.cdProdImgProdutoId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CDPRODUTOIMAGEMData(')
          ..write('cdProdImgId: $cdProdImgId, ')
          ..write('cdProdImgBlob: $cdProdImgBlob, ')
          ..write('cdProdImgProdutoId: $cdProdImgProdutoId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    cdProdImgId,
    $driftBlobEquality.hash(cdProdImgBlob),
    cdProdImgProdutoId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CDPRODUTOIMAGEMData &&
          other.cdProdImgId == this.cdProdImgId &&
          $driftBlobEquality.equals(other.cdProdImgBlob, this.cdProdImgBlob) &&
          other.cdProdImgProdutoId == this.cdProdImgProdutoId);
}

class CDPRODUTOIMAGEMCompanion extends UpdateCompanion<CDPRODUTOIMAGEMData> {
  final Value<int> cdProdImgId;
  final Value<Uint8List> cdProdImgBlob;
  final Value<int> cdProdImgProdutoId;
  const CDPRODUTOIMAGEMCompanion({
    this.cdProdImgId = const Value.absent(),
    this.cdProdImgBlob = const Value.absent(),
    this.cdProdImgProdutoId = const Value.absent(),
  });
  CDPRODUTOIMAGEMCompanion.insert({
    this.cdProdImgId = const Value.absent(),
    required Uint8List cdProdImgBlob,
    required int cdProdImgProdutoId,
  }) : cdProdImgBlob = Value(cdProdImgBlob),
       cdProdImgProdutoId = Value(cdProdImgProdutoId);
  static Insertable<CDPRODUTOIMAGEMData> custom({
    Expression<int>? cdProdImgId,
    Expression<Uint8List>? cdProdImgBlob,
    Expression<int>? cdProdImgProdutoId,
  }) {
    return RawValuesInsertable({
      if (cdProdImgId != null) 'CDPRODIMGID': cdProdImgId,
      if (cdProdImgBlob != null) 'CDPRODIMGBLOB': cdProdImgBlob,
      if (cdProdImgProdutoId != null) 'CDPRODIMGPRODUTOID': cdProdImgProdutoId,
    });
  }

  CDPRODUTOIMAGEMCompanion copyWith({
    Value<int>? cdProdImgId,
    Value<Uint8List>? cdProdImgBlob,
    Value<int>? cdProdImgProdutoId,
  }) {
    return CDPRODUTOIMAGEMCompanion(
      cdProdImgId: cdProdImgId ?? this.cdProdImgId,
      cdProdImgBlob: cdProdImgBlob ?? this.cdProdImgBlob,
      cdProdImgProdutoId: cdProdImgProdutoId ?? this.cdProdImgProdutoId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (cdProdImgId.present) {
      map['CDPRODIMGID'] = Variable<int>(cdProdImgId.value);
    }
    if (cdProdImgBlob.present) {
      map['CDPRODIMGBLOB'] = Variable<Uint8List>(cdProdImgBlob.value);
    }
    if (cdProdImgProdutoId.present) {
      map['CDPRODIMGPRODUTOID'] = Variable<int>(cdProdImgProdutoId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CDPRODUTOIMAGEMCompanion(')
          ..write('cdProdImgId: $cdProdImgId, ')
          ..write('cdProdImgBlob: $cdProdImgBlob, ')
          ..write('cdProdImgProdutoId: $cdProdImgProdutoId')
          ..write(')'))
        .toString();
  }
}

class $CDEXCECAOTable extends CDEXCECAO
    with TableInfo<$CDEXCECAOTable, CDEXCECAOData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CDEXCECAOTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _cdExIdMeta = const VerificationMeta('cdExId');
  @override
  late final GeneratedColumn<int> cdExId = GeneratedColumn<int>(
    'CDEXID',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _cdExDescricaoMeta = const VerificationMeta(
    'cdExDescricao',
  );
  @override
  late final GeneratedColumn<String> cdExDescricao = GeneratedColumn<String>(
    'CDEXDESCRICAO',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 200,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cdExDataMeta = const VerificationMeta(
    'cdExData',
  );
  @override
  late final GeneratedColumn<DateTime> cdExData = GeneratedColumn<DateTime>(
    'CDEXDATA',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cdExEmpresaIdMeta = const VerificationMeta(
    'cdExEmpresaId',
  );
  @override
  late final GeneratedColumn<int> cdExEmpresaId = GeneratedColumn<int>(
    'CDEXEMPRESAID',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES cdempresa (CDEMPID)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    cdExId,
    cdExDescricao,
    cdExData,
    cdExEmpresaId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cdexcecao';
  @override
  VerificationContext validateIntegrity(
    Insertable<CDEXCECAOData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('CDEXID')) {
      context.handle(
        _cdExIdMeta,
        cdExId.isAcceptableOrUnknown(data['CDEXID']!, _cdExIdMeta),
      );
    }
    if (data.containsKey('CDEXDESCRICAO')) {
      context.handle(
        _cdExDescricaoMeta,
        cdExDescricao.isAcceptableOrUnknown(
          data['CDEXDESCRICAO']!,
          _cdExDescricaoMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_cdExDescricaoMeta);
    }
    if (data.containsKey('CDEXDATA')) {
      context.handle(
        _cdExDataMeta,
        cdExData.isAcceptableOrUnknown(data['CDEXDATA']!, _cdExDataMeta),
      );
    } else if (isInserting) {
      context.missing(_cdExDataMeta);
    }
    if (data.containsKey('CDEXEMPRESAID')) {
      context.handle(
        _cdExEmpresaIdMeta,
        cdExEmpresaId.isAcceptableOrUnknown(
          data['CDEXEMPRESAID']!,
          _cdExEmpresaIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_cdExEmpresaIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {cdExId};
  @override
  CDEXCECAOData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CDEXCECAOData(
      cdExId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}CDEXID'],
      )!,
      cdExDescricao: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}CDEXDESCRICAO'],
      )!,
      cdExData: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}CDEXDATA'],
      )!,
      cdExEmpresaId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}CDEXEMPRESAID'],
      )!,
    );
  }

  @override
  $CDEXCECAOTable createAlias(String alias) {
    return $CDEXCECAOTable(attachedDatabase, alias);
  }
}

class CDEXCECAOData extends DataClass implements Insertable<CDEXCECAOData> {
  final int cdExId;
  final String cdExDescricao;
  final DateTime cdExData;
  final int cdExEmpresaId;
  const CDEXCECAOData({
    required this.cdExId,
    required this.cdExDescricao,
    required this.cdExData,
    required this.cdExEmpresaId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['CDEXID'] = Variable<int>(cdExId);
    map['CDEXDESCRICAO'] = Variable<String>(cdExDescricao);
    map['CDEXDATA'] = Variable<DateTime>(cdExData);
    map['CDEXEMPRESAID'] = Variable<int>(cdExEmpresaId);
    return map;
  }

  CDEXCECAOCompanion toCompanion(bool nullToAbsent) {
    return CDEXCECAOCompanion(
      cdExId: Value(cdExId),
      cdExDescricao: Value(cdExDescricao),
      cdExData: Value(cdExData),
      cdExEmpresaId: Value(cdExEmpresaId),
    );
  }

  factory CDEXCECAOData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CDEXCECAOData(
      cdExId: serializer.fromJson<int>(json['cdExId']),
      cdExDescricao: serializer.fromJson<String>(json['cdExDescricao']),
      cdExData: serializer.fromJson<DateTime>(json['cdExData']),
      cdExEmpresaId: serializer.fromJson<int>(json['cdExEmpresaId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'cdExId': serializer.toJson<int>(cdExId),
      'cdExDescricao': serializer.toJson<String>(cdExDescricao),
      'cdExData': serializer.toJson<DateTime>(cdExData),
      'cdExEmpresaId': serializer.toJson<int>(cdExEmpresaId),
    };
  }

  CDEXCECAOData copyWith({
    int? cdExId,
    String? cdExDescricao,
    DateTime? cdExData,
    int? cdExEmpresaId,
  }) => CDEXCECAOData(
    cdExId: cdExId ?? this.cdExId,
    cdExDescricao: cdExDescricao ?? this.cdExDescricao,
    cdExData: cdExData ?? this.cdExData,
    cdExEmpresaId: cdExEmpresaId ?? this.cdExEmpresaId,
  );
  CDEXCECAOData copyWithCompanion(CDEXCECAOCompanion data) {
    return CDEXCECAOData(
      cdExId: data.cdExId.present ? data.cdExId.value : this.cdExId,
      cdExDescricao: data.cdExDescricao.present
          ? data.cdExDescricao.value
          : this.cdExDescricao,
      cdExData: data.cdExData.present ? data.cdExData.value : this.cdExData,
      cdExEmpresaId: data.cdExEmpresaId.present
          ? data.cdExEmpresaId.value
          : this.cdExEmpresaId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CDEXCECAOData(')
          ..write('cdExId: $cdExId, ')
          ..write('cdExDescricao: $cdExDescricao, ')
          ..write('cdExData: $cdExData, ')
          ..write('cdExEmpresaId: $cdExEmpresaId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(cdExId, cdExDescricao, cdExData, cdExEmpresaId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CDEXCECAOData &&
          other.cdExId == this.cdExId &&
          other.cdExDescricao == this.cdExDescricao &&
          other.cdExData == this.cdExData &&
          other.cdExEmpresaId == this.cdExEmpresaId);
}

class CDEXCECAOCompanion extends UpdateCompanion<CDEXCECAOData> {
  final Value<int> cdExId;
  final Value<String> cdExDescricao;
  final Value<DateTime> cdExData;
  final Value<int> cdExEmpresaId;
  const CDEXCECAOCompanion({
    this.cdExId = const Value.absent(),
    this.cdExDescricao = const Value.absent(),
    this.cdExData = const Value.absent(),
    this.cdExEmpresaId = const Value.absent(),
  });
  CDEXCECAOCompanion.insert({
    this.cdExId = const Value.absent(),
    required String cdExDescricao,
    required DateTime cdExData,
    required int cdExEmpresaId,
  }) : cdExDescricao = Value(cdExDescricao),
       cdExData = Value(cdExData),
       cdExEmpresaId = Value(cdExEmpresaId);
  static Insertable<CDEXCECAOData> custom({
    Expression<int>? cdExId,
    Expression<String>? cdExDescricao,
    Expression<DateTime>? cdExData,
    Expression<int>? cdExEmpresaId,
  }) {
    return RawValuesInsertable({
      if (cdExId != null) 'CDEXID': cdExId,
      if (cdExDescricao != null) 'CDEXDESCRICAO': cdExDescricao,
      if (cdExData != null) 'CDEXDATA': cdExData,
      if (cdExEmpresaId != null) 'CDEXEMPRESAID': cdExEmpresaId,
    });
  }

  CDEXCECAOCompanion copyWith({
    Value<int>? cdExId,
    Value<String>? cdExDescricao,
    Value<DateTime>? cdExData,
    Value<int>? cdExEmpresaId,
  }) {
    return CDEXCECAOCompanion(
      cdExId: cdExId ?? this.cdExId,
      cdExDescricao: cdExDescricao ?? this.cdExDescricao,
      cdExData: cdExData ?? this.cdExData,
      cdExEmpresaId: cdExEmpresaId ?? this.cdExEmpresaId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (cdExId.present) {
      map['CDEXID'] = Variable<int>(cdExId.value);
    }
    if (cdExDescricao.present) {
      map['CDEXDESCRICAO'] = Variable<String>(cdExDescricao.value);
    }
    if (cdExData.present) {
      map['CDEXDATA'] = Variable<DateTime>(cdExData.value);
    }
    if (cdExEmpresaId.present) {
      map['CDEXEMPRESAID'] = Variable<int>(cdExEmpresaId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CDEXCECAOCompanion(')
          ..write('cdExId: $cdExId, ')
          ..write('cdExDescricao: $cdExDescricao, ')
          ..write('cdExData: $cdExData, ')
          ..write('cdExEmpresaId: $cdExEmpresaId')
          ..write(')'))
        .toString();
  }
}

class $CDACAOTable extends CDACAO with TableInfo<$CDACAOTable, CDACAOData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CDACAOTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _cdAcaoIdMeta = const VerificationMeta(
    'cdAcaoId',
  );
  @override
  late final GeneratedColumn<int> cdAcaoId = GeneratedColumn<int>(
    'CDACAOID',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _cdAcaoDescricaoMeta = const VerificationMeta(
    'cdAcaoDescricao',
  );
  @override
  late final GeneratedColumn<String> cdAcaoDescricao = GeneratedColumn<String>(
    'CDACAODESCRICAO',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 45,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [cdAcaoId, cdAcaoDescricao];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cdacao';
  @override
  VerificationContext validateIntegrity(
    Insertable<CDACAOData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('CDACAOID')) {
      context.handle(
        _cdAcaoIdMeta,
        cdAcaoId.isAcceptableOrUnknown(data['CDACAOID']!, _cdAcaoIdMeta),
      );
    }
    if (data.containsKey('CDACAODESCRICAO')) {
      context.handle(
        _cdAcaoDescricaoMeta,
        cdAcaoDescricao.isAcceptableOrUnknown(
          data['CDACAODESCRICAO']!,
          _cdAcaoDescricaoMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_cdAcaoDescricaoMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {cdAcaoId};
  @override
  CDACAOData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CDACAOData(
      cdAcaoId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}CDACAOID'],
      )!,
      cdAcaoDescricao: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}CDACAODESCRICAO'],
      )!,
    );
  }

  @override
  $CDACAOTable createAlias(String alias) {
    return $CDACAOTable(attachedDatabase, alias);
  }
}

class CDACAOData extends DataClass implements Insertable<CDACAOData> {
  final int cdAcaoId;
  final String cdAcaoDescricao;
  const CDACAOData({required this.cdAcaoId, required this.cdAcaoDescricao});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['CDACAOID'] = Variable<int>(cdAcaoId);
    map['CDACAODESCRICAO'] = Variable<String>(cdAcaoDescricao);
    return map;
  }

  CDACAOCompanion toCompanion(bool nullToAbsent) {
    return CDACAOCompanion(
      cdAcaoId: Value(cdAcaoId),
      cdAcaoDescricao: Value(cdAcaoDescricao),
    );
  }

  factory CDACAOData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CDACAOData(
      cdAcaoId: serializer.fromJson<int>(json['cdAcaoId']),
      cdAcaoDescricao: serializer.fromJson<String>(json['cdAcaoDescricao']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'cdAcaoId': serializer.toJson<int>(cdAcaoId),
      'cdAcaoDescricao': serializer.toJson<String>(cdAcaoDescricao),
    };
  }

  CDACAOData copyWith({int? cdAcaoId, String? cdAcaoDescricao}) => CDACAOData(
    cdAcaoId: cdAcaoId ?? this.cdAcaoId,
    cdAcaoDescricao: cdAcaoDescricao ?? this.cdAcaoDescricao,
  );
  CDACAOData copyWithCompanion(CDACAOCompanion data) {
    return CDACAOData(
      cdAcaoId: data.cdAcaoId.present ? data.cdAcaoId.value : this.cdAcaoId,
      cdAcaoDescricao: data.cdAcaoDescricao.present
          ? data.cdAcaoDescricao.value
          : this.cdAcaoDescricao,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CDACAOData(')
          ..write('cdAcaoId: $cdAcaoId, ')
          ..write('cdAcaoDescricao: $cdAcaoDescricao')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(cdAcaoId, cdAcaoDescricao);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CDACAOData &&
          other.cdAcaoId == this.cdAcaoId &&
          other.cdAcaoDescricao == this.cdAcaoDescricao);
}

class CDACAOCompanion extends UpdateCompanion<CDACAOData> {
  final Value<int> cdAcaoId;
  final Value<String> cdAcaoDescricao;
  const CDACAOCompanion({
    this.cdAcaoId = const Value.absent(),
    this.cdAcaoDescricao = const Value.absent(),
  });
  CDACAOCompanion.insert({
    this.cdAcaoId = const Value.absent(),
    required String cdAcaoDescricao,
  }) : cdAcaoDescricao = Value(cdAcaoDescricao);
  static Insertable<CDACAOData> custom({
    Expression<int>? cdAcaoId,
    Expression<String>? cdAcaoDescricao,
  }) {
    return RawValuesInsertable({
      if (cdAcaoId != null) 'CDACAOID': cdAcaoId,
      if (cdAcaoDescricao != null) 'CDACAODESCRICAO': cdAcaoDescricao,
    });
  }

  CDACAOCompanion copyWith({
    Value<int>? cdAcaoId,
    Value<String>? cdAcaoDescricao,
  }) {
    return CDACAOCompanion(
      cdAcaoId: cdAcaoId ?? this.cdAcaoId,
      cdAcaoDescricao: cdAcaoDescricao ?? this.cdAcaoDescricao,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (cdAcaoId.present) {
      map['CDACAOID'] = Variable<int>(cdAcaoId.value);
    }
    if (cdAcaoDescricao.present) {
      map['CDACAODESCRICAO'] = Variable<String>(cdAcaoDescricao.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CDACAOCompanion(')
          ..write('cdAcaoId: $cdAcaoId, ')
          ..write('cdAcaoDescricao: $cdAcaoDescricao')
          ..write(')'))
        .toString();
  }
}

class $LCAUDITORIATable extends LCAUDITORIA
    with TableInfo<$LCAUDITORIATable, LCAUDITORIAData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LCAUDITORIATable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _lcAudIdMeta = const VerificationMeta(
    'lcAudId',
  );
  @override
  late final GeneratedColumn<int> lcAudId = GeneratedColumn<int>(
    'LCAUDID',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _lcAudDescricaoMeta = const VerificationMeta(
    'lcAudDescricao',
  );
  @override
  late final GeneratedColumn<String> lcAudDescricao = GeneratedColumn<String>(
    'LCAUDDESCRICAO',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lcAudDataMeta = const VerificationMeta(
    'lcAudData',
  );
  @override
  late final GeneratedColumn<DateTime> lcAudData = GeneratedColumn<DateTime>(
    'LCAUDDATA',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lcAudAcaoIdMeta = const VerificationMeta(
    'lcAudAcaoId',
  );
  @override
  late final GeneratedColumn<int> lcAudAcaoId = GeneratedColumn<int>(
    'LCAUDACAOID',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES cdacao (CDACAOID)',
    ),
  );
  static const VerificationMeta _lcAudEmpresaIdMeta = const VerificationMeta(
    'lcAudEmpresaId',
  );
  @override
  late final GeneratedColumn<int> lcAudEmpresaId = GeneratedColumn<int>(
    'LCAUDEMPRESAID',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES cdempresa (CDEMPID)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    lcAudId,
    lcAudDescricao,
    lcAudData,
    lcAudAcaoId,
    lcAudEmpresaId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'lcauditoria';
  @override
  VerificationContext validateIntegrity(
    Insertable<LCAUDITORIAData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('LCAUDID')) {
      context.handle(
        _lcAudIdMeta,
        lcAudId.isAcceptableOrUnknown(data['LCAUDID']!, _lcAudIdMeta),
      );
    }
    if (data.containsKey('LCAUDDESCRICAO')) {
      context.handle(
        _lcAudDescricaoMeta,
        lcAudDescricao.isAcceptableOrUnknown(
          data['LCAUDDESCRICAO']!,
          _lcAudDescricaoMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_lcAudDescricaoMeta);
    }
    if (data.containsKey('LCAUDDATA')) {
      context.handle(
        _lcAudDataMeta,
        lcAudData.isAcceptableOrUnknown(data['LCAUDDATA']!, _lcAudDataMeta),
      );
    } else if (isInserting) {
      context.missing(_lcAudDataMeta);
    }
    if (data.containsKey('LCAUDACAOID')) {
      context.handle(
        _lcAudAcaoIdMeta,
        lcAudAcaoId.isAcceptableOrUnknown(
          data['LCAUDACAOID']!,
          _lcAudAcaoIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_lcAudAcaoIdMeta);
    }
    if (data.containsKey('LCAUDEMPRESAID')) {
      context.handle(
        _lcAudEmpresaIdMeta,
        lcAudEmpresaId.isAcceptableOrUnknown(
          data['LCAUDEMPRESAID']!,
          _lcAudEmpresaIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_lcAudEmpresaIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {lcAudId};
  @override
  LCAUDITORIAData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LCAUDITORIAData(
      lcAudId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}LCAUDID'],
      )!,
      lcAudDescricao: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}LCAUDDESCRICAO'],
      )!,
      lcAudData: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}LCAUDDATA'],
      )!,
      lcAudAcaoId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}LCAUDACAOID'],
      )!,
      lcAudEmpresaId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}LCAUDEMPRESAID'],
      )!,
    );
  }

  @override
  $LCAUDITORIATable createAlias(String alias) {
    return $LCAUDITORIATable(attachedDatabase, alias);
  }
}

class LCAUDITORIAData extends DataClass implements Insertable<LCAUDITORIAData> {
  final int lcAudId;
  final String lcAudDescricao;
  final DateTime lcAudData;
  final int lcAudAcaoId;
  final int lcAudEmpresaId;
  const LCAUDITORIAData({
    required this.lcAudId,
    required this.lcAudDescricao,
    required this.lcAudData,
    required this.lcAudAcaoId,
    required this.lcAudEmpresaId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['LCAUDID'] = Variable<int>(lcAudId);
    map['LCAUDDESCRICAO'] = Variable<String>(lcAudDescricao);
    map['LCAUDDATA'] = Variable<DateTime>(lcAudData);
    map['LCAUDACAOID'] = Variable<int>(lcAudAcaoId);
    map['LCAUDEMPRESAID'] = Variable<int>(lcAudEmpresaId);
    return map;
  }

  LCAUDITORIACompanion toCompanion(bool nullToAbsent) {
    return LCAUDITORIACompanion(
      lcAudId: Value(lcAudId),
      lcAudDescricao: Value(lcAudDescricao),
      lcAudData: Value(lcAudData),
      lcAudAcaoId: Value(lcAudAcaoId),
      lcAudEmpresaId: Value(lcAudEmpresaId),
    );
  }

  factory LCAUDITORIAData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LCAUDITORIAData(
      lcAudId: serializer.fromJson<int>(json['lcAudId']),
      lcAudDescricao: serializer.fromJson<String>(json['lcAudDescricao']),
      lcAudData: serializer.fromJson<DateTime>(json['lcAudData']),
      lcAudAcaoId: serializer.fromJson<int>(json['lcAudAcaoId']),
      lcAudEmpresaId: serializer.fromJson<int>(json['lcAudEmpresaId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'lcAudId': serializer.toJson<int>(lcAudId),
      'lcAudDescricao': serializer.toJson<String>(lcAudDescricao),
      'lcAudData': serializer.toJson<DateTime>(lcAudData),
      'lcAudAcaoId': serializer.toJson<int>(lcAudAcaoId),
      'lcAudEmpresaId': serializer.toJson<int>(lcAudEmpresaId),
    };
  }

  LCAUDITORIAData copyWith({
    int? lcAudId,
    String? lcAudDescricao,
    DateTime? lcAudData,
    int? lcAudAcaoId,
    int? lcAudEmpresaId,
  }) => LCAUDITORIAData(
    lcAudId: lcAudId ?? this.lcAudId,
    lcAudDescricao: lcAudDescricao ?? this.lcAudDescricao,
    lcAudData: lcAudData ?? this.lcAudData,
    lcAudAcaoId: lcAudAcaoId ?? this.lcAudAcaoId,
    lcAudEmpresaId: lcAudEmpresaId ?? this.lcAudEmpresaId,
  );
  LCAUDITORIAData copyWithCompanion(LCAUDITORIACompanion data) {
    return LCAUDITORIAData(
      lcAudId: data.lcAudId.present ? data.lcAudId.value : this.lcAudId,
      lcAudDescricao: data.lcAudDescricao.present
          ? data.lcAudDescricao.value
          : this.lcAudDescricao,
      lcAudData: data.lcAudData.present ? data.lcAudData.value : this.lcAudData,
      lcAudAcaoId: data.lcAudAcaoId.present
          ? data.lcAudAcaoId.value
          : this.lcAudAcaoId,
      lcAudEmpresaId: data.lcAudEmpresaId.present
          ? data.lcAudEmpresaId.value
          : this.lcAudEmpresaId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LCAUDITORIAData(')
          ..write('lcAudId: $lcAudId, ')
          ..write('lcAudDescricao: $lcAudDescricao, ')
          ..write('lcAudData: $lcAudData, ')
          ..write('lcAudAcaoId: $lcAudAcaoId, ')
          ..write('lcAudEmpresaId: $lcAudEmpresaId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    lcAudId,
    lcAudDescricao,
    lcAudData,
    lcAudAcaoId,
    lcAudEmpresaId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LCAUDITORIAData &&
          other.lcAudId == this.lcAudId &&
          other.lcAudDescricao == this.lcAudDescricao &&
          other.lcAudData == this.lcAudData &&
          other.lcAudAcaoId == this.lcAudAcaoId &&
          other.lcAudEmpresaId == this.lcAudEmpresaId);
}

class LCAUDITORIACompanion extends UpdateCompanion<LCAUDITORIAData> {
  final Value<int> lcAudId;
  final Value<String> lcAudDescricao;
  final Value<DateTime> lcAudData;
  final Value<int> lcAudAcaoId;
  final Value<int> lcAudEmpresaId;
  const LCAUDITORIACompanion({
    this.lcAudId = const Value.absent(),
    this.lcAudDescricao = const Value.absent(),
    this.lcAudData = const Value.absent(),
    this.lcAudAcaoId = const Value.absent(),
    this.lcAudEmpresaId = const Value.absent(),
  });
  LCAUDITORIACompanion.insert({
    this.lcAudId = const Value.absent(),
    required String lcAudDescricao,
    required DateTime lcAudData,
    required int lcAudAcaoId,
    required int lcAudEmpresaId,
  }) : lcAudDescricao = Value(lcAudDescricao),
       lcAudData = Value(lcAudData),
       lcAudAcaoId = Value(lcAudAcaoId),
       lcAudEmpresaId = Value(lcAudEmpresaId);
  static Insertable<LCAUDITORIAData> custom({
    Expression<int>? lcAudId,
    Expression<String>? lcAudDescricao,
    Expression<DateTime>? lcAudData,
    Expression<int>? lcAudAcaoId,
    Expression<int>? lcAudEmpresaId,
  }) {
    return RawValuesInsertable({
      if (lcAudId != null) 'LCAUDID': lcAudId,
      if (lcAudDescricao != null) 'LCAUDDESCRICAO': lcAudDescricao,
      if (lcAudData != null) 'LCAUDDATA': lcAudData,
      if (lcAudAcaoId != null) 'LCAUDACAOID': lcAudAcaoId,
      if (lcAudEmpresaId != null) 'LCAUDEMPRESAID': lcAudEmpresaId,
    });
  }

  LCAUDITORIACompanion copyWith({
    Value<int>? lcAudId,
    Value<String>? lcAudDescricao,
    Value<DateTime>? lcAudData,
    Value<int>? lcAudAcaoId,
    Value<int>? lcAudEmpresaId,
  }) {
    return LCAUDITORIACompanion(
      lcAudId: lcAudId ?? this.lcAudId,
      lcAudDescricao: lcAudDescricao ?? this.lcAudDescricao,
      lcAudData: lcAudData ?? this.lcAudData,
      lcAudAcaoId: lcAudAcaoId ?? this.lcAudAcaoId,
      lcAudEmpresaId: lcAudEmpresaId ?? this.lcAudEmpresaId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (lcAudId.present) {
      map['LCAUDID'] = Variable<int>(lcAudId.value);
    }
    if (lcAudDescricao.present) {
      map['LCAUDDESCRICAO'] = Variable<String>(lcAudDescricao.value);
    }
    if (lcAudData.present) {
      map['LCAUDDATA'] = Variable<DateTime>(lcAudData.value);
    }
    if (lcAudAcaoId.present) {
      map['LCAUDACAOID'] = Variable<int>(lcAudAcaoId.value);
    }
    if (lcAudEmpresaId.present) {
      map['LCAUDEMPRESAID'] = Variable<int>(lcAudEmpresaId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LCAUDITORIACompanion(')
          ..write('lcAudId: $lcAudId, ')
          ..write('lcAudDescricao: $lcAudDescricao, ')
          ..write('lcAudData: $lcAudData, ')
          ..write('lcAudAcaoId: $lcAudAcaoId, ')
          ..write('lcAudEmpresaId: $lcAudEmpresaId')
          ..write(')'))
        .toString();
  }
}

class $LCCARRINHOTable extends LCCARRINHO
    with TableInfo<$LCCARRINHOTable, LCCARRINHOData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LCCARRINHOTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _lcCarIdMeta = const VerificationMeta(
    'lcCarId',
  );
  @override
  late final GeneratedColumn<int> lcCarId = GeneratedColumn<int>(
    'LCCARID',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _lcCarProdutoIdMeta = const VerificationMeta(
    'lcCarProdutoId',
  );
  @override
  late final GeneratedColumn<int> lcCarProdutoId = GeneratedColumn<int>(
    'LCCARPRODUTOID',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES cdproduto (CDPRODID)',
    ),
  );
  static const VerificationMeta _lcCarUsuarioIdMeta = const VerificationMeta(
    'lcCarUsuarioId',
  );
  @override
  late final GeneratedColumn<int> lcCarUsuarioId = GeneratedColumn<int>(
    'LCCARUSUARIOID',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES cdsenha (CDSEID)',
    ),
  );
  static const VerificationMeta _lcCarQuantidadeMeta = const VerificationMeta(
    'lcCarQuantidade',
  );
  @override
  late final GeneratedColumn<int> lcCarQuantidade = GeneratedColumn<int>(
    'LCCARQUANTIDADE',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    lcCarId,
    lcCarProdutoId,
    lcCarUsuarioId,
    lcCarQuantidade,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'lccarrinho';
  @override
  VerificationContext validateIntegrity(
    Insertable<LCCARRINHOData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('LCCARID')) {
      context.handle(
        _lcCarIdMeta,
        lcCarId.isAcceptableOrUnknown(data['LCCARID']!, _lcCarIdMeta),
      );
    }
    if (data.containsKey('LCCARPRODUTOID')) {
      context.handle(
        _lcCarProdutoIdMeta,
        lcCarProdutoId.isAcceptableOrUnknown(
          data['LCCARPRODUTOID']!,
          _lcCarProdutoIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_lcCarProdutoIdMeta);
    }
    if (data.containsKey('LCCARUSUARIOID')) {
      context.handle(
        _lcCarUsuarioIdMeta,
        lcCarUsuarioId.isAcceptableOrUnknown(
          data['LCCARUSUARIOID']!,
          _lcCarUsuarioIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_lcCarUsuarioIdMeta);
    }
    if (data.containsKey('LCCARQUANTIDADE')) {
      context.handle(
        _lcCarQuantidadeMeta,
        lcCarQuantidade.isAcceptableOrUnknown(
          data['LCCARQUANTIDADE']!,
          _lcCarQuantidadeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_lcCarQuantidadeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {lcCarId};
  @override
  LCCARRINHOData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LCCARRINHOData(
      lcCarId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}LCCARID'],
      )!,
      lcCarProdutoId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}LCCARPRODUTOID'],
      )!,
      lcCarUsuarioId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}LCCARUSUARIOID'],
      )!,
      lcCarQuantidade: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}LCCARQUANTIDADE'],
      )!,
    );
  }

  @override
  $LCCARRINHOTable createAlias(String alias) {
    return $LCCARRINHOTable(attachedDatabase, alias);
  }
}

class LCCARRINHOData extends DataClass implements Insertable<LCCARRINHOData> {
  final int lcCarId;
  final int lcCarProdutoId;
  final int lcCarUsuarioId;
  final int lcCarQuantidade;
  const LCCARRINHOData({
    required this.lcCarId,
    required this.lcCarProdutoId,
    required this.lcCarUsuarioId,
    required this.lcCarQuantidade,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['LCCARID'] = Variable<int>(lcCarId);
    map['LCCARPRODUTOID'] = Variable<int>(lcCarProdutoId);
    map['LCCARUSUARIOID'] = Variable<int>(lcCarUsuarioId);
    map['LCCARQUANTIDADE'] = Variable<int>(lcCarQuantidade);
    return map;
  }

  LCCARRINHOCompanion toCompanion(bool nullToAbsent) {
    return LCCARRINHOCompanion(
      lcCarId: Value(lcCarId),
      lcCarProdutoId: Value(lcCarProdutoId),
      lcCarUsuarioId: Value(lcCarUsuarioId),
      lcCarQuantidade: Value(lcCarQuantidade),
    );
  }

  factory LCCARRINHOData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LCCARRINHOData(
      lcCarId: serializer.fromJson<int>(json['lcCarId']),
      lcCarProdutoId: serializer.fromJson<int>(json['lcCarProdutoId']),
      lcCarUsuarioId: serializer.fromJson<int>(json['lcCarUsuarioId']),
      lcCarQuantidade: serializer.fromJson<int>(json['lcCarQuantidade']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'lcCarId': serializer.toJson<int>(lcCarId),
      'lcCarProdutoId': serializer.toJson<int>(lcCarProdutoId),
      'lcCarUsuarioId': serializer.toJson<int>(lcCarUsuarioId),
      'lcCarQuantidade': serializer.toJson<int>(lcCarQuantidade),
    };
  }

  LCCARRINHOData copyWith({
    int? lcCarId,
    int? lcCarProdutoId,
    int? lcCarUsuarioId,
    int? lcCarQuantidade,
  }) => LCCARRINHOData(
    lcCarId: lcCarId ?? this.lcCarId,
    lcCarProdutoId: lcCarProdutoId ?? this.lcCarProdutoId,
    lcCarUsuarioId: lcCarUsuarioId ?? this.lcCarUsuarioId,
    lcCarQuantidade: lcCarQuantidade ?? this.lcCarQuantidade,
  );
  LCCARRINHOData copyWithCompanion(LCCARRINHOCompanion data) {
    return LCCARRINHOData(
      lcCarId: data.lcCarId.present ? data.lcCarId.value : this.lcCarId,
      lcCarProdutoId: data.lcCarProdutoId.present
          ? data.lcCarProdutoId.value
          : this.lcCarProdutoId,
      lcCarUsuarioId: data.lcCarUsuarioId.present
          ? data.lcCarUsuarioId.value
          : this.lcCarUsuarioId,
      lcCarQuantidade: data.lcCarQuantidade.present
          ? data.lcCarQuantidade.value
          : this.lcCarQuantidade,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LCCARRINHOData(')
          ..write('lcCarId: $lcCarId, ')
          ..write('lcCarProdutoId: $lcCarProdutoId, ')
          ..write('lcCarUsuarioId: $lcCarUsuarioId, ')
          ..write('lcCarQuantidade: $lcCarQuantidade')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(lcCarId, lcCarProdutoId, lcCarUsuarioId, lcCarQuantidade);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LCCARRINHOData &&
          other.lcCarId == this.lcCarId &&
          other.lcCarProdutoId == this.lcCarProdutoId &&
          other.lcCarUsuarioId == this.lcCarUsuarioId &&
          other.lcCarQuantidade == this.lcCarQuantidade);
}

class LCCARRINHOCompanion extends UpdateCompanion<LCCARRINHOData> {
  final Value<int> lcCarId;
  final Value<int> lcCarProdutoId;
  final Value<int> lcCarUsuarioId;
  final Value<int> lcCarQuantidade;
  const LCCARRINHOCompanion({
    this.lcCarId = const Value.absent(),
    this.lcCarProdutoId = const Value.absent(),
    this.lcCarUsuarioId = const Value.absent(),
    this.lcCarQuantidade = const Value.absent(),
  });
  LCCARRINHOCompanion.insert({
    this.lcCarId = const Value.absent(),
    required int lcCarProdutoId,
    required int lcCarUsuarioId,
    required int lcCarQuantidade,
  }) : lcCarProdutoId = Value(lcCarProdutoId),
       lcCarUsuarioId = Value(lcCarUsuarioId),
       lcCarQuantidade = Value(lcCarQuantidade);
  static Insertable<LCCARRINHOData> custom({
    Expression<int>? lcCarId,
    Expression<int>? lcCarProdutoId,
    Expression<int>? lcCarUsuarioId,
    Expression<int>? lcCarQuantidade,
  }) {
    return RawValuesInsertable({
      if (lcCarId != null) 'LCCARID': lcCarId,
      if (lcCarProdutoId != null) 'LCCARPRODUTOID': lcCarProdutoId,
      if (lcCarUsuarioId != null) 'LCCARUSUARIOID': lcCarUsuarioId,
      if (lcCarQuantidade != null) 'LCCARQUANTIDADE': lcCarQuantidade,
    });
  }

  LCCARRINHOCompanion copyWith({
    Value<int>? lcCarId,
    Value<int>? lcCarProdutoId,
    Value<int>? lcCarUsuarioId,
    Value<int>? lcCarQuantidade,
  }) {
    return LCCARRINHOCompanion(
      lcCarId: lcCarId ?? this.lcCarId,
      lcCarProdutoId: lcCarProdutoId ?? this.lcCarProdutoId,
      lcCarUsuarioId: lcCarUsuarioId ?? this.lcCarUsuarioId,
      lcCarQuantidade: lcCarQuantidade ?? this.lcCarQuantidade,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (lcCarId.present) {
      map['LCCARID'] = Variable<int>(lcCarId.value);
    }
    if (lcCarProdutoId.present) {
      map['LCCARPRODUTOID'] = Variable<int>(lcCarProdutoId.value);
    }
    if (lcCarUsuarioId.present) {
      map['LCCARUSUARIOID'] = Variable<int>(lcCarUsuarioId.value);
    }
    if (lcCarQuantidade.present) {
      map['LCCARQUANTIDADE'] = Variable<int>(lcCarQuantidade.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LCCARRINHOCompanion(')
          ..write('lcCarId: $lcCarId, ')
          ..write('lcCarProdutoId: $lcCarProdutoId, ')
          ..write('lcCarUsuarioId: $lcCarUsuarioId, ')
          ..write('lcCarQuantidade: $lcCarQuantidade')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CDEMPRESATable cdempresa = $CDEMPRESATable(this);
  late final $CDCARGOTable cdcargo = $CDCARGOTable(this);
  late final $CDSENHATable cdsenha = $CDSENHATable(this);
  late final $FIDELSESSAOTable fidelsessao = $FIDELSESSAOTable(this);
  late final $LCVENDATable lcvenda = $LCVENDATable(this);
  late final $CDCATEGORIATable cdcategoria = $CDCATEGORIATable(this);
  late final $CDPRODUTOTable cdproduto = $CDPRODUTOTable(this);
  late final $CDPRODUTOIMAGEMTable cdprodutoimagem = $CDPRODUTOIMAGEMTable(
    this,
  );
  late final $CDEXCECAOTable cdexcecao = $CDEXCECAOTable(this);
  late final $CDACAOTable cdacao = $CDACAOTable(this);
  late final $LCAUDITORIATable lcauditoria = $LCAUDITORIATable(this);
  late final $LCCARRINHOTable lccarrinho = $LCCARRINHOTable(this);
  late final CDEMPRESADAO cdempresadao = CDEMPRESADAO(this as AppDatabase);
  late final CDCARGODAO cdcargodao = CDCARGODAO(this as AppDatabase);
  late final CDSENHADAO cdsenhadao = CDSENHADAO(this as AppDatabase);
  late final FIDELSESSAODAO fidelsessaodao = FIDELSESSAODAO(
    this as AppDatabase,
  );
  late final LCVENDADAO lcvendadao = LCVENDADAO(this as AppDatabase);
  late final CDPRODUTODAO cdprodutodao = CDPRODUTODAO(this as AppDatabase);
  late final CDCATEGORIADAO cdcategoriadao = CDCATEGORIADAO(
    this as AppDatabase,
  );
  late final CDPRODUTOIMAGEMDAO cdprodutoimagemdao = CDPRODUTOIMAGEMDAO(
    this as AppDatabase,
  );
  late final CDEXCECAODAO cdexcecaodao = CDEXCECAODAO(this as AppDatabase);
  late final CDACAODAO cdacaodao = CDACAODAO(this as AppDatabase);
  late final LCAUDITORIADAO lcauditoriadao = LCAUDITORIADAO(
    this as AppDatabase,
  );
  late final LCCARRINHODAO lccarrinhodao = LCCARRINHODAO(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    cdempresa,
    cdcargo,
    cdsenha,
    fidelsessao,
    lcvenda,
    cdcategoria,
    cdproduto,
    cdprodutoimagem,
    cdexcecao,
    cdacao,
    lcauditoria,
    lccarrinho,
  ];
}

typedef $$CDEMPRESATableCreateCompanionBuilder =
    CDEMPRESACompanion Function({
      Value<int> cdEmpId,
      required String cdEmpNome,
    });
typedef $$CDEMPRESATableUpdateCompanionBuilder =
    CDEMPRESACompanion Function({Value<int> cdEmpId, Value<String> cdEmpNome});

final class $$CDEMPRESATableReferences
    extends BaseReferences<_$AppDatabase, $CDEMPRESATable, CDEMPRESAData> {
  $$CDEMPRESATableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$CDCARGOTable, List<CDCARGOData>>
  _cdcargoRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.cdcargo,
    aliasName: $_aliasNameGenerator(
      db.cdempresa.cdEmpId,
      db.cdcargo.cdCarEmpresaId,
    ),
  );

  $$CDCARGOTableProcessedTableManager get cdcargoRefs {
    final manager = $$CDCARGOTableTableManager($_db, $_db.cdcargo).filter(
      (f) => f.cdCarEmpresaId.cdEmpId.sqlEquals($_itemColumn<int>('CDEMPID')!),
    );

    final cache = $_typedResult.readTableOrNull(_cdcargoRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$CDPRODUTOTable, List<CDPRODUTOData>>
  _cdprodutoRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.cdproduto,
    aliasName: $_aliasNameGenerator(
      db.cdempresa.cdEmpId,
      db.cdproduto.cdProdEmpresaId,
    ),
  );

  $$CDPRODUTOTableProcessedTableManager get cdprodutoRefs {
    final manager = $$CDPRODUTOTableTableManager($_db, $_db.cdproduto).filter(
      (f) => f.cdProdEmpresaId.cdEmpId.sqlEquals($_itemColumn<int>('CDEMPID')!),
    );

    final cache = $_typedResult.readTableOrNull(_cdprodutoRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$CDEXCECAOTable, List<CDEXCECAOData>>
  _cdexcecaoRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.cdexcecao,
    aliasName: $_aliasNameGenerator(
      db.cdempresa.cdEmpId,
      db.cdexcecao.cdExEmpresaId,
    ),
  );

  $$CDEXCECAOTableProcessedTableManager get cdexcecaoRefs {
    final manager = $$CDEXCECAOTableTableManager($_db, $_db.cdexcecao).filter(
      (f) => f.cdExEmpresaId.cdEmpId.sqlEquals($_itemColumn<int>('CDEMPID')!),
    );

    final cache = $_typedResult.readTableOrNull(_cdexcecaoRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$LCAUDITORIATable, List<LCAUDITORIAData>>
  _lcauditoriaRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.lcauditoria,
    aliasName: $_aliasNameGenerator(
      db.cdempresa.cdEmpId,
      db.lcauditoria.lcAudEmpresaId,
    ),
  );

  $$LCAUDITORIATableProcessedTableManager get lcauditoriaRefs {
    final manager = $$LCAUDITORIATableTableManager($_db, $_db.lcauditoria)
        .filter(
          (f) =>
              f.lcAudEmpresaId.cdEmpId.sqlEquals($_itemColumn<int>('CDEMPID')!),
        );

    final cache = $_typedResult.readTableOrNull(_lcauditoriaRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CDEMPRESATableFilterComposer
    extends Composer<_$AppDatabase, $CDEMPRESATable> {
  $$CDEMPRESATableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get cdEmpId => $composableBuilder(
    column: $table.cdEmpId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cdEmpNome => $composableBuilder(
    column: $table.cdEmpNome,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> cdcargoRefs(
    Expression<bool> Function($$CDCARGOTableFilterComposer f) f,
  ) {
    final $$CDCARGOTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cdEmpId,
      referencedTable: $db.cdcargo,
      getReferencedColumn: (t) => t.cdCarEmpresaId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CDCARGOTableFilterComposer(
            $db: $db,
            $table: $db.cdcargo,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> cdprodutoRefs(
    Expression<bool> Function($$CDPRODUTOTableFilterComposer f) f,
  ) {
    final $$CDPRODUTOTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cdEmpId,
      referencedTable: $db.cdproduto,
      getReferencedColumn: (t) => t.cdProdEmpresaId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CDPRODUTOTableFilterComposer(
            $db: $db,
            $table: $db.cdproduto,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> cdexcecaoRefs(
    Expression<bool> Function($$CDEXCECAOTableFilterComposer f) f,
  ) {
    final $$CDEXCECAOTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cdEmpId,
      referencedTable: $db.cdexcecao,
      getReferencedColumn: (t) => t.cdExEmpresaId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CDEXCECAOTableFilterComposer(
            $db: $db,
            $table: $db.cdexcecao,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> lcauditoriaRefs(
    Expression<bool> Function($$LCAUDITORIATableFilterComposer f) f,
  ) {
    final $$LCAUDITORIATableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cdEmpId,
      referencedTable: $db.lcauditoria,
      getReferencedColumn: (t) => t.lcAudEmpresaId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LCAUDITORIATableFilterComposer(
            $db: $db,
            $table: $db.lcauditoria,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CDEMPRESATableOrderingComposer
    extends Composer<_$AppDatabase, $CDEMPRESATable> {
  $$CDEMPRESATableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get cdEmpId => $composableBuilder(
    column: $table.cdEmpId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cdEmpNome => $composableBuilder(
    column: $table.cdEmpNome,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CDEMPRESATableAnnotationComposer
    extends Composer<_$AppDatabase, $CDEMPRESATable> {
  $$CDEMPRESATableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get cdEmpId =>
      $composableBuilder(column: $table.cdEmpId, builder: (column) => column);

  GeneratedColumn<String> get cdEmpNome =>
      $composableBuilder(column: $table.cdEmpNome, builder: (column) => column);

  Expression<T> cdcargoRefs<T extends Object>(
    Expression<T> Function($$CDCARGOTableAnnotationComposer a) f,
  ) {
    final $$CDCARGOTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cdEmpId,
      referencedTable: $db.cdcargo,
      getReferencedColumn: (t) => t.cdCarEmpresaId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CDCARGOTableAnnotationComposer(
            $db: $db,
            $table: $db.cdcargo,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> cdprodutoRefs<T extends Object>(
    Expression<T> Function($$CDPRODUTOTableAnnotationComposer a) f,
  ) {
    final $$CDPRODUTOTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cdEmpId,
      referencedTable: $db.cdproduto,
      getReferencedColumn: (t) => t.cdProdEmpresaId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CDPRODUTOTableAnnotationComposer(
            $db: $db,
            $table: $db.cdproduto,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> cdexcecaoRefs<T extends Object>(
    Expression<T> Function($$CDEXCECAOTableAnnotationComposer a) f,
  ) {
    final $$CDEXCECAOTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cdEmpId,
      referencedTable: $db.cdexcecao,
      getReferencedColumn: (t) => t.cdExEmpresaId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CDEXCECAOTableAnnotationComposer(
            $db: $db,
            $table: $db.cdexcecao,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> lcauditoriaRefs<T extends Object>(
    Expression<T> Function($$LCAUDITORIATableAnnotationComposer a) f,
  ) {
    final $$LCAUDITORIATableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cdEmpId,
      referencedTable: $db.lcauditoria,
      getReferencedColumn: (t) => t.lcAudEmpresaId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LCAUDITORIATableAnnotationComposer(
            $db: $db,
            $table: $db.lcauditoria,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CDEMPRESATableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CDEMPRESATable,
          CDEMPRESAData,
          $$CDEMPRESATableFilterComposer,
          $$CDEMPRESATableOrderingComposer,
          $$CDEMPRESATableAnnotationComposer,
          $$CDEMPRESATableCreateCompanionBuilder,
          $$CDEMPRESATableUpdateCompanionBuilder,
          (CDEMPRESAData, $$CDEMPRESATableReferences),
          CDEMPRESAData,
          PrefetchHooks Function({
            bool cdcargoRefs,
            bool cdprodutoRefs,
            bool cdexcecaoRefs,
            bool lcauditoriaRefs,
          })
        > {
  $$CDEMPRESATableTableManager(_$AppDatabase db, $CDEMPRESATable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CDEMPRESATableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CDEMPRESATableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CDEMPRESATableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> cdEmpId = const Value.absent(),
                Value<String> cdEmpNome = const Value.absent(),
              }) => CDEMPRESACompanion(cdEmpId: cdEmpId, cdEmpNome: cdEmpNome),
          createCompanionCallback:
              ({
                Value<int> cdEmpId = const Value.absent(),
                required String cdEmpNome,
              }) => CDEMPRESACompanion.insert(
                cdEmpId: cdEmpId,
                cdEmpNome: cdEmpNome,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CDEMPRESATableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                cdcargoRefs = false,
                cdprodutoRefs = false,
                cdexcecaoRefs = false,
                lcauditoriaRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (cdcargoRefs) db.cdcargo,
                    if (cdprodutoRefs) db.cdproduto,
                    if (cdexcecaoRefs) db.cdexcecao,
                    if (lcauditoriaRefs) db.lcauditoria,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (cdcargoRefs)
                        await $_getPrefetchedData<
                          CDEMPRESAData,
                          $CDEMPRESATable,
                          CDCARGOData
                        >(
                          currentTable: table,
                          referencedTable: $$CDEMPRESATableReferences
                              ._cdcargoRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CDEMPRESATableReferences(
                                db,
                                table,
                                p0,
                              ).cdcargoRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.cdCarEmpresaId == item.cdEmpId,
                              ),
                          typedResults: items,
                        ),
                      if (cdprodutoRefs)
                        await $_getPrefetchedData<
                          CDEMPRESAData,
                          $CDEMPRESATable,
                          CDPRODUTOData
                        >(
                          currentTable: table,
                          referencedTable: $$CDEMPRESATableReferences
                              ._cdprodutoRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CDEMPRESATableReferences(
                                db,
                                table,
                                p0,
                              ).cdprodutoRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.cdProdEmpresaId == item.cdEmpId,
                              ),
                          typedResults: items,
                        ),
                      if (cdexcecaoRefs)
                        await $_getPrefetchedData<
                          CDEMPRESAData,
                          $CDEMPRESATable,
                          CDEXCECAOData
                        >(
                          currentTable: table,
                          referencedTable: $$CDEMPRESATableReferences
                              ._cdexcecaoRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CDEMPRESATableReferences(
                                db,
                                table,
                                p0,
                              ).cdexcecaoRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.cdExEmpresaId == item.cdEmpId,
                              ),
                          typedResults: items,
                        ),
                      if (lcauditoriaRefs)
                        await $_getPrefetchedData<
                          CDEMPRESAData,
                          $CDEMPRESATable,
                          LCAUDITORIAData
                        >(
                          currentTable: table,
                          referencedTable: $$CDEMPRESATableReferences
                              ._lcauditoriaRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CDEMPRESATableReferences(
                                db,
                                table,
                                p0,
                              ).lcauditoriaRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.lcAudEmpresaId == item.cdEmpId,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$CDEMPRESATableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CDEMPRESATable,
      CDEMPRESAData,
      $$CDEMPRESATableFilterComposer,
      $$CDEMPRESATableOrderingComposer,
      $$CDEMPRESATableAnnotationComposer,
      $$CDEMPRESATableCreateCompanionBuilder,
      $$CDEMPRESATableUpdateCompanionBuilder,
      (CDEMPRESAData, $$CDEMPRESATableReferences),
      CDEMPRESAData,
      PrefetchHooks Function({
        bool cdcargoRefs,
        bool cdprodutoRefs,
        bool cdexcecaoRefs,
        bool lcauditoriaRefs,
      })
    >;
typedef $$CDCARGOTableCreateCompanionBuilder =
    CDCARGOCompanion Function({
      Value<int> cdCarid,
      required String cdCarNome,
      required int cdCarEmpresaId,
    });
typedef $$CDCARGOTableUpdateCompanionBuilder =
    CDCARGOCompanion Function({
      Value<int> cdCarid,
      Value<String> cdCarNome,
      Value<int> cdCarEmpresaId,
    });

final class $$CDCARGOTableReferences
    extends BaseReferences<_$AppDatabase, $CDCARGOTable, CDCARGOData> {
  $$CDCARGOTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CDEMPRESATable _cdCarEmpresaIdTable(_$AppDatabase db) =>
      db.cdempresa.createAlias(
        $_aliasNameGenerator(db.cdcargo.cdCarEmpresaId, db.cdempresa.cdEmpId),
      );

  $$CDEMPRESATableProcessedTableManager get cdCarEmpresaId {
    final $_column = $_itemColumn<int>('CDCAREMPRESAID')!;

    final manager = $$CDEMPRESATableTableManager(
      $_db,
      $_db.cdempresa,
    ).filter((f) => f.cdEmpId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_cdCarEmpresaIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$CDSENHATable, List<CDSENHAData>>
  _cdsenhaRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.cdsenha,
    aliasName: $_aliasNameGenerator(db.cdcargo.cdCarid, db.cdsenha.cdSeCargoId),
  );

  $$CDSENHATableProcessedTableManager get cdsenhaRefs {
    final manager = $$CDSENHATableTableManager($_db, $_db.cdsenha).filter(
      (f) => f.cdSeCargoId.cdCarid.sqlEquals($_itemColumn<int>('CDCARID')!),
    );

    final cache = $_typedResult.readTableOrNull(_cdsenhaRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CDCARGOTableFilterComposer
    extends Composer<_$AppDatabase, $CDCARGOTable> {
  $$CDCARGOTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get cdCarid => $composableBuilder(
    column: $table.cdCarid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cdCarNome => $composableBuilder(
    column: $table.cdCarNome,
    builder: (column) => ColumnFilters(column),
  );

  $$CDEMPRESATableFilterComposer get cdCarEmpresaId {
    final $$CDEMPRESATableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cdCarEmpresaId,
      referencedTable: $db.cdempresa,
      getReferencedColumn: (t) => t.cdEmpId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CDEMPRESATableFilterComposer(
            $db: $db,
            $table: $db.cdempresa,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> cdsenhaRefs(
    Expression<bool> Function($$CDSENHATableFilterComposer f) f,
  ) {
    final $$CDSENHATableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cdCarid,
      referencedTable: $db.cdsenha,
      getReferencedColumn: (t) => t.cdSeCargoId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CDSENHATableFilterComposer(
            $db: $db,
            $table: $db.cdsenha,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CDCARGOTableOrderingComposer
    extends Composer<_$AppDatabase, $CDCARGOTable> {
  $$CDCARGOTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get cdCarid => $composableBuilder(
    column: $table.cdCarid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cdCarNome => $composableBuilder(
    column: $table.cdCarNome,
    builder: (column) => ColumnOrderings(column),
  );

  $$CDEMPRESATableOrderingComposer get cdCarEmpresaId {
    final $$CDEMPRESATableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cdCarEmpresaId,
      referencedTable: $db.cdempresa,
      getReferencedColumn: (t) => t.cdEmpId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CDEMPRESATableOrderingComposer(
            $db: $db,
            $table: $db.cdempresa,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CDCARGOTableAnnotationComposer
    extends Composer<_$AppDatabase, $CDCARGOTable> {
  $$CDCARGOTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get cdCarid =>
      $composableBuilder(column: $table.cdCarid, builder: (column) => column);

  GeneratedColumn<String> get cdCarNome =>
      $composableBuilder(column: $table.cdCarNome, builder: (column) => column);

  $$CDEMPRESATableAnnotationComposer get cdCarEmpresaId {
    final $$CDEMPRESATableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cdCarEmpresaId,
      referencedTable: $db.cdempresa,
      getReferencedColumn: (t) => t.cdEmpId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CDEMPRESATableAnnotationComposer(
            $db: $db,
            $table: $db.cdempresa,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> cdsenhaRefs<T extends Object>(
    Expression<T> Function($$CDSENHATableAnnotationComposer a) f,
  ) {
    final $$CDSENHATableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cdCarid,
      referencedTable: $db.cdsenha,
      getReferencedColumn: (t) => t.cdSeCargoId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CDSENHATableAnnotationComposer(
            $db: $db,
            $table: $db.cdsenha,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CDCARGOTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CDCARGOTable,
          CDCARGOData,
          $$CDCARGOTableFilterComposer,
          $$CDCARGOTableOrderingComposer,
          $$CDCARGOTableAnnotationComposer,
          $$CDCARGOTableCreateCompanionBuilder,
          $$CDCARGOTableUpdateCompanionBuilder,
          (CDCARGOData, $$CDCARGOTableReferences),
          CDCARGOData,
          PrefetchHooks Function({bool cdCarEmpresaId, bool cdsenhaRefs})
        > {
  $$CDCARGOTableTableManager(_$AppDatabase db, $CDCARGOTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CDCARGOTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CDCARGOTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CDCARGOTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> cdCarid = const Value.absent(),
                Value<String> cdCarNome = const Value.absent(),
                Value<int> cdCarEmpresaId = const Value.absent(),
              }) => CDCARGOCompanion(
                cdCarid: cdCarid,
                cdCarNome: cdCarNome,
                cdCarEmpresaId: cdCarEmpresaId,
              ),
          createCompanionCallback:
              ({
                Value<int> cdCarid = const Value.absent(),
                required String cdCarNome,
                required int cdCarEmpresaId,
              }) => CDCARGOCompanion.insert(
                cdCarid: cdCarid,
                cdCarNome: cdCarNome,
                cdCarEmpresaId: cdCarEmpresaId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CDCARGOTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({cdCarEmpresaId = false, cdsenhaRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [if (cdsenhaRefs) db.cdsenha],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (cdCarEmpresaId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.cdCarEmpresaId,
                                    referencedTable: $$CDCARGOTableReferences
                                        ._cdCarEmpresaIdTable(db),
                                    referencedColumn: $$CDCARGOTableReferences
                                        ._cdCarEmpresaIdTable(db)
                                        .cdEmpId,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (cdsenhaRefs)
                        await $_getPrefetchedData<
                          CDCARGOData,
                          $CDCARGOTable,
                          CDSENHAData
                        >(
                          currentTable: table,
                          referencedTable: $$CDCARGOTableReferences
                              ._cdsenhaRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CDCARGOTableReferences(
                                db,
                                table,
                                p0,
                              ).cdsenhaRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.cdSeCargoId == item.cdCarid,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$CDCARGOTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CDCARGOTable,
      CDCARGOData,
      $$CDCARGOTableFilterComposer,
      $$CDCARGOTableOrderingComposer,
      $$CDCARGOTableAnnotationComposer,
      $$CDCARGOTableCreateCompanionBuilder,
      $$CDCARGOTableUpdateCompanionBuilder,
      (CDCARGOData, $$CDCARGOTableReferences),
      CDCARGOData,
      PrefetchHooks Function({bool cdCarEmpresaId, bool cdsenhaRefs})
    >;
typedef $$CDSENHATableCreateCompanionBuilder =
    CDSENHACompanion Function({
      Value<int> cdSeId,
      required String cdSeNome,
      required String cdSeSenha,
      Value<String?> cdSeCpfCnpj,
      required String cdSeEmail,
      Value<String?> cdSeTelefone,
      required int cdSeCargoId,
    });
typedef $$CDSENHATableUpdateCompanionBuilder =
    CDSENHACompanion Function({
      Value<int> cdSeId,
      Value<String> cdSeNome,
      Value<String> cdSeSenha,
      Value<String?> cdSeCpfCnpj,
      Value<String> cdSeEmail,
      Value<String?> cdSeTelefone,
      Value<int> cdSeCargoId,
    });

final class $$CDSENHATableReferences
    extends BaseReferences<_$AppDatabase, $CDSENHATable, CDSENHAData> {
  $$CDSENHATableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CDCARGOTable _cdSeCargoIdTable(_$AppDatabase db) =>
      db.cdcargo.createAlias(
        $_aliasNameGenerator(db.cdsenha.cdSeCargoId, db.cdcargo.cdCarid),
      );

  $$CDCARGOTableProcessedTableManager get cdSeCargoId {
    final $_column = $_itemColumn<int>('CDSECARGOID')!;

    final manager = $$CDCARGOTableTableManager(
      $_db,
      $_db.cdcargo,
    ).filter((f) => f.cdCarid.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_cdSeCargoIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$FIDELSESSAOTable, List<FIDELSESSAOData>>
  _fidelsessaoRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.fidelsessao,
    aliasName: $_aliasNameGenerator(
      db.cdsenha.cdSeId,
      db.fidelsessao.fidelSesSenhaId,
    ),
  );

  $$FIDELSESSAOTableProcessedTableManager get fidelsessaoRefs {
    final manager = $$FIDELSESSAOTableTableManager($_db, $_db.fidelsessao)
        .filter(
          (f) =>
              f.fidelSesSenhaId.cdSeId.sqlEquals($_itemColumn<int>('CDSEID')!),
        );

    final cache = $_typedResult.readTableOrNull(_fidelsessaoRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$LCVENDATable, List<LCVENDAData>>
  _lcvendaRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.lcvenda,
    aliasName: $_aliasNameGenerator(db.cdsenha.cdSeId, db.lcvenda.lcVenSenhaId),
  );

  $$LCVENDATableProcessedTableManager get lcvendaRefs {
    final manager = $$LCVENDATableTableManager($_db, $_db.lcvenda).filter(
      (f) => f.lcVenSenhaId.cdSeId.sqlEquals($_itemColumn<int>('CDSEID')!),
    );

    final cache = $_typedResult.readTableOrNull(_lcvendaRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$LCCARRINHOTable, List<LCCARRINHOData>>
  _lccarrinhoRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.lccarrinho,
    aliasName: $_aliasNameGenerator(
      db.cdsenha.cdSeId,
      db.lccarrinho.lcCarUsuarioId,
    ),
  );

  $$LCCARRINHOTableProcessedTableManager get lccarrinhoRefs {
    final manager = $$LCCARRINHOTableTableManager($_db, $_db.lccarrinho).filter(
      (f) => f.lcCarUsuarioId.cdSeId.sqlEquals($_itemColumn<int>('CDSEID')!),
    );

    final cache = $_typedResult.readTableOrNull(_lccarrinhoRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CDSENHATableFilterComposer
    extends Composer<_$AppDatabase, $CDSENHATable> {
  $$CDSENHATableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get cdSeId => $composableBuilder(
    column: $table.cdSeId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cdSeNome => $composableBuilder(
    column: $table.cdSeNome,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cdSeSenha => $composableBuilder(
    column: $table.cdSeSenha,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cdSeCpfCnpj => $composableBuilder(
    column: $table.cdSeCpfCnpj,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cdSeEmail => $composableBuilder(
    column: $table.cdSeEmail,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cdSeTelefone => $composableBuilder(
    column: $table.cdSeTelefone,
    builder: (column) => ColumnFilters(column),
  );

  $$CDCARGOTableFilterComposer get cdSeCargoId {
    final $$CDCARGOTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cdSeCargoId,
      referencedTable: $db.cdcargo,
      getReferencedColumn: (t) => t.cdCarid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CDCARGOTableFilterComposer(
            $db: $db,
            $table: $db.cdcargo,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> fidelsessaoRefs(
    Expression<bool> Function($$FIDELSESSAOTableFilterComposer f) f,
  ) {
    final $$FIDELSESSAOTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cdSeId,
      referencedTable: $db.fidelsessao,
      getReferencedColumn: (t) => t.fidelSesSenhaId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FIDELSESSAOTableFilterComposer(
            $db: $db,
            $table: $db.fidelsessao,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> lcvendaRefs(
    Expression<bool> Function($$LCVENDATableFilterComposer f) f,
  ) {
    final $$LCVENDATableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cdSeId,
      referencedTable: $db.lcvenda,
      getReferencedColumn: (t) => t.lcVenSenhaId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LCVENDATableFilterComposer(
            $db: $db,
            $table: $db.lcvenda,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> lccarrinhoRefs(
    Expression<bool> Function($$LCCARRINHOTableFilterComposer f) f,
  ) {
    final $$LCCARRINHOTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cdSeId,
      referencedTable: $db.lccarrinho,
      getReferencedColumn: (t) => t.lcCarUsuarioId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LCCARRINHOTableFilterComposer(
            $db: $db,
            $table: $db.lccarrinho,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CDSENHATableOrderingComposer
    extends Composer<_$AppDatabase, $CDSENHATable> {
  $$CDSENHATableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get cdSeId => $composableBuilder(
    column: $table.cdSeId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cdSeNome => $composableBuilder(
    column: $table.cdSeNome,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cdSeSenha => $composableBuilder(
    column: $table.cdSeSenha,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cdSeCpfCnpj => $composableBuilder(
    column: $table.cdSeCpfCnpj,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cdSeEmail => $composableBuilder(
    column: $table.cdSeEmail,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cdSeTelefone => $composableBuilder(
    column: $table.cdSeTelefone,
    builder: (column) => ColumnOrderings(column),
  );

  $$CDCARGOTableOrderingComposer get cdSeCargoId {
    final $$CDCARGOTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cdSeCargoId,
      referencedTable: $db.cdcargo,
      getReferencedColumn: (t) => t.cdCarid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CDCARGOTableOrderingComposer(
            $db: $db,
            $table: $db.cdcargo,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CDSENHATableAnnotationComposer
    extends Composer<_$AppDatabase, $CDSENHATable> {
  $$CDSENHATableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get cdSeId =>
      $composableBuilder(column: $table.cdSeId, builder: (column) => column);

  GeneratedColumn<String> get cdSeNome =>
      $composableBuilder(column: $table.cdSeNome, builder: (column) => column);

  GeneratedColumn<String> get cdSeSenha =>
      $composableBuilder(column: $table.cdSeSenha, builder: (column) => column);

  GeneratedColumn<String> get cdSeCpfCnpj => $composableBuilder(
    column: $table.cdSeCpfCnpj,
    builder: (column) => column,
  );

  GeneratedColumn<String> get cdSeEmail =>
      $composableBuilder(column: $table.cdSeEmail, builder: (column) => column);

  GeneratedColumn<String> get cdSeTelefone => $composableBuilder(
    column: $table.cdSeTelefone,
    builder: (column) => column,
  );

  $$CDCARGOTableAnnotationComposer get cdSeCargoId {
    final $$CDCARGOTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cdSeCargoId,
      referencedTable: $db.cdcargo,
      getReferencedColumn: (t) => t.cdCarid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CDCARGOTableAnnotationComposer(
            $db: $db,
            $table: $db.cdcargo,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> fidelsessaoRefs<T extends Object>(
    Expression<T> Function($$FIDELSESSAOTableAnnotationComposer a) f,
  ) {
    final $$FIDELSESSAOTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cdSeId,
      referencedTable: $db.fidelsessao,
      getReferencedColumn: (t) => t.fidelSesSenhaId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FIDELSESSAOTableAnnotationComposer(
            $db: $db,
            $table: $db.fidelsessao,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> lcvendaRefs<T extends Object>(
    Expression<T> Function($$LCVENDATableAnnotationComposer a) f,
  ) {
    final $$LCVENDATableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cdSeId,
      referencedTable: $db.lcvenda,
      getReferencedColumn: (t) => t.lcVenSenhaId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LCVENDATableAnnotationComposer(
            $db: $db,
            $table: $db.lcvenda,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> lccarrinhoRefs<T extends Object>(
    Expression<T> Function($$LCCARRINHOTableAnnotationComposer a) f,
  ) {
    final $$LCCARRINHOTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cdSeId,
      referencedTable: $db.lccarrinho,
      getReferencedColumn: (t) => t.lcCarUsuarioId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LCCARRINHOTableAnnotationComposer(
            $db: $db,
            $table: $db.lccarrinho,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CDSENHATableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CDSENHATable,
          CDSENHAData,
          $$CDSENHATableFilterComposer,
          $$CDSENHATableOrderingComposer,
          $$CDSENHATableAnnotationComposer,
          $$CDSENHATableCreateCompanionBuilder,
          $$CDSENHATableUpdateCompanionBuilder,
          (CDSENHAData, $$CDSENHATableReferences),
          CDSENHAData,
          PrefetchHooks Function({
            bool cdSeCargoId,
            bool fidelsessaoRefs,
            bool lcvendaRefs,
            bool lccarrinhoRefs,
          })
        > {
  $$CDSENHATableTableManager(_$AppDatabase db, $CDSENHATable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CDSENHATableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CDSENHATableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CDSENHATableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> cdSeId = const Value.absent(),
                Value<String> cdSeNome = const Value.absent(),
                Value<String> cdSeSenha = const Value.absent(),
                Value<String?> cdSeCpfCnpj = const Value.absent(),
                Value<String> cdSeEmail = const Value.absent(),
                Value<String?> cdSeTelefone = const Value.absent(),
                Value<int> cdSeCargoId = const Value.absent(),
              }) => CDSENHACompanion(
                cdSeId: cdSeId,
                cdSeNome: cdSeNome,
                cdSeSenha: cdSeSenha,
                cdSeCpfCnpj: cdSeCpfCnpj,
                cdSeEmail: cdSeEmail,
                cdSeTelefone: cdSeTelefone,
                cdSeCargoId: cdSeCargoId,
              ),
          createCompanionCallback:
              ({
                Value<int> cdSeId = const Value.absent(),
                required String cdSeNome,
                required String cdSeSenha,
                Value<String?> cdSeCpfCnpj = const Value.absent(),
                required String cdSeEmail,
                Value<String?> cdSeTelefone = const Value.absent(),
                required int cdSeCargoId,
              }) => CDSENHACompanion.insert(
                cdSeId: cdSeId,
                cdSeNome: cdSeNome,
                cdSeSenha: cdSeSenha,
                cdSeCpfCnpj: cdSeCpfCnpj,
                cdSeEmail: cdSeEmail,
                cdSeTelefone: cdSeTelefone,
                cdSeCargoId: cdSeCargoId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CDSENHATableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                cdSeCargoId = false,
                fidelsessaoRefs = false,
                lcvendaRefs = false,
                lccarrinhoRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (fidelsessaoRefs) db.fidelsessao,
                    if (lcvendaRefs) db.lcvenda,
                    if (lccarrinhoRefs) db.lccarrinho,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (cdSeCargoId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.cdSeCargoId,
                                    referencedTable: $$CDSENHATableReferences
                                        ._cdSeCargoIdTable(db),
                                    referencedColumn: $$CDSENHATableReferences
                                        ._cdSeCargoIdTable(db)
                                        .cdCarid,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (fidelsessaoRefs)
                        await $_getPrefetchedData<
                          CDSENHAData,
                          $CDSENHATable,
                          FIDELSESSAOData
                        >(
                          currentTable: table,
                          referencedTable: $$CDSENHATableReferences
                              ._fidelsessaoRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CDSENHATableReferences(
                                db,
                                table,
                                p0,
                              ).fidelsessaoRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.fidelSesSenhaId == item.cdSeId,
                              ),
                          typedResults: items,
                        ),
                      if (lcvendaRefs)
                        await $_getPrefetchedData<
                          CDSENHAData,
                          $CDSENHATable,
                          LCVENDAData
                        >(
                          currentTable: table,
                          referencedTable: $$CDSENHATableReferences
                              ._lcvendaRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CDSENHATableReferences(
                                db,
                                table,
                                p0,
                              ).lcvendaRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.lcVenSenhaId == item.cdSeId,
                              ),
                          typedResults: items,
                        ),
                      if (lccarrinhoRefs)
                        await $_getPrefetchedData<
                          CDSENHAData,
                          $CDSENHATable,
                          LCCARRINHOData
                        >(
                          currentTable: table,
                          referencedTable: $$CDSENHATableReferences
                              ._lccarrinhoRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CDSENHATableReferences(
                                db,
                                table,
                                p0,
                              ).lccarrinhoRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.lcCarUsuarioId == item.cdSeId,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$CDSENHATableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CDSENHATable,
      CDSENHAData,
      $$CDSENHATableFilterComposer,
      $$CDSENHATableOrderingComposer,
      $$CDSENHATableAnnotationComposer,
      $$CDSENHATableCreateCompanionBuilder,
      $$CDSENHATableUpdateCompanionBuilder,
      (CDSENHAData, $$CDSENHATableReferences),
      CDSENHAData,
      PrefetchHooks Function({
        bool cdSeCargoId,
        bool fidelsessaoRefs,
        bool lcvendaRefs,
        bool lccarrinhoRefs,
      })
    >;
typedef $$FIDELSESSAOTableCreateCompanionBuilder =
    FIDELSESSAOCompanion Function({
      Value<int> fidelSesId,
      required int fidelSesExpira,
      required DateTime fidelSesDtSessao,
      required int fidelSesSenhaId,
    });
typedef $$FIDELSESSAOTableUpdateCompanionBuilder =
    FIDELSESSAOCompanion Function({
      Value<int> fidelSesId,
      Value<int> fidelSesExpira,
      Value<DateTime> fidelSesDtSessao,
      Value<int> fidelSesSenhaId,
    });

final class $$FIDELSESSAOTableReferences
    extends BaseReferences<_$AppDatabase, $FIDELSESSAOTable, FIDELSESSAOData> {
  $$FIDELSESSAOTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CDSENHATable _fidelSesSenhaIdTable(_$AppDatabase db) =>
      db.cdsenha.createAlias(
        $_aliasNameGenerator(db.fidelsessao.fidelSesSenhaId, db.cdsenha.cdSeId),
      );

  $$CDSENHATableProcessedTableManager get fidelSesSenhaId {
    final $_column = $_itemColumn<int>('FIDELSESSENHAID')!;

    final manager = $$CDSENHATableTableManager(
      $_db,
      $_db.cdsenha,
    ).filter((f) => f.cdSeId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_fidelSesSenhaIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$FIDELSESSAOTableFilterComposer
    extends Composer<_$AppDatabase, $FIDELSESSAOTable> {
  $$FIDELSESSAOTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get fidelSesId => $composableBuilder(
    column: $table.fidelSesId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get fidelSesExpira => $composableBuilder(
    column: $table.fidelSesExpira,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get fidelSesDtSessao => $composableBuilder(
    column: $table.fidelSesDtSessao,
    builder: (column) => ColumnFilters(column),
  );

  $$CDSENHATableFilterComposer get fidelSesSenhaId {
    final $$CDSENHATableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.fidelSesSenhaId,
      referencedTable: $db.cdsenha,
      getReferencedColumn: (t) => t.cdSeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CDSENHATableFilterComposer(
            $db: $db,
            $table: $db.cdsenha,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FIDELSESSAOTableOrderingComposer
    extends Composer<_$AppDatabase, $FIDELSESSAOTable> {
  $$FIDELSESSAOTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get fidelSesId => $composableBuilder(
    column: $table.fidelSesId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get fidelSesExpira => $composableBuilder(
    column: $table.fidelSesExpira,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get fidelSesDtSessao => $composableBuilder(
    column: $table.fidelSesDtSessao,
    builder: (column) => ColumnOrderings(column),
  );

  $$CDSENHATableOrderingComposer get fidelSesSenhaId {
    final $$CDSENHATableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.fidelSesSenhaId,
      referencedTable: $db.cdsenha,
      getReferencedColumn: (t) => t.cdSeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CDSENHATableOrderingComposer(
            $db: $db,
            $table: $db.cdsenha,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FIDELSESSAOTableAnnotationComposer
    extends Composer<_$AppDatabase, $FIDELSESSAOTable> {
  $$FIDELSESSAOTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get fidelSesId => $composableBuilder(
    column: $table.fidelSesId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get fidelSesExpira => $composableBuilder(
    column: $table.fidelSesExpira,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get fidelSesDtSessao => $composableBuilder(
    column: $table.fidelSesDtSessao,
    builder: (column) => column,
  );

  $$CDSENHATableAnnotationComposer get fidelSesSenhaId {
    final $$CDSENHATableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.fidelSesSenhaId,
      referencedTable: $db.cdsenha,
      getReferencedColumn: (t) => t.cdSeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CDSENHATableAnnotationComposer(
            $db: $db,
            $table: $db.cdsenha,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FIDELSESSAOTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FIDELSESSAOTable,
          FIDELSESSAOData,
          $$FIDELSESSAOTableFilterComposer,
          $$FIDELSESSAOTableOrderingComposer,
          $$FIDELSESSAOTableAnnotationComposer,
          $$FIDELSESSAOTableCreateCompanionBuilder,
          $$FIDELSESSAOTableUpdateCompanionBuilder,
          (FIDELSESSAOData, $$FIDELSESSAOTableReferences),
          FIDELSESSAOData,
          PrefetchHooks Function({bool fidelSesSenhaId})
        > {
  $$FIDELSESSAOTableTableManager(_$AppDatabase db, $FIDELSESSAOTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FIDELSESSAOTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FIDELSESSAOTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FIDELSESSAOTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> fidelSesId = const Value.absent(),
                Value<int> fidelSesExpira = const Value.absent(),
                Value<DateTime> fidelSesDtSessao = const Value.absent(),
                Value<int> fidelSesSenhaId = const Value.absent(),
              }) => FIDELSESSAOCompanion(
                fidelSesId: fidelSesId,
                fidelSesExpira: fidelSesExpira,
                fidelSesDtSessao: fidelSesDtSessao,
                fidelSesSenhaId: fidelSesSenhaId,
              ),
          createCompanionCallback:
              ({
                Value<int> fidelSesId = const Value.absent(),
                required int fidelSesExpira,
                required DateTime fidelSesDtSessao,
                required int fidelSesSenhaId,
              }) => FIDELSESSAOCompanion.insert(
                fidelSesId: fidelSesId,
                fidelSesExpira: fidelSesExpira,
                fidelSesDtSessao: fidelSesDtSessao,
                fidelSesSenhaId: fidelSesSenhaId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$FIDELSESSAOTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({fidelSesSenhaId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (fidelSesSenhaId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.fidelSesSenhaId,
                                referencedTable: $$FIDELSESSAOTableReferences
                                    ._fidelSesSenhaIdTable(db),
                                referencedColumn: $$FIDELSESSAOTableReferences
                                    ._fidelSesSenhaIdTable(db)
                                    .cdSeId,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$FIDELSESSAOTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FIDELSESSAOTable,
      FIDELSESSAOData,
      $$FIDELSESSAOTableFilterComposer,
      $$FIDELSESSAOTableOrderingComposer,
      $$FIDELSESSAOTableAnnotationComposer,
      $$FIDELSESSAOTableCreateCompanionBuilder,
      $$FIDELSESSAOTableUpdateCompanionBuilder,
      (FIDELSESSAOData, $$FIDELSESSAOTableReferences),
      FIDELSESSAOData,
      PrefetchHooks Function({bool fidelSesSenhaId})
    >;
typedef $$LCVENDATableCreateCompanionBuilder =
    LCVENDACompanion Function({
      Value<int> lcVenId,
      required int lcVenSenhaId,
      required String lcVenProdutos,
      required DateTime lcvenData,
    });
typedef $$LCVENDATableUpdateCompanionBuilder =
    LCVENDACompanion Function({
      Value<int> lcVenId,
      Value<int> lcVenSenhaId,
      Value<String> lcVenProdutos,
      Value<DateTime> lcvenData,
    });

final class $$LCVENDATableReferences
    extends BaseReferences<_$AppDatabase, $LCVENDATable, LCVENDAData> {
  $$LCVENDATableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CDSENHATable _lcVenSenhaIdTable(_$AppDatabase db) =>
      db.cdsenha.createAlias(
        $_aliasNameGenerator(db.lcvenda.lcVenSenhaId, db.cdsenha.cdSeId),
      );

  $$CDSENHATableProcessedTableManager get lcVenSenhaId {
    final $_column = $_itemColumn<int>('LCVENSENHAID')!;

    final manager = $$CDSENHATableTableManager(
      $_db,
      $_db.cdsenha,
    ).filter((f) => f.cdSeId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_lcVenSenhaIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$LCVENDATableFilterComposer
    extends Composer<_$AppDatabase, $LCVENDATable> {
  $$LCVENDATableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get lcVenId => $composableBuilder(
    column: $table.lcVenId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lcVenProdutos => $composableBuilder(
    column: $table.lcVenProdutos,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lcvenData => $composableBuilder(
    column: $table.lcvenData,
    builder: (column) => ColumnFilters(column),
  );

  $$CDSENHATableFilterComposer get lcVenSenhaId {
    final $$CDSENHATableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.lcVenSenhaId,
      referencedTable: $db.cdsenha,
      getReferencedColumn: (t) => t.cdSeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CDSENHATableFilterComposer(
            $db: $db,
            $table: $db.cdsenha,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LCVENDATableOrderingComposer
    extends Composer<_$AppDatabase, $LCVENDATable> {
  $$LCVENDATableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get lcVenId => $composableBuilder(
    column: $table.lcVenId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lcVenProdutos => $composableBuilder(
    column: $table.lcVenProdutos,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lcvenData => $composableBuilder(
    column: $table.lcvenData,
    builder: (column) => ColumnOrderings(column),
  );

  $$CDSENHATableOrderingComposer get lcVenSenhaId {
    final $$CDSENHATableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.lcVenSenhaId,
      referencedTable: $db.cdsenha,
      getReferencedColumn: (t) => t.cdSeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CDSENHATableOrderingComposer(
            $db: $db,
            $table: $db.cdsenha,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LCVENDATableAnnotationComposer
    extends Composer<_$AppDatabase, $LCVENDATable> {
  $$LCVENDATableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get lcVenId =>
      $composableBuilder(column: $table.lcVenId, builder: (column) => column);

  GeneratedColumn<String> get lcVenProdutos => $composableBuilder(
    column: $table.lcVenProdutos,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lcvenData =>
      $composableBuilder(column: $table.lcvenData, builder: (column) => column);

  $$CDSENHATableAnnotationComposer get lcVenSenhaId {
    final $$CDSENHATableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.lcVenSenhaId,
      referencedTable: $db.cdsenha,
      getReferencedColumn: (t) => t.cdSeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CDSENHATableAnnotationComposer(
            $db: $db,
            $table: $db.cdsenha,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LCVENDATableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LCVENDATable,
          LCVENDAData,
          $$LCVENDATableFilterComposer,
          $$LCVENDATableOrderingComposer,
          $$LCVENDATableAnnotationComposer,
          $$LCVENDATableCreateCompanionBuilder,
          $$LCVENDATableUpdateCompanionBuilder,
          (LCVENDAData, $$LCVENDATableReferences),
          LCVENDAData,
          PrefetchHooks Function({bool lcVenSenhaId})
        > {
  $$LCVENDATableTableManager(_$AppDatabase db, $LCVENDATable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LCVENDATableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LCVENDATableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LCVENDATableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> lcVenId = const Value.absent(),
                Value<int> lcVenSenhaId = const Value.absent(),
                Value<String> lcVenProdutos = const Value.absent(),
                Value<DateTime> lcvenData = const Value.absent(),
              }) => LCVENDACompanion(
                lcVenId: lcVenId,
                lcVenSenhaId: lcVenSenhaId,
                lcVenProdutos: lcVenProdutos,
                lcvenData: lcvenData,
              ),
          createCompanionCallback:
              ({
                Value<int> lcVenId = const Value.absent(),
                required int lcVenSenhaId,
                required String lcVenProdutos,
                required DateTime lcvenData,
              }) => LCVENDACompanion.insert(
                lcVenId: lcVenId,
                lcVenSenhaId: lcVenSenhaId,
                lcVenProdutos: lcVenProdutos,
                lcvenData: lcvenData,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$LCVENDATableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({lcVenSenhaId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (lcVenSenhaId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.lcVenSenhaId,
                                referencedTable: $$LCVENDATableReferences
                                    ._lcVenSenhaIdTable(db),
                                referencedColumn: $$LCVENDATableReferences
                                    ._lcVenSenhaIdTable(db)
                                    .cdSeId,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$LCVENDATableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LCVENDATable,
      LCVENDAData,
      $$LCVENDATableFilterComposer,
      $$LCVENDATableOrderingComposer,
      $$LCVENDATableAnnotationComposer,
      $$LCVENDATableCreateCompanionBuilder,
      $$LCVENDATableUpdateCompanionBuilder,
      (LCVENDAData, $$LCVENDATableReferences),
      LCVENDAData,
      PrefetchHooks Function({bool lcVenSenhaId})
    >;
typedef $$CDCATEGORIATableCreateCompanionBuilder =
    CDCATEGORIACompanion Function({
      Value<int> cdCatId,
      required String cdCatNome,
    });
typedef $$CDCATEGORIATableUpdateCompanionBuilder =
    CDCATEGORIACompanion Function({
      Value<int> cdCatId,
      Value<String> cdCatNome,
    });

final class $$CDCATEGORIATableReferences
    extends BaseReferences<_$AppDatabase, $CDCATEGORIATable, CDCATEGORIAData> {
  $$CDCATEGORIATableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$CDPRODUTOTable, List<CDPRODUTOData>>
  _cdprodutoRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.cdproduto,
    aliasName: $_aliasNameGenerator(
      db.cdcategoria.cdCatId,
      db.cdproduto.cdProdCategoriaId,
    ),
  );

  $$CDPRODUTOTableProcessedTableManager get cdprodutoRefs {
    final manager = $$CDPRODUTOTableTableManager($_db, $_db.cdproduto).filter(
      (f) =>
          f.cdProdCategoriaId.cdCatId.sqlEquals($_itemColumn<int>('CDCATID')!),
    );

    final cache = $_typedResult.readTableOrNull(_cdprodutoRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CDCATEGORIATableFilterComposer
    extends Composer<_$AppDatabase, $CDCATEGORIATable> {
  $$CDCATEGORIATableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get cdCatId => $composableBuilder(
    column: $table.cdCatId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cdCatNome => $composableBuilder(
    column: $table.cdCatNome,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> cdprodutoRefs(
    Expression<bool> Function($$CDPRODUTOTableFilterComposer f) f,
  ) {
    final $$CDPRODUTOTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cdCatId,
      referencedTable: $db.cdproduto,
      getReferencedColumn: (t) => t.cdProdCategoriaId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CDPRODUTOTableFilterComposer(
            $db: $db,
            $table: $db.cdproduto,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CDCATEGORIATableOrderingComposer
    extends Composer<_$AppDatabase, $CDCATEGORIATable> {
  $$CDCATEGORIATableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get cdCatId => $composableBuilder(
    column: $table.cdCatId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cdCatNome => $composableBuilder(
    column: $table.cdCatNome,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CDCATEGORIATableAnnotationComposer
    extends Composer<_$AppDatabase, $CDCATEGORIATable> {
  $$CDCATEGORIATableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get cdCatId =>
      $composableBuilder(column: $table.cdCatId, builder: (column) => column);

  GeneratedColumn<String> get cdCatNome =>
      $composableBuilder(column: $table.cdCatNome, builder: (column) => column);

  Expression<T> cdprodutoRefs<T extends Object>(
    Expression<T> Function($$CDPRODUTOTableAnnotationComposer a) f,
  ) {
    final $$CDPRODUTOTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cdCatId,
      referencedTable: $db.cdproduto,
      getReferencedColumn: (t) => t.cdProdCategoriaId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CDPRODUTOTableAnnotationComposer(
            $db: $db,
            $table: $db.cdproduto,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CDCATEGORIATableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CDCATEGORIATable,
          CDCATEGORIAData,
          $$CDCATEGORIATableFilterComposer,
          $$CDCATEGORIATableOrderingComposer,
          $$CDCATEGORIATableAnnotationComposer,
          $$CDCATEGORIATableCreateCompanionBuilder,
          $$CDCATEGORIATableUpdateCompanionBuilder,
          (CDCATEGORIAData, $$CDCATEGORIATableReferences),
          CDCATEGORIAData,
          PrefetchHooks Function({bool cdprodutoRefs})
        > {
  $$CDCATEGORIATableTableManager(_$AppDatabase db, $CDCATEGORIATable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CDCATEGORIATableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CDCATEGORIATableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CDCATEGORIATableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> cdCatId = const Value.absent(),
                Value<String> cdCatNome = const Value.absent(),
              }) =>
                  CDCATEGORIACompanion(cdCatId: cdCatId, cdCatNome: cdCatNome),
          createCompanionCallback:
              ({
                Value<int> cdCatId = const Value.absent(),
                required String cdCatNome,
              }) => CDCATEGORIACompanion.insert(
                cdCatId: cdCatId,
                cdCatNome: cdCatNome,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CDCATEGORIATableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({cdprodutoRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (cdprodutoRefs) db.cdproduto],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (cdprodutoRefs)
                    await $_getPrefetchedData<
                      CDCATEGORIAData,
                      $CDCATEGORIATable,
                      CDPRODUTOData
                    >(
                      currentTable: table,
                      referencedTable: $$CDCATEGORIATableReferences
                          ._cdprodutoRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$CDCATEGORIATableReferences(
                            db,
                            table,
                            p0,
                          ).cdprodutoRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.cdProdCategoriaId == item.cdCatId,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$CDCATEGORIATableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CDCATEGORIATable,
      CDCATEGORIAData,
      $$CDCATEGORIATableFilterComposer,
      $$CDCATEGORIATableOrderingComposer,
      $$CDCATEGORIATableAnnotationComposer,
      $$CDCATEGORIATableCreateCompanionBuilder,
      $$CDCATEGORIATableUpdateCompanionBuilder,
      (CDCATEGORIAData, $$CDCATEGORIATableReferences),
      CDCATEGORIAData,
      PrefetchHooks Function({bool cdprodutoRefs})
    >;
typedef $$CDPRODUTOTableCreateCompanionBuilder =
    CDPRODUTOCompanion Function({
      Value<int> cdProdId,
      required String cdProdNome,
      required String cdProdDescricao,
      Value<Decimal> cdProdPrecoReal,
      required int cdProdPrecoPonto,
      Value<Decimal> cdProdPrecoDesconto,
      required int cdProdPrecoQtdEstoque,
      required int cdProdEmpresaId,
      required int cdProdCategoriaId,
    });
typedef $$CDPRODUTOTableUpdateCompanionBuilder =
    CDPRODUTOCompanion Function({
      Value<int> cdProdId,
      Value<String> cdProdNome,
      Value<String> cdProdDescricao,
      Value<Decimal> cdProdPrecoReal,
      Value<int> cdProdPrecoPonto,
      Value<Decimal> cdProdPrecoDesconto,
      Value<int> cdProdPrecoQtdEstoque,
      Value<int> cdProdEmpresaId,
      Value<int> cdProdCategoriaId,
    });

final class $$CDPRODUTOTableReferences
    extends BaseReferences<_$AppDatabase, $CDPRODUTOTable, CDPRODUTOData> {
  $$CDPRODUTOTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CDEMPRESATable _cdProdEmpresaIdTable(_$AppDatabase db) =>
      db.cdempresa.createAlias(
        $_aliasNameGenerator(
          db.cdproduto.cdProdEmpresaId,
          db.cdempresa.cdEmpId,
        ),
      );

  $$CDEMPRESATableProcessedTableManager get cdProdEmpresaId {
    final $_column = $_itemColumn<int>('CDPRODEMPRESAID')!;

    final manager = $$CDEMPRESATableTableManager(
      $_db,
      $_db.cdempresa,
    ).filter((f) => f.cdEmpId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_cdProdEmpresaIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $CDCATEGORIATable _cdProdCategoriaIdTable(_$AppDatabase db) =>
      db.cdcategoria.createAlias(
        $_aliasNameGenerator(
          db.cdproduto.cdProdCategoriaId,
          db.cdcategoria.cdCatId,
        ),
      );

  $$CDCATEGORIATableProcessedTableManager get cdProdCategoriaId {
    final $_column = $_itemColumn<int>('CDPRODCATEGORIAID')!;

    final manager = $$CDCATEGORIATableTableManager(
      $_db,
      $_db.cdcategoria,
    ).filter((f) => f.cdCatId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_cdProdCategoriaIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$CDPRODUTOIMAGEMTable, List<CDPRODUTOIMAGEMData>>
  _cdprodutoimagemRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.cdprodutoimagem,
    aliasName: $_aliasNameGenerator(
      db.cdproduto.cdProdId,
      db.cdprodutoimagem.cdProdImgProdutoId,
    ),
  );

  $$CDPRODUTOIMAGEMTableProcessedTableManager get cdprodutoimagemRefs {
    final manager =
        $$CDPRODUTOIMAGEMTableTableManager($_db, $_db.cdprodutoimagem).filter(
          (f) => f.cdProdImgProdutoId.cdProdId.sqlEquals(
            $_itemColumn<int>('CDPRODID')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(
      _cdprodutoimagemRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$LCCARRINHOTable, List<LCCARRINHOData>>
  _lccarrinhoRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.lccarrinho,
    aliasName: $_aliasNameGenerator(
      db.cdproduto.cdProdId,
      db.lccarrinho.lcCarProdutoId,
    ),
  );

  $$LCCARRINHOTableProcessedTableManager get lccarrinhoRefs {
    final manager = $$LCCARRINHOTableTableManager($_db, $_db.lccarrinho).filter(
      (f) =>
          f.lcCarProdutoId.cdProdId.sqlEquals($_itemColumn<int>('CDPRODID')!),
    );

    final cache = $_typedResult.readTableOrNull(_lccarrinhoRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CDPRODUTOTableFilterComposer
    extends Composer<_$AppDatabase, $CDPRODUTOTable> {
  $$CDPRODUTOTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get cdProdId => $composableBuilder(
    column: $table.cdProdId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cdProdNome => $composableBuilder(
    column: $table.cdProdNome,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cdProdDescricao => $composableBuilder(
    column: $table.cdProdDescricao,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<Decimal, Decimal, String>
  get cdProdPrecoReal => $composableBuilder(
    column: $table.cdProdPrecoReal,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<int> get cdProdPrecoPonto => $composableBuilder(
    column: $table.cdProdPrecoPonto,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<Decimal, Decimal, String>
  get cdProdPrecoDesconto => $composableBuilder(
    column: $table.cdProdPrecoDesconto,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<int> get cdProdPrecoQtdEstoque => $composableBuilder(
    column: $table.cdProdPrecoQtdEstoque,
    builder: (column) => ColumnFilters(column),
  );

  $$CDEMPRESATableFilterComposer get cdProdEmpresaId {
    final $$CDEMPRESATableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cdProdEmpresaId,
      referencedTable: $db.cdempresa,
      getReferencedColumn: (t) => t.cdEmpId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CDEMPRESATableFilterComposer(
            $db: $db,
            $table: $db.cdempresa,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CDCATEGORIATableFilterComposer get cdProdCategoriaId {
    final $$CDCATEGORIATableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cdProdCategoriaId,
      referencedTable: $db.cdcategoria,
      getReferencedColumn: (t) => t.cdCatId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CDCATEGORIATableFilterComposer(
            $db: $db,
            $table: $db.cdcategoria,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> cdprodutoimagemRefs(
    Expression<bool> Function($$CDPRODUTOIMAGEMTableFilterComposer f) f,
  ) {
    final $$CDPRODUTOIMAGEMTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cdProdId,
      referencedTable: $db.cdprodutoimagem,
      getReferencedColumn: (t) => t.cdProdImgProdutoId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CDPRODUTOIMAGEMTableFilterComposer(
            $db: $db,
            $table: $db.cdprodutoimagem,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> lccarrinhoRefs(
    Expression<bool> Function($$LCCARRINHOTableFilterComposer f) f,
  ) {
    final $$LCCARRINHOTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cdProdId,
      referencedTable: $db.lccarrinho,
      getReferencedColumn: (t) => t.lcCarProdutoId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LCCARRINHOTableFilterComposer(
            $db: $db,
            $table: $db.lccarrinho,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CDPRODUTOTableOrderingComposer
    extends Composer<_$AppDatabase, $CDPRODUTOTable> {
  $$CDPRODUTOTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get cdProdId => $composableBuilder(
    column: $table.cdProdId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cdProdNome => $composableBuilder(
    column: $table.cdProdNome,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cdProdDescricao => $composableBuilder(
    column: $table.cdProdDescricao,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cdProdPrecoReal => $composableBuilder(
    column: $table.cdProdPrecoReal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get cdProdPrecoPonto => $composableBuilder(
    column: $table.cdProdPrecoPonto,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cdProdPrecoDesconto => $composableBuilder(
    column: $table.cdProdPrecoDesconto,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get cdProdPrecoQtdEstoque => $composableBuilder(
    column: $table.cdProdPrecoQtdEstoque,
    builder: (column) => ColumnOrderings(column),
  );

  $$CDEMPRESATableOrderingComposer get cdProdEmpresaId {
    final $$CDEMPRESATableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cdProdEmpresaId,
      referencedTable: $db.cdempresa,
      getReferencedColumn: (t) => t.cdEmpId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CDEMPRESATableOrderingComposer(
            $db: $db,
            $table: $db.cdempresa,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CDCATEGORIATableOrderingComposer get cdProdCategoriaId {
    final $$CDCATEGORIATableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cdProdCategoriaId,
      referencedTable: $db.cdcategoria,
      getReferencedColumn: (t) => t.cdCatId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CDCATEGORIATableOrderingComposer(
            $db: $db,
            $table: $db.cdcategoria,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CDPRODUTOTableAnnotationComposer
    extends Composer<_$AppDatabase, $CDPRODUTOTable> {
  $$CDPRODUTOTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get cdProdId =>
      $composableBuilder(column: $table.cdProdId, builder: (column) => column);

  GeneratedColumn<String> get cdProdNome => $composableBuilder(
    column: $table.cdProdNome,
    builder: (column) => column,
  );

  GeneratedColumn<String> get cdProdDescricao => $composableBuilder(
    column: $table.cdProdDescricao,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<Decimal, String> get cdProdPrecoReal =>
      $composableBuilder(
        column: $table.cdProdPrecoReal,
        builder: (column) => column,
      );

  GeneratedColumn<int> get cdProdPrecoPonto => $composableBuilder(
    column: $table.cdProdPrecoPonto,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<Decimal, String> get cdProdPrecoDesconto =>
      $composableBuilder(
        column: $table.cdProdPrecoDesconto,
        builder: (column) => column,
      );

  GeneratedColumn<int> get cdProdPrecoQtdEstoque => $composableBuilder(
    column: $table.cdProdPrecoQtdEstoque,
    builder: (column) => column,
  );

  $$CDEMPRESATableAnnotationComposer get cdProdEmpresaId {
    final $$CDEMPRESATableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cdProdEmpresaId,
      referencedTable: $db.cdempresa,
      getReferencedColumn: (t) => t.cdEmpId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CDEMPRESATableAnnotationComposer(
            $db: $db,
            $table: $db.cdempresa,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CDCATEGORIATableAnnotationComposer get cdProdCategoriaId {
    final $$CDCATEGORIATableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cdProdCategoriaId,
      referencedTable: $db.cdcategoria,
      getReferencedColumn: (t) => t.cdCatId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CDCATEGORIATableAnnotationComposer(
            $db: $db,
            $table: $db.cdcategoria,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> cdprodutoimagemRefs<T extends Object>(
    Expression<T> Function($$CDPRODUTOIMAGEMTableAnnotationComposer a) f,
  ) {
    final $$CDPRODUTOIMAGEMTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cdProdId,
      referencedTable: $db.cdprodutoimagem,
      getReferencedColumn: (t) => t.cdProdImgProdutoId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CDPRODUTOIMAGEMTableAnnotationComposer(
            $db: $db,
            $table: $db.cdprodutoimagem,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> lccarrinhoRefs<T extends Object>(
    Expression<T> Function($$LCCARRINHOTableAnnotationComposer a) f,
  ) {
    final $$LCCARRINHOTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cdProdId,
      referencedTable: $db.lccarrinho,
      getReferencedColumn: (t) => t.lcCarProdutoId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LCCARRINHOTableAnnotationComposer(
            $db: $db,
            $table: $db.lccarrinho,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CDPRODUTOTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CDPRODUTOTable,
          CDPRODUTOData,
          $$CDPRODUTOTableFilterComposer,
          $$CDPRODUTOTableOrderingComposer,
          $$CDPRODUTOTableAnnotationComposer,
          $$CDPRODUTOTableCreateCompanionBuilder,
          $$CDPRODUTOTableUpdateCompanionBuilder,
          (CDPRODUTOData, $$CDPRODUTOTableReferences),
          CDPRODUTOData,
          PrefetchHooks Function({
            bool cdProdEmpresaId,
            bool cdProdCategoriaId,
            bool cdprodutoimagemRefs,
            bool lccarrinhoRefs,
          })
        > {
  $$CDPRODUTOTableTableManager(_$AppDatabase db, $CDPRODUTOTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CDPRODUTOTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CDPRODUTOTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CDPRODUTOTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> cdProdId = const Value.absent(),
                Value<String> cdProdNome = const Value.absent(),
                Value<String> cdProdDescricao = const Value.absent(),
                Value<Decimal> cdProdPrecoReal = const Value.absent(),
                Value<int> cdProdPrecoPonto = const Value.absent(),
                Value<Decimal> cdProdPrecoDesconto = const Value.absent(),
                Value<int> cdProdPrecoQtdEstoque = const Value.absent(),
                Value<int> cdProdEmpresaId = const Value.absent(),
                Value<int> cdProdCategoriaId = const Value.absent(),
              }) => CDPRODUTOCompanion(
                cdProdId: cdProdId,
                cdProdNome: cdProdNome,
                cdProdDescricao: cdProdDescricao,
                cdProdPrecoReal: cdProdPrecoReal,
                cdProdPrecoPonto: cdProdPrecoPonto,
                cdProdPrecoDesconto: cdProdPrecoDesconto,
                cdProdPrecoQtdEstoque: cdProdPrecoQtdEstoque,
                cdProdEmpresaId: cdProdEmpresaId,
                cdProdCategoriaId: cdProdCategoriaId,
              ),
          createCompanionCallback:
              ({
                Value<int> cdProdId = const Value.absent(),
                required String cdProdNome,
                required String cdProdDescricao,
                Value<Decimal> cdProdPrecoReal = const Value.absent(),
                required int cdProdPrecoPonto,
                Value<Decimal> cdProdPrecoDesconto = const Value.absent(),
                required int cdProdPrecoQtdEstoque,
                required int cdProdEmpresaId,
                required int cdProdCategoriaId,
              }) => CDPRODUTOCompanion.insert(
                cdProdId: cdProdId,
                cdProdNome: cdProdNome,
                cdProdDescricao: cdProdDescricao,
                cdProdPrecoReal: cdProdPrecoReal,
                cdProdPrecoPonto: cdProdPrecoPonto,
                cdProdPrecoDesconto: cdProdPrecoDesconto,
                cdProdPrecoQtdEstoque: cdProdPrecoQtdEstoque,
                cdProdEmpresaId: cdProdEmpresaId,
                cdProdCategoriaId: cdProdCategoriaId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CDPRODUTOTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                cdProdEmpresaId = false,
                cdProdCategoriaId = false,
                cdprodutoimagemRefs = false,
                lccarrinhoRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (cdprodutoimagemRefs) db.cdprodutoimagem,
                    if (lccarrinhoRefs) db.lccarrinho,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (cdProdEmpresaId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.cdProdEmpresaId,
                                    referencedTable: $$CDPRODUTOTableReferences
                                        ._cdProdEmpresaIdTable(db),
                                    referencedColumn: $$CDPRODUTOTableReferences
                                        ._cdProdEmpresaIdTable(db)
                                        .cdEmpId,
                                  )
                                  as T;
                        }
                        if (cdProdCategoriaId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.cdProdCategoriaId,
                                    referencedTable: $$CDPRODUTOTableReferences
                                        ._cdProdCategoriaIdTable(db),
                                    referencedColumn: $$CDPRODUTOTableReferences
                                        ._cdProdCategoriaIdTable(db)
                                        .cdCatId,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (cdprodutoimagemRefs)
                        await $_getPrefetchedData<
                          CDPRODUTOData,
                          $CDPRODUTOTable,
                          CDPRODUTOIMAGEMData
                        >(
                          currentTable: table,
                          referencedTable: $$CDPRODUTOTableReferences
                              ._cdprodutoimagemRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CDPRODUTOTableReferences(
                                db,
                                table,
                                p0,
                              ).cdprodutoimagemRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.cdProdImgProdutoId == item.cdProdId,
                              ),
                          typedResults: items,
                        ),
                      if (lccarrinhoRefs)
                        await $_getPrefetchedData<
                          CDPRODUTOData,
                          $CDPRODUTOTable,
                          LCCARRINHOData
                        >(
                          currentTable: table,
                          referencedTable: $$CDPRODUTOTableReferences
                              ._lccarrinhoRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CDPRODUTOTableReferences(
                                db,
                                table,
                                p0,
                              ).lccarrinhoRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.lcCarProdutoId == item.cdProdId,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$CDPRODUTOTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CDPRODUTOTable,
      CDPRODUTOData,
      $$CDPRODUTOTableFilterComposer,
      $$CDPRODUTOTableOrderingComposer,
      $$CDPRODUTOTableAnnotationComposer,
      $$CDPRODUTOTableCreateCompanionBuilder,
      $$CDPRODUTOTableUpdateCompanionBuilder,
      (CDPRODUTOData, $$CDPRODUTOTableReferences),
      CDPRODUTOData,
      PrefetchHooks Function({
        bool cdProdEmpresaId,
        bool cdProdCategoriaId,
        bool cdprodutoimagemRefs,
        bool lccarrinhoRefs,
      })
    >;
typedef $$CDPRODUTOIMAGEMTableCreateCompanionBuilder =
    CDPRODUTOIMAGEMCompanion Function({
      Value<int> cdProdImgId,
      required Uint8List cdProdImgBlob,
      required int cdProdImgProdutoId,
    });
typedef $$CDPRODUTOIMAGEMTableUpdateCompanionBuilder =
    CDPRODUTOIMAGEMCompanion Function({
      Value<int> cdProdImgId,
      Value<Uint8List> cdProdImgBlob,
      Value<int> cdProdImgProdutoId,
    });

final class $$CDPRODUTOIMAGEMTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $CDPRODUTOIMAGEMTable,
          CDPRODUTOIMAGEMData
        > {
  $$CDPRODUTOIMAGEMTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $CDPRODUTOTable _cdProdImgProdutoIdTable(_$AppDatabase db) =>
      db.cdproduto.createAlias(
        $_aliasNameGenerator(
          db.cdprodutoimagem.cdProdImgProdutoId,
          db.cdproduto.cdProdId,
        ),
      );

  $$CDPRODUTOTableProcessedTableManager get cdProdImgProdutoId {
    final $_column = $_itemColumn<int>('CDPRODIMGPRODUTOID')!;

    final manager = $$CDPRODUTOTableTableManager(
      $_db,
      $_db.cdproduto,
    ).filter((f) => f.cdProdId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_cdProdImgProdutoIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$CDPRODUTOIMAGEMTableFilterComposer
    extends Composer<_$AppDatabase, $CDPRODUTOIMAGEMTable> {
  $$CDPRODUTOIMAGEMTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get cdProdImgId => $composableBuilder(
    column: $table.cdProdImgId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<Uint8List> get cdProdImgBlob => $composableBuilder(
    column: $table.cdProdImgBlob,
    builder: (column) => ColumnFilters(column),
  );

  $$CDPRODUTOTableFilterComposer get cdProdImgProdutoId {
    final $$CDPRODUTOTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cdProdImgProdutoId,
      referencedTable: $db.cdproduto,
      getReferencedColumn: (t) => t.cdProdId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CDPRODUTOTableFilterComposer(
            $db: $db,
            $table: $db.cdproduto,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CDPRODUTOIMAGEMTableOrderingComposer
    extends Composer<_$AppDatabase, $CDPRODUTOIMAGEMTable> {
  $$CDPRODUTOIMAGEMTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get cdProdImgId => $composableBuilder(
    column: $table.cdProdImgId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<Uint8List> get cdProdImgBlob => $composableBuilder(
    column: $table.cdProdImgBlob,
    builder: (column) => ColumnOrderings(column),
  );

  $$CDPRODUTOTableOrderingComposer get cdProdImgProdutoId {
    final $$CDPRODUTOTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cdProdImgProdutoId,
      referencedTable: $db.cdproduto,
      getReferencedColumn: (t) => t.cdProdId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CDPRODUTOTableOrderingComposer(
            $db: $db,
            $table: $db.cdproduto,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CDPRODUTOIMAGEMTableAnnotationComposer
    extends Composer<_$AppDatabase, $CDPRODUTOIMAGEMTable> {
  $$CDPRODUTOIMAGEMTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get cdProdImgId => $composableBuilder(
    column: $table.cdProdImgId,
    builder: (column) => column,
  );

  GeneratedColumn<Uint8List> get cdProdImgBlob => $composableBuilder(
    column: $table.cdProdImgBlob,
    builder: (column) => column,
  );

  $$CDPRODUTOTableAnnotationComposer get cdProdImgProdutoId {
    final $$CDPRODUTOTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cdProdImgProdutoId,
      referencedTable: $db.cdproduto,
      getReferencedColumn: (t) => t.cdProdId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CDPRODUTOTableAnnotationComposer(
            $db: $db,
            $table: $db.cdproduto,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CDPRODUTOIMAGEMTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CDPRODUTOIMAGEMTable,
          CDPRODUTOIMAGEMData,
          $$CDPRODUTOIMAGEMTableFilterComposer,
          $$CDPRODUTOIMAGEMTableOrderingComposer,
          $$CDPRODUTOIMAGEMTableAnnotationComposer,
          $$CDPRODUTOIMAGEMTableCreateCompanionBuilder,
          $$CDPRODUTOIMAGEMTableUpdateCompanionBuilder,
          (CDPRODUTOIMAGEMData, $$CDPRODUTOIMAGEMTableReferences),
          CDPRODUTOIMAGEMData,
          PrefetchHooks Function({bool cdProdImgProdutoId})
        > {
  $$CDPRODUTOIMAGEMTableTableManager(
    _$AppDatabase db,
    $CDPRODUTOIMAGEMTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CDPRODUTOIMAGEMTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CDPRODUTOIMAGEMTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CDPRODUTOIMAGEMTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> cdProdImgId = const Value.absent(),
                Value<Uint8List> cdProdImgBlob = const Value.absent(),
                Value<int> cdProdImgProdutoId = const Value.absent(),
              }) => CDPRODUTOIMAGEMCompanion(
                cdProdImgId: cdProdImgId,
                cdProdImgBlob: cdProdImgBlob,
                cdProdImgProdutoId: cdProdImgProdutoId,
              ),
          createCompanionCallback:
              ({
                Value<int> cdProdImgId = const Value.absent(),
                required Uint8List cdProdImgBlob,
                required int cdProdImgProdutoId,
              }) => CDPRODUTOIMAGEMCompanion.insert(
                cdProdImgId: cdProdImgId,
                cdProdImgBlob: cdProdImgBlob,
                cdProdImgProdutoId: cdProdImgProdutoId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CDPRODUTOIMAGEMTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({cdProdImgProdutoId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (cdProdImgProdutoId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.cdProdImgProdutoId,
                                referencedTable:
                                    $$CDPRODUTOIMAGEMTableReferences
                                        ._cdProdImgProdutoIdTable(db),
                                referencedColumn:
                                    $$CDPRODUTOIMAGEMTableReferences
                                        ._cdProdImgProdutoIdTable(db)
                                        .cdProdId,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$CDPRODUTOIMAGEMTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CDPRODUTOIMAGEMTable,
      CDPRODUTOIMAGEMData,
      $$CDPRODUTOIMAGEMTableFilterComposer,
      $$CDPRODUTOIMAGEMTableOrderingComposer,
      $$CDPRODUTOIMAGEMTableAnnotationComposer,
      $$CDPRODUTOIMAGEMTableCreateCompanionBuilder,
      $$CDPRODUTOIMAGEMTableUpdateCompanionBuilder,
      (CDPRODUTOIMAGEMData, $$CDPRODUTOIMAGEMTableReferences),
      CDPRODUTOIMAGEMData,
      PrefetchHooks Function({bool cdProdImgProdutoId})
    >;
typedef $$CDEXCECAOTableCreateCompanionBuilder =
    CDEXCECAOCompanion Function({
      Value<int> cdExId,
      required String cdExDescricao,
      required DateTime cdExData,
      required int cdExEmpresaId,
    });
typedef $$CDEXCECAOTableUpdateCompanionBuilder =
    CDEXCECAOCompanion Function({
      Value<int> cdExId,
      Value<String> cdExDescricao,
      Value<DateTime> cdExData,
      Value<int> cdExEmpresaId,
    });

final class $$CDEXCECAOTableReferences
    extends BaseReferences<_$AppDatabase, $CDEXCECAOTable, CDEXCECAOData> {
  $$CDEXCECAOTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CDEMPRESATable _cdExEmpresaIdTable(_$AppDatabase db) =>
      db.cdempresa.createAlias(
        $_aliasNameGenerator(db.cdexcecao.cdExEmpresaId, db.cdempresa.cdEmpId),
      );

  $$CDEMPRESATableProcessedTableManager get cdExEmpresaId {
    final $_column = $_itemColumn<int>('CDEXEMPRESAID')!;

    final manager = $$CDEMPRESATableTableManager(
      $_db,
      $_db.cdempresa,
    ).filter((f) => f.cdEmpId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_cdExEmpresaIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$CDEXCECAOTableFilterComposer
    extends Composer<_$AppDatabase, $CDEXCECAOTable> {
  $$CDEXCECAOTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get cdExId => $composableBuilder(
    column: $table.cdExId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cdExDescricao => $composableBuilder(
    column: $table.cdExDescricao,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get cdExData => $composableBuilder(
    column: $table.cdExData,
    builder: (column) => ColumnFilters(column),
  );

  $$CDEMPRESATableFilterComposer get cdExEmpresaId {
    final $$CDEMPRESATableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cdExEmpresaId,
      referencedTable: $db.cdempresa,
      getReferencedColumn: (t) => t.cdEmpId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CDEMPRESATableFilterComposer(
            $db: $db,
            $table: $db.cdempresa,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CDEXCECAOTableOrderingComposer
    extends Composer<_$AppDatabase, $CDEXCECAOTable> {
  $$CDEXCECAOTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get cdExId => $composableBuilder(
    column: $table.cdExId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cdExDescricao => $composableBuilder(
    column: $table.cdExDescricao,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get cdExData => $composableBuilder(
    column: $table.cdExData,
    builder: (column) => ColumnOrderings(column),
  );

  $$CDEMPRESATableOrderingComposer get cdExEmpresaId {
    final $$CDEMPRESATableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cdExEmpresaId,
      referencedTable: $db.cdempresa,
      getReferencedColumn: (t) => t.cdEmpId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CDEMPRESATableOrderingComposer(
            $db: $db,
            $table: $db.cdempresa,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CDEXCECAOTableAnnotationComposer
    extends Composer<_$AppDatabase, $CDEXCECAOTable> {
  $$CDEXCECAOTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get cdExId =>
      $composableBuilder(column: $table.cdExId, builder: (column) => column);

  GeneratedColumn<String> get cdExDescricao => $composableBuilder(
    column: $table.cdExDescricao,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get cdExData =>
      $composableBuilder(column: $table.cdExData, builder: (column) => column);

  $$CDEMPRESATableAnnotationComposer get cdExEmpresaId {
    final $$CDEMPRESATableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cdExEmpresaId,
      referencedTable: $db.cdempresa,
      getReferencedColumn: (t) => t.cdEmpId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CDEMPRESATableAnnotationComposer(
            $db: $db,
            $table: $db.cdempresa,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CDEXCECAOTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CDEXCECAOTable,
          CDEXCECAOData,
          $$CDEXCECAOTableFilterComposer,
          $$CDEXCECAOTableOrderingComposer,
          $$CDEXCECAOTableAnnotationComposer,
          $$CDEXCECAOTableCreateCompanionBuilder,
          $$CDEXCECAOTableUpdateCompanionBuilder,
          (CDEXCECAOData, $$CDEXCECAOTableReferences),
          CDEXCECAOData,
          PrefetchHooks Function({bool cdExEmpresaId})
        > {
  $$CDEXCECAOTableTableManager(_$AppDatabase db, $CDEXCECAOTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CDEXCECAOTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CDEXCECAOTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CDEXCECAOTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> cdExId = const Value.absent(),
                Value<String> cdExDescricao = const Value.absent(),
                Value<DateTime> cdExData = const Value.absent(),
                Value<int> cdExEmpresaId = const Value.absent(),
              }) => CDEXCECAOCompanion(
                cdExId: cdExId,
                cdExDescricao: cdExDescricao,
                cdExData: cdExData,
                cdExEmpresaId: cdExEmpresaId,
              ),
          createCompanionCallback:
              ({
                Value<int> cdExId = const Value.absent(),
                required String cdExDescricao,
                required DateTime cdExData,
                required int cdExEmpresaId,
              }) => CDEXCECAOCompanion.insert(
                cdExId: cdExId,
                cdExDescricao: cdExDescricao,
                cdExData: cdExData,
                cdExEmpresaId: cdExEmpresaId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CDEXCECAOTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({cdExEmpresaId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (cdExEmpresaId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.cdExEmpresaId,
                                referencedTable: $$CDEXCECAOTableReferences
                                    ._cdExEmpresaIdTable(db),
                                referencedColumn: $$CDEXCECAOTableReferences
                                    ._cdExEmpresaIdTable(db)
                                    .cdEmpId,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$CDEXCECAOTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CDEXCECAOTable,
      CDEXCECAOData,
      $$CDEXCECAOTableFilterComposer,
      $$CDEXCECAOTableOrderingComposer,
      $$CDEXCECAOTableAnnotationComposer,
      $$CDEXCECAOTableCreateCompanionBuilder,
      $$CDEXCECAOTableUpdateCompanionBuilder,
      (CDEXCECAOData, $$CDEXCECAOTableReferences),
      CDEXCECAOData,
      PrefetchHooks Function({bool cdExEmpresaId})
    >;
typedef $$CDACAOTableCreateCompanionBuilder =
    CDACAOCompanion Function({
      Value<int> cdAcaoId,
      required String cdAcaoDescricao,
    });
typedef $$CDACAOTableUpdateCompanionBuilder =
    CDACAOCompanion Function({
      Value<int> cdAcaoId,
      Value<String> cdAcaoDescricao,
    });

final class $$CDACAOTableReferences
    extends BaseReferences<_$AppDatabase, $CDACAOTable, CDACAOData> {
  $$CDACAOTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$LCAUDITORIATable, List<LCAUDITORIAData>>
  _lcauditoriaRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.lcauditoria,
    aliasName: $_aliasNameGenerator(
      db.cdacao.cdAcaoId,
      db.lcauditoria.lcAudAcaoId,
    ),
  );

  $$LCAUDITORIATableProcessedTableManager get lcauditoriaRefs {
    final manager = $$LCAUDITORIATableTableManager($_db, $_db.lcauditoria)
        .filter(
          (f) =>
              f.lcAudAcaoId.cdAcaoId.sqlEquals($_itemColumn<int>('CDACAOID')!),
        );

    final cache = $_typedResult.readTableOrNull(_lcauditoriaRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CDACAOTableFilterComposer
    extends Composer<_$AppDatabase, $CDACAOTable> {
  $$CDACAOTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get cdAcaoId => $composableBuilder(
    column: $table.cdAcaoId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cdAcaoDescricao => $composableBuilder(
    column: $table.cdAcaoDescricao,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> lcauditoriaRefs(
    Expression<bool> Function($$LCAUDITORIATableFilterComposer f) f,
  ) {
    final $$LCAUDITORIATableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cdAcaoId,
      referencedTable: $db.lcauditoria,
      getReferencedColumn: (t) => t.lcAudAcaoId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LCAUDITORIATableFilterComposer(
            $db: $db,
            $table: $db.lcauditoria,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CDACAOTableOrderingComposer
    extends Composer<_$AppDatabase, $CDACAOTable> {
  $$CDACAOTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get cdAcaoId => $composableBuilder(
    column: $table.cdAcaoId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cdAcaoDescricao => $composableBuilder(
    column: $table.cdAcaoDescricao,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CDACAOTableAnnotationComposer
    extends Composer<_$AppDatabase, $CDACAOTable> {
  $$CDACAOTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get cdAcaoId =>
      $composableBuilder(column: $table.cdAcaoId, builder: (column) => column);

  GeneratedColumn<String> get cdAcaoDescricao => $composableBuilder(
    column: $table.cdAcaoDescricao,
    builder: (column) => column,
  );

  Expression<T> lcauditoriaRefs<T extends Object>(
    Expression<T> Function($$LCAUDITORIATableAnnotationComposer a) f,
  ) {
    final $$LCAUDITORIATableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cdAcaoId,
      referencedTable: $db.lcauditoria,
      getReferencedColumn: (t) => t.lcAudAcaoId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LCAUDITORIATableAnnotationComposer(
            $db: $db,
            $table: $db.lcauditoria,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CDACAOTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CDACAOTable,
          CDACAOData,
          $$CDACAOTableFilterComposer,
          $$CDACAOTableOrderingComposer,
          $$CDACAOTableAnnotationComposer,
          $$CDACAOTableCreateCompanionBuilder,
          $$CDACAOTableUpdateCompanionBuilder,
          (CDACAOData, $$CDACAOTableReferences),
          CDACAOData,
          PrefetchHooks Function({bool lcauditoriaRefs})
        > {
  $$CDACAOTableTableManager(_$AppDatabase db, $CDACAOTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CDACAOTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CDACAOTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CDACAOTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> cdAcaoId = const Value.absent(),
                Value<String> cdAcaoDescricao = const Value.absent(),
              }) => CDACAOCompanion(
                cdAcaoId: cdAcaoId,
                cdAcaoDescricao: cdAcaoDescricao,
              ),
          createCompanionCallback:
              ({
                Value<int> cdAcaoId = const Value.absent(),
                required String cdAcaoDescricao,
              }) => CDACAOCompanion.insert(
                cdAcaoId: cdAcaoId,
                cdAcaoDescricao: cdAcaoDescricao,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$CDACAOTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({lcauditoriaRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (lcauditoriaRefs) db.lcauditoria],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (lcauditoriaRefs)
                    await $_getPrefetchedData<
                      CDACAOData,
                      $CDACAOTable,
                      LCAUDITORIAData
                    >(
                      currentTable: table,
                      referencedTable: $$CDACAOTableReferences
                          ._lcauditoriaRefsTable(db),
                      managerFromTypedResult: (p0) => $$CDACAOTableReferences(
                        db,
                        table,
                        p0,
                      ).lcauditoriaRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.lcAudAcaoId == item.cdAcaoId,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$CDACAOTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CDACAOTable,
      CDACAOData,
      $$CDACAOTableFilterComposer,
      $$CDACAOTableOrderingComposer,
      $$CDACAOTableAnnotationComposer,
      $$CDACAOTableCreateCompanionBuilder,
      $$CDACAOTableUpdateCompanionBuilder,
      (CDACAOData, $$CDACAOTableReferences),
      CDACAOData,
      PrefetchHooks Function({bool lcauditoriaRefs})
    >;
typedef $$LCAUDITORIATableCreateCompanionBuilder =
    LCAUDITORIACompanion Function({
      Value<int> lcAudId,
      required String lcAudDescricao,
      required DateTime lcAudData,
      required int lcAudAcaoId,
      required int lcAudEmpresaId,
    });
typedef $$LCAUDITORIATableUpdateCompanionBuilder =
    LCAUDITORIACompanion Function({
      Value<int> lcAudId,
      Value<String> lcAudDescricao,
      Value<DateTime> lcAudData,
      Value<int> lcAudAcaoId,
      Value<int> lcAudEmpresaId,
    });

final class $$LCAUDITORIATableReferences
    extends BaseReferences<_$AppDatabase, $LCAUDITORIATable, LCAUDITORIAData> {
  $$LCAUDITORIATableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CDACAOTable _lcAudAcaoIdTable(_$AppDatabase db) =>
      db.cdacao.createAlias(
        $_aliasNameGenerator(db.lcauditoria.lcAudAcaoId, db.cdacao.cdAcaoId),
      );

  $$CDACAOTableProcessedTableManager get lcAudAcaoId {
    final $_column = $_itemColumn<int>('LCAUDACAOID')!;

    final manager = $$CDACAOTableTableManager(
      $_db,
      $_db.cdacao,
    ).filter((f) => f.cdAcaoId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_lcAudAcaoIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $CDEMPRESATable _lcAudEmpresaIdTable(_$AppDatabase db) =>
      db.cdempresa.createAlias(
        $_aliasNameGenerator(
          db.lcauditoria.lcAudEmpresaId,
          db.cdempresa.cdEmpId,
        ),
      );

  $$CDEMPRESATableProcessedTableManager get lcAudEmpresaId {
    final $_column = $_itemColumn<int>('LCAUDEMPRESAID')!;

    final manager = $$CDEMPRESATableTableManager(
      $_db,
      $_db.cdempresa,
    ).filter((f) => f.cdEmpId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_lcAudEmpresaIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$LCAUDITORIATableFilterComposer
    extends Composer<_$AppDatabase, $LCAUDITORIATable> {
  $$LCAUDITORIATableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get lcAudId => $composableBuilder(
    column: $table.lcAudId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lcAudDescricao => $composableBuilder(
    column: $table.lcAudDescricao,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lcAudData => $composableBuilder(
    column: $table.lcAudData,
    builder: (column) => ColumnFilters(column),
  );

  $$CDACAOTableFilterComposer get lcAudAcaoId {
    final $$CDACAOTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.lcAudAcaoId,
      referencedTable: $db.cdacao,
      getReferencedColumn: (t) => t.cdAcaoId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CDACAOTableFilterComposer(
            $db: $db,
            $table: $db.cdacao,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CDEMPRESATableFilterComposer get lcAudEmpresaId {
    final $$CDEMPRESATableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.lcAudEmpresaId,
      referencedTable: $db.cdempresa,
      getReferencedColumn: (t) => t.cdEmpId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CDEMPRESATableFilterComposer(
            $db: $db,
            $table: $db.cdempresa,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LCAUDITORIATableOrderingComposer
    extends Composer<_$AppDatabase, $LCAUDITORIATable> {
  $$LCAUDITORIATableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get lcAudId => $composableBuilder(
    column: $table.lcAudId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lcAudDescricao => $composableBuilder(
    column: $table.lcAudDescricao,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lcAudData => $composableBuilder(
    column: $table.lcAudData,
    builder: (column) => ColumnOrderings(column),
  );

  $$CDACAOTableOrderingComposer get lcAudAcaoId {
    final $$CDACAOTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.lcAudAcaoId,
      referencedTable: $db.cdacao,
      getReferencedColumn: (t) => t.cdAcaoId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CDACAOTableOrderingComposer(
            $db: $db,
            $table: $db.cdacao,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CDEMPRESATableOrderingComposer get lcAudEmpresaId {
    final $$CDEMPRESATableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.lcAudEmpresaId,
      referencedTable: $db.cdempresa,
      getReferencedColumn: (t) => t.cdEmpId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CDEMPRESATableOrderingComposer(
            $db: $db,
            $table: $db.cdempresa,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LCAUDITORIATableAnnotationComposer
    extends Composer<_$AppDatabase, $LCAUDITORIATable> {
  $$LCAUDITORIATableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get lcAudId =>
      $composableBuilder(column: $table.lcAudId, builder: (column) => column);

  GeneratedColumn<String> get lcAudDescricao => $composableBuilder(
    column: $table.lcAudDescricao,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lcAudData =>
      $composableBuilder(column: $table.lcAudData, builder: (column) => column);

  $$CDACAOTableAnnotationComposer get lcAudAcaoId {
    final $$CDACAOTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.lcAudAcaoId,
      referencedTable: $db.cdacao,
      getReferencedColumn: (t) => t.cdAcaoId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CDACAOTableAnnotationComposer(
            $db: $db,
            $table: $db.cdacao,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CDEMPRESATableAnnotationComposer get lcAudEmpresaId {
    final $$CDEMPRESATableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.lcAudEmpresaId,
      referencedTable: $db.cdempresa,
      getReferencedColumn: (t) => t.cdEmpId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CDEMPRESATableAnnotationComposer(
            $db: $db,
            $table: $db.cdempresa,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LCAUDITORIATableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LCAUDITORIATable,
          LCAUDITORIAData,
          $$LCAUDITORIATableFilterComposer,
          $$LCAUDITORIATableOrderingComposer,
          $$LCAUDITORIATableAnnotationComposer,
          $$LCAUDITORIATableCreateCompanionBuilder,
          $$LCAUDITORIATableUpdateCompanionBuilder,
          (LCAUDITORIAData, $$LCAUDITORIATableReferences),
          LCAUDITORIAData,
          PrefetchHooks Function({bool lcAudAcaoId, bool lcAudEmpresaId})
        > {
  $$LCAUDITORIATableTableManager(_$AppDatabase db, $LCAUDITORIATable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LCAUDITORIATableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LCAUDITORIATableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LCAUDITORIATableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> lcAudId = const Value.absent(),
                Value<String> lcAudDescricao = const Value.absent(),
                Value<DateTime> lcAudData = const Value.absent(),
                Value<int> lcAudAcaoId = const Value.absent(),
                Value<int> lcAudEmpresaId = const Value.absent(),
              }) => LCAUDITORIACompanion(
                lcAudId: lcAudId,
                lcAudDescricao: lcAudDescricao,
                lcAudData: lcAudData,
                lcAudAcaoId: lcAudAcaoId,
                lcAudEmpresaId: lcAudEmpresaId,
              ),
          createCompanionCallback:
              ({
                Value<int> lcAudId = const Value.absent(),
                required String lcAudDescricao,
                required DateTime lcAudData,
                required int lcAudAcaoId,
                required int lcAudEmpresaId,
              }) => LCAUDITORIACompanion.insert(
                lcAudId: lcAudId,
                lcAudDescricao: lcAudDescricao,
                lcAudData: lcAudData,
                lcAudAcaoId: lcAudAcaoId,
                lcAudEmpresaId: lcAudEmpresaId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$LCAUDITORIATableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({lcAudAcaoId = false, lcAudEmpresaId = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (lcAudAcaoId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.lcAudAcaoId,
                                    referencedTable:
                                        $$LCAUDITORIATableReferences
                                            ._lcAudAcaoIdTable(db),
                                    referencedColumn:
                                        $$LCAUDITORIATableReferences
                                            ._lcAudAcaoIdTable(db)
                                            .cdAcaoId,
                                  )
                                  as T;
                        }
                        if (lcAudEmpresaId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.lcAudEmpresaId,
                                    referencedTable:
                                        $$LCAUDITORIATableReferences
                                            ._lcAudEmpresaIdTable(db),
                                    referencedColumn:
                                        $$LCAUDITORIATableReferences
                                            ._lcAudEmpresaIdTable(db)
                                            .cdEmpId,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$LCAUDITORIATableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LCAUDITORIATable,
      LCAUDITORIAData,
      $$LCAUDITORIATableFilterComposer,
      $$LCAUDITORIATableOrderingComposer,
      $$LCAUDITORIATableAnnotationComposer,
      $$LCAUDITORIATableCreateCompanionBuilder,
      $$LCAUDITORIATableUpdateCompanionBuilder,
      (LCAUDITORIAData, $$LCAUDITORIATableReferences),
      LCAUDITORIAData,
      PrefetchHooks Function({bool lcAudAcaoId, bool lcAudEmpresaId})
    >;
typedef $$LCCARRINHOTableCreateCompanionBuilder =
    LCCARRINHOCompanion Function({
      Value<int> lcCarId,
      required int lcCarProdutoId,
      required int lcCarUsuarioId,
      required int lcCarQuantidade,
    });
typedef $$LCCARRINHOTableUpdateCompanionBuilder =
    LCCARRINHOCompanion Function({
      Value<int> lcCarId,
      Value<int> lcCarProdutoId,
      Value<int> lcCarUsuarioId,
      Value<int> lcCarQuantidade,
    });

final class $$LCCARRINHOTableReferences
    extends BaseReferences<_$AppDatabase, $LCCARRINHOTable, LCCARRINHOData> {
  $$LCCARRINHOTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CDPRODUTOTable _lcCarProdutoIdTable(_$AppDatabase db) =>
      db.cdproduto.createAlias(
        $_aliasNameGenerator(
          db.lccarrinho.lcCarProdutoId,
          db.cdproduto.cdProdId,
        ),
      );

  $$CDPRODUTOTableProcessedTableManager get lcCarProdutoId {
    final $_column = $_itemColumn<int>('LCCARPRODUTOID')!;

    final manager = $$CDPRODUTOTableTableManager(
      $_db,
      $_db.cdproduto,
    ).filter((f) => f.cdProdId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_lcCarProdutoIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $CDSENHATable _lcCarUsuarioIdTable(_$AppDatabase db) =>
      db.cdsenha.createAlias(
        $_aliasNameGenerator(db.lccarrinho.lcCarUsuarioId, db.cdsenha.cdSeId),
      );

  $$CDSENHATableProcessedTableManager get lcCarUsuarioId {
    final $_column = $_itemColumn<int>('LCCARUSUARIOID')!;

    final manager = $$CDSENHATableTableManager(
      $_db,
      $_db.cdsenha,
    ).filter((f) => f.cdSeId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_lcCarUsuarioIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$LCCARRINHOTableFilterComposer
    extends Composer<_$AppDatabase, $LCCARRINHOTable> {
  $$LCCARRINHOTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get lcCarId => $composableBuilder(
    column: $table.lcCarId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get lcCarQuantidade => $composableBuilder(
    column: $table.lcCarQuantidade,
    builder: (column) => ColumnFilters(column),
  );

  $$CDPRODUTOTableFilterComposer get lcCarProdutoId {
    final $$CDPRODUTOTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.lcCarProdutoId,
      referencedTable: $db.cdproduto,
      getReferencedColumn: (t) => t.cdProdId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CDPRODUTOTableFilterComposer(
            $db: $db,
            $table: $db.cdproduto,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CDSENHATableFilterComposer get lcCarUsuarioId {
    final $$CDSENHATableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.lcCarUsuarioId,
      referencedTable: $db.cdsenha,
      getReferencedColumn: (t) => t.cdSeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CDSENHATableFilterComposer(
            $db: $db,
            $table: $db.cdsenha,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LCCARRINHOTableOrderingComposer
    extends Composer<_$AppDatabase, $LCCARRINHOTable> {
  $$LCCARRINHOTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get lcCarId => $composableBuilder(
    column: $table.lcCarId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get lcCarQuantidade => $composableBuilder(
    column: $table.lcCarQuantidade,
    builder: (column) => ColumnOrderings(column),
  );

  $$CDPRODUTOTableOrderingComposer get lcCarProdutoId {
    final $$CDPRODUTOTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.lcCarProdutoId,
      referencedTable: $db.cdproduto,
      getReferencedColumn: (t) => t.cdProdId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CDPRODUTOTableOrderingComposer(
            $db: $db,
            $table: $db.cdproduto,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CDSENHATableOrderingComposer get lcCarUsuarioId {
    final $$CDSENHATableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.lcCarUsuarioId,
      referencedTable: $db.cdsenha,
      getReferencedColumn: (t) => t.cdSeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CDSENHATableOrderingComposer(
            $db: $db,
            $table: $db.cdsenha,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LCCARRINHOTableAnnotationComposer
    extends Composer<_$AppDatabase, $LCCARRINHOTable> {
  $$LCCARRINHOTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get lcCarId =>
      $composableBuilder(column: $table.lcCarId, builder: (column) => column);

  GeneratedColumn<int> get lcCarQuantidade => $composableBuilder(
    column: $table.lcCarQuantidade,
    builder: (column) => column,
  );

  $$CDPRODUTOTableAnnotationComposer get lcCarProdutoId {
    final $$CDPRODUTOTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.lcCarProdutoId,
      referencedTable: $db.cdproduto,
      getReferencedColumn: (t) => t.cdProdId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CDPRODUTOTableAnnotationComposer(
            $db: $db,
            $table: $db.cdproduto,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CDSENHATableAnnotationComposer get lcCarUsuarioId {
    final $$CDSENHATableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.lcCarUsuarioId,
      referencedTable: $db.cdsenha,
      getReferencedColumn: (t) => t.cdSeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CDSENHATableAnnotationComposer(
            $db: $db,
            $table: $db.cdsenha,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LCCARRINHOTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LCCARRINHOTable,
          LCCARRINHOData,
          $$LCCARRINHOTableFilterComposer,
          $$LCCARRINHOTableOrderingComposer,
          $$LCCARRINHOTableAnnotationComposer,
          $$LCCARRINHOTableCreateCompanionBuilder,
          $$LCCARRINHOTableUpdateCompanionBuilder,
          (LCCARRINHOData, $$LCCARRINHOTableReferences),
          LCCARRINHOData,
          PrefetchHooks Function({bool lcCarProdutoId, bool lcCarUsuarioId})
        > {
  $$LCCARRINHOTableTableManager(_$AppDatabase db, $LCCARRINHOTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LCCARRINHOTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LCCARRINHOTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LCCARRINHOTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> lcCarId = const Value.absent(),
                Value<int> lcCarProdutoId = const Value.absent(),
                Value<int> lcCarUsuarioId = const Value.absent(),
                Value<int> lcCarQuantidade = const Value.absent(),
              }) => LCCARRINHOCompanion(
                lcCarId: lcCarId,
                lcCarProdutoId: lcCarProdutoId,
                lcCarUsuarioId: lcCarUsuarioId,
                lcCarQuantidade: lcCarQuantidade,
              ),
          createCompanionCallback:
              ({
                Value<int> lcCarId = const Value.absent(),
                required int lcCarProdutoId,
                required int lcCarUsuarioId,
                required int lcCarQuantidade,
              }) => LCCARRINHOCompanion.insert(
                lcCarId: lcCarId,
                lcCarProdutoId: lcCarProdutoId,
                lcCarUsuarioId: lcCarUsuarioId,
                lcCarQuantidade: lcCarQuantidade,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$LCCARRINHOTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({lcCarProdutoId = false, lcCarUsuarioId = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (lcCarProdutoId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.lcCarProdutoId,
                                    referencedTable: $$LCCARRINHOTableReferences
                                        ._lcCarProdutoIdTable(db),
                                    referencedColumn:
                                        $$LCCARRINHOTableReferences
                                            ._lcCarProdutoIdTable(db)
                                            .cdProdId,
                                  )
                                  as T;
                        }
                        if (lcCarUsuarioId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.lcCarUsuarioId,
                                    referencedTable: $$LCCARRINHOTableReferences
                                        ._lcCarUsuarioIdTable(db),
                                    referencedColumn:
                                        $$LCCARRINHOTableReferences
                                            ._lcCarUsuarioIdTable(db)
                                            .cdSeId,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$LCCARRINHOTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LCCARRINHOTable,
      LCCARRINHOData,
      $$LCCARRINHOTableFilterComposer,
      $$LCCARRINHOTableOrderingComposer,
      $$LCCARRINHOTableAnnotationComposer,
      $$LCCARRINHOTableCreateCompanionBuilder,
      $$LCCARRINHOTableUpdateCompanionBuilder,
      (LCCARRINHOData, $$LCCARRINHOTableReferences),
      LCCARRINHOData,
      PrefetchHooks Function({bool lcCarProdutoId, bool lcCarUsuarioId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CDEMPRESATableTableManager get cdempresa =>
      $$CDEMPRESATableTableManager(_db, _db.cdempresa);
  $$CDCARGOTableTableManager get cdcargo =>
      $$CDCARGOTableTableManager(_db, _db.cdcargo);
  $$CDSENHATableTableManager get cdsenha =>
      $$CDSENHATableTableManager(_db, _db.cdsenha);
  $$FIDELSESSAOTableTableManager get fidelsessao =>
      $$FIDELSESSAOTableTableManager(_db, _db.fidelsessao);
  $$LCVENDATableTableManager get lcvenda =>
      $$LCVENDATableTableManager(_db, _db.lcvenda);
  $$CDCATEGORIATableTableManager get cdcategoria =>
      $$CDCATEGORIATableTableManager(_db, _db.cdcategoria);
  $$CDPRODUTOTableTableManager get cdproduto =>
      $$CDPRODUTOTableTableManager(_db, _db.cdproduto);
  $$CDPRODUTOIMAGEMTableTableManager get cdprodutoimagem =>
      $$CDPRODUTOIMAGEMTableTableManager(_db, _db.cdprodutoimagem);
  $$CDEXCECAOTableTableManager get cdexcecao =>
      $$CDEXCECAOTableTableManager(_db, _db.cdexcecao);
  $$CDACAOTableTableManager get cdacao =>
      $$CDACAOTableTableManager(_db, _db.cdacao);
  $$LCAUDITORIATableTableManager get lcauditoria =>
      $$LCAUDITORIATableTableManager(_db, _db.lcauditoria);
  $$LCCARRINHOTableTableManager get lccarrinho =>
      $$LCCARRINHOTableTableManager(_db, _db.lccarrinho);
}

mixin _$CDEMPRESADAOMixin on DatabaseAccessor<AppDatabase> {
  $CDEMPRESATable get cdempresa => attachedDatabase.cdempresa;
}
mixin _$CDCARGODAOMixin on DatabaseAccessor<AppDatabase> {
  $CDEMPRESATable get cdempresa => attachedDatabase.cdempresa;
  $CDCARGOTable get cdcargo => attachedDatabase.cdcargo;
}
mixin _$CDSENHADAOMixin on DatabaseAccessor<AppDatabase> {
  $CDEMPRESATable get cdempresa => attachedDatabase.cdempresa;
  $CDCARGOTable get cdcargo => attachedDatabase.cdcargo;
  $CDSENHATable get cdsenha => attachedDatabase.cdsenha;
}
mixin _$FIDELSESSAODAOMixin on DatabaseAccessor<AppDatabase> {
  $CDEMPRESATable get cdempresa => attachedDatabase.cdempresa;
  $CDCARGOTable get cdcargo => attachedDatabase.cdcargo;
  $CDSENHATable get cdsenha => attachedDatabase.cdsenha;
  $FIDELSESSAOTable get fidelsessao => attachedDatabase.fidelsessao;
}
mixin _$LCVENDADAOMixin on DatabaseAccessor<AppDatabase> {
  $CDEMPRESATable get cdempresa => attachedDatabase.cdempresa;
  $CDCARGOTable get cdcargo => attachedDatabase.cdcargo;
  $CDSENHATable get cdsenha => attachedDatabase.cdsenha;
  $LCVENDATable get lcvenda => attachedDatabase.lcvenda;
}
mixin _$CDPRODUTODAOMixin on DatabaseAccessor<AppDatabase> {
  $CDEMPRESATable get cdempresa => attachedDatabase.cdempresa;
  $CDCATEGORIATable get cdcategoria => attachedDatabase.cdcategoria;
  $CDPRODUTOTable get cdproduto => attachedDatabase.cdproduto;
}
mixin _$CDCATEGORIADAOMixin on DatabaseAccessor<AppDatabase> {
  $CDCATEGORIATable get cdcategoria => attachedDatabase.cdcategoria;
}
mixin _$CDPRODUTOIMAGEMDAOMixin on DatabaseAccessor<AppDatabase> {
  $CDEMPRESATable get cdempresa => attachedDatabase.cdempresa;
  $CDCATEGORIATable get cdcategoria => attachedDatabase.cdcategoria;
  $CDPRODUTOTable get cdproduto => attachedDatabase.cdproduto;
  $CDPRODUTOIMAGEMTable get cdprodutoimagem => attachedDatabase.cdprodutoimagem;
}
mixin _$CDEXCECAODAOMixin on DatabaseAccessor<AppDatabase> {
  $CDEMPRESATable get cdempresa => attachedDatabase.cdempresa;
  $CDEXCECAOTable get cdexcecao => attachedDatabase.cdexcecao;
}
mixin _$CDACAODAOMixin on DatabaseAccessor<AppDatabase> {
  $CDACAOTable get cdacao => attachedDatabase.cdacao;
}
mixin _$LCAUDITORIADAOMixin on DatabaseAccessor<AppDatabase> {
  $CDACAOTable get cdacao => attachedDatabase.cdacao;
  $CDEMPRESATable get cdempresa => attachedDatabase.cdempresa;
  $LCAUDITORIATable get lcauditoria => attachedDatabase.lcauditoria;
}
mixin _$LCCARRINHODAOMixin on DatabaseAccessor<AppDatabase> {
  $CDEMPRESATable get cdempresa => attachedDatabase.cdempresa;
  $CDCATEGORIATable get cdcategoria => attachedDatabase.cdcategoria;
  $CDPRODUTOTable get cdproduto => attachedDatabase.cdproduto;
  $CDCARGOTable get cdcargo => attachedDatabase.cdcargo;
  $CDSENHATable get cdsenha => attachedDatabase.cdsenha;
  $LCCARRINHOTable get lccarrinho => attachedDatabase.lccarrinho;
}
