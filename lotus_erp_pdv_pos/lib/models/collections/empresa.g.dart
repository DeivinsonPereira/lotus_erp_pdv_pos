// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'empresa.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetempresaCollection on Isar {
  IsarCollection<empresa> get empresas => this.collection();
}

const EmpresaSchema = CollectionSchema(
  name: r'empresa',
  id: 8683736316003132081,
  properties: {
    r'bairro': PropertySchema(
      id: 0,
      name: r'bairro',
      type: IsarType.string,
    ),
    r'cep': PropertySchema(
      id: 1,
      name: r'cep',
      type: IsarType.string,
    ),
    r'cnpj': PropertySchema(
      id: 2,
      name: r'cnpj',
      type: IsarType.string,
    ),
    r'complemento': PropertySchema(
      id: 3,
      name: r'complemento',
      type: IsarType.string,
    ),
    r'email': PropertySchema(
      id: 4,
      name: r'email',
      type: IsarType.string,
    ),
    r'endereco': PropertySchema(
      id: 5,
      name: r'endereco',
      type: IsarType.string,
    ),
    r'enderecoNumero': PropertySchema(
      id: 6,
      name: r'enderecoNumero',
      type: IsarType.string,
    ),
    r'fantasia': PropertySchema(
      id: 7,
      name: r'fantasia',
      type: IsarType.string,
    ),
    r'fone1': PropertySchema(
      id: 8,
      name: r'fone1',
      type: IsarType.string,
    ),
    r'idMunicipio': PropertySchema(
      id: 9,
      name: r'idMunicipio',
      type: IsarType.string,
    ),
    r'logo_branca': PropertySchema(
      id: 10,
      name: r'logo_branca',
      type: IsarType.string,
    ),
    r'logo_padrao': PropertySchema(
      id: 11,
      name: r'logo_padrao',
      type: IsarType.string,
    ),
    r'municipio': PropertySchema(
      id: 12,
      name: r'municipio',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 13,
      name: r'name',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 14,
      name: r'status',
      type: IsarType.long,
    )
  },
  estimateSize: _empresaEstimateSize,
  serialize: _empresaSerialize,
  deserialize: _empresaDeserialize,
  deserializeProp: _empresaDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _empresaGetId,
  getLinks: _empresaGetLinks,
  attach: _empresaAttach,
  version: '3.1.0+1',
);

int _empresaEstimateSize(
  empresa object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.bairro;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.cep;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.cnpj;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.complemento;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.email;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.endereco;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.enderecoNumero;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.fantasia;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.fone1;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.idMunicipio;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.logo_branca;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.logo_padrao;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.municipio;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _empresaSerialize(
  empresa object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.bairro);
  writer.writeString(offsets[1], object.cep);
  writer.writeString(offsets[2], object.cnpj);
  writer.writeString(offsets[3], object.complemento);
  writer.writeString(offsets[4], object.email);
  writer.writeString(offsets[5], object.endereco);
  writer.writeString(offsets[6], object.enderecoNumero);
  writer.writeString(offsets[7], object.fantasia);
  writer.writeString(offsets[8], object.fone1);
  writer.writeString(offsets[9], object.idMunicipio);
  writer.writeString(offsets[10], object.logo_branca);
  writer.writeString(offsets[11], object.logo_padrao);
  writer.writeString(offsets[12], object.municipio);
  writer.writeString(offsets[13], object.name);
  writer.writeLong(offsets[14], object.status);
}

empresa _empresaDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = empresa(
    bairro: reader.readStringOrNull(offsets[0]),
    cep: reader.readStringOrNull(offsets[1]),
    cnpj: reader.readStringOrNull(offsets[2]),
    complemento: reader.readStringOrNull(offsets[3]),
    email: reader.readStringOrNull(offsets[4]),
    endereco: reader.readStringOrNull(offsets[5]),
    enderecoNumero: reader.readStringOrNull(offsets[6]),
    fantasia: reader.readStringOrNull(offsets[7]),
    fone1: reader.readStringOrNull(offsets[8]),
    id: id,
    idMunicipio: reader.readStringOrNull(offsets[9]),
    logo_branca: reader.readStringOrNull(offsets[10]),
    logo_padrao: reader.readStringOrNull(offsets[11]),
    municipio: reader.readStringOrNull(offsets[12]),
    name: reader.readStringOrNull(offsets[13]),
    status: reader.readLongOrNull(offsets[14]),
  );
  return object;
}

P _empresaDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    case 14:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _empresaGetId(empresa object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _empresaGetLinks(empresa object) {
  return [];
}

void _empresaAttach(IsarCollection<dynamic> col, Id id, empresa object) {
  object.id = id;
}

extension empresaQueryWhereSort on QueryBuilder<empresa, empresa, QWhere> {
  QueryBuilder<empresa, empresa, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension empresaQueryWhere on QueryBuilder<empresa, empresa, QWhereClause> {
  QueryBuilder<empresa, empresa, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<empresa, empresa, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<empresa, empresa, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<empresa, empresa, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension empresaQueryFilter
    on QueryBuilder<empresa, empresa, QFilterCondition> {
  QueryBuilder<empresa, empresa, QAfterFilterCondition> bairroIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'bairro',
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> bairroIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'bairro',
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> bairroEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bairro',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> bairroGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bairro',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> bairroLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bairro',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> bairroBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bairro',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> bairroStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'bairro',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> bairroEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'bairro',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> bairroContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'bairro',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> bairroMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'bairro',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> bairroIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bairro',
        value: '',
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> bairroIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'bairro',
        value: '',
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> cepIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cep',
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> cepIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cep',
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> cepEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cep',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> cepGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cep',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> cepLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cep',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> cepBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cep',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> cepStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'cep',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> cepEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'cep',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> cepContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'cep',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> cepMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'cep',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> cepIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cep',
        value: '',
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> cepIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cep',
        value: '',
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> cnpjIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cnpj',
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> cnpjIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cnpj',
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> cnpjEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cnpj',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> cnpjGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cnpj',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> cnpjLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cnpj',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> cnpjBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cnpj',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> cnpjStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'cnpj',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> cnpjEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'cnpj',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> cnpjContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'cnpj',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> cnpjMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'cnpj',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> cnpjIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cnpj',
        value: '',
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> cnpjIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cnpj',
        value: '',
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> complementoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'complemento',
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> complementoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'complemento',
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> complementoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'complemento',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> complementoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'complemento',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> complementoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'complemento',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> complementoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'complemento',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> complementoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'complemento',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> complementoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'complemento',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> complementoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'complemento',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> complementoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'complemento',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> complementoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'complemento',
        value: '',
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition>
      complementoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'complemento',
        value: '',
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> emailIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'email',
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> emailIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'email',
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> emailEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> emailGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> emailLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> emailBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'email',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> emailStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> emailEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> emailContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> emailMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'email',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> emailIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'email',
        value: '',
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> emailIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'email',
        value: '',
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> enderecoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'endereco',
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> enderecoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'endereco',
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> enderecoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endereco',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> enderecoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'endereco',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> enderecoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'endereco',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> enderecoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'endereco',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> enderecoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'endereco',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> enderecoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'endereco',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> enderecoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'endereco',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> enderecoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'endereco',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> enderecoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endereco',
        value: '',
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> enderecoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'endereco',
        value: '',
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> enderecoNumeroIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'enderecoNumero',
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition>
      enderecoNumeroIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'enderecoNumero',
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> enderecoNumeroEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'enderecoNumero',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition>
      enderecoNumeroGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'enderecoNumero',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> enderecoNumeroLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'enderecoNumero',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> enderecoNumeroBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'enderecoNumero',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition>
      enderecoNumeroStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'enderecoNumero',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> enderecoNumeroEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'enderecoNumero',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> enderecoNumeroContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'enderecoNumero',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> enderecoNumeroMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'enderecoNumero',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition>
      enderecoNumeroIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'enderecoNumero',
        value: '',
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition>
      enderecoNumeroIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'enderecoNumero',
        value: '',
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> fantasiaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fantasia',
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> fantasiaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fantasia',
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> fantasiaEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fantasia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> fantasiaGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fantasia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> fantasiaLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fantasia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> fantasiaBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fantasia',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> fantasiaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fantasia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> fantasiaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fantasia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> fantasiaContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fantasia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> fantasiaMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fantasia',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> fantasiaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fantasia',
        value: '',
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> fantasiaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fantasia',
        value: '',
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> fone1IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fone1',
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> fone1IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fone1',
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> fone1EqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fone1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> fone1GreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fone1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> fone1LessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fone1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> fone1Between(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fone1',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> fone1StartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fone1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> fone1EndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fone1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> fone1Contains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fone1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> fone1Matches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fone1',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> fone1IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fone1',
        value: '',
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> fone1IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fone1',
        value: '',
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> idMunicipioIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'idMunicipio',
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> idMunicipioIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'idMunicipio',
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> idMunicipioEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idMunicipio',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> idMunicipioGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'idMunicipio',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> idMunicipioLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'idMunicipio',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> idMunicipioBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'idMunicipio',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> idMunicipioStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'idMunicipio',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> idMunicipioEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'idMunicipio',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> idMunicipioContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'idMunicipio',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> idMunicipioMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'idMunicipio',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> idMunicipioIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idMunicipio',
        value: '',
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition>
      idMunicipioIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'idMunicipio',
        value: '',
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> logo_brancaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'logo_branca',
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> logo_brancaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'logo_branca',
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> logo_brancaEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'logo_branca',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> logo_brancaGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'logo_branca',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> logo_brancaLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'logo_branca',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> logo_brancaBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'logo_branca',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> logo_brancaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'logo_branca',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> logo_brancaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'logo_branca',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> logo_brancaContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'logo_branca',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> logo_brancaMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'logo_branca',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> logo_brancaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'logo_branca',
        value: '',
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition>
      logo_brancaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'logo_branca',
        value: '',
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> logo_padraoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'logo_padrao',
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> logo_padraoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'logo_padrao',
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> logo_padraoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'logo_padrao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> logo_padraoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'logo_padrao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> logo_padraoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'logo_padrao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> logo_padraoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'logo_padrao',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> logo_padraoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'logo_padrao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> logo_padraoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'logo_padrao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> logo_padraoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'logo_padrao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> logo_padraoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'logo_padrao',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> logo_padraoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'logo_padrao',
        value: '',
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition>
      logo_padraoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'logo_padrao',
        value: '',
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> municipioIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'municipio',
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> municipioIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'municipio',
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> municipioEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'municipio',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> municipioGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'municipio',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> municipioLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'municipio',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> municipioBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'municipio',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> municipioStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'municipio',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> municipioEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'municipio',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> municipioContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'municipio',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> municipioMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'municipio',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> municipioIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'municipio',
        value: '',
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> municipioIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'municipio',
        value: '',
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> nameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> nameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> nameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> nameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> statusIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'status',
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> statusIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'status',
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> statusEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> statusGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> statusLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<empresa, empresa, QAfterFilterCondition> statusBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'status',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension empresaQueryObject
    on QueryBuilder<empresa, empresa, QFilterCondition> {}

extension empresaQueryLinks
    on QueryBuilder<empresa, empresa, QFilterCondition> {}

extension empresaQuerySortBy on QueryBuilder<empresa, empresa, QSortBy> {
  QueryBuilder<empresa, empresa, QAfterSortBy> sortByBairro() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bairro', Sort.asc);
    });
  }

  QueryBuilder<empresa, empresa, QAfterSortBy> sortByBairroDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bairro', Sort.desc);
    });
  }

  QueryBuilder<empresa, empresa, QAfterSortBy> sortByCep() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cep', Sort.asc);
    });
  }

  QueryBuilder<empresa, empresa, QAfterSortBy> sortByCepDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cep', Sort.desc);
    });
  }

  QueryBuilder<empresa, empresa, QAfterSortBy> sortByCnpj() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cnpj', Sort.asc);
    });
  }

  QueryBuilder<empresa, empresa, QAfterSortBy> sortByCnpjDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cnpj', Sort.desc);
    });
  }

  QueryBuilder<empresa, empresa, QAfterSortBy> sortByComplemento() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'complemento', Sort.asc);
    });
  }

  QueryBuilder<empresa, empresa, QAfterSortBy> sortByComplementoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'complemento', Sort.desc);
    });
  }

  QueryBuilder<empresa, empresa, QAfterSortBy> sortByEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.asc);
    });
  }

  QueryBuilder<empresa, empresa, QAfterSortBy> sortByEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.desc);
    });
  }

  QueryBuilder<empresa, empresa, QAfterSortBy> sortByEndereco() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endereco', Sort.asc);
    });
  }

  QueryBuilder<empresa, empresa, QAfterSortBy> sortByEnderecoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endereco', Sort.desc);
    });
  }

  QueryBuilder<empresa, empresa, QAfterSortBy> sortByEnderecoNumero() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enderecoNumero', Sort.asc);
    });
  }

  QueryBuilder<empresa, empresa, QAfterSortBy> sortByEnderecoNumeroDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enderecoNumero', Sort.desc);
    });
  }

  QueryBuilder<empresa, empresa, QAfterSortBy> sortByFantasia() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fantasia', Sort.asc);
    });
  }

  QueryBuilder<empresa, empresa, QAfterSortBy> sortByFantasiaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fantasia', Sort.desc);
    });
  }

  QueryBuilder<empresa, empresa, QAfterSortBy> sortByFone1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fone1', Sort.asc);
    });
  }

  QueryBuilder<empresa, empresa, QAfterSortBy> sortByFone1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fone1', Sort.desc);
    });
  }

  QueryBuilder<empresa, empresa, QAfterSortBy> sortByIdMunicipio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idMunicipio', Sort.asc);
    });
  }

  QueryBuilder<empresa, empresa, QAfterSortBy> sortByIdMunicipioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idMunicipio', Sort.desc);
    });
  }

  QueryBuilder<empresa, empresa, QAfterSortBy> sortByLogo_branca() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logo_branca', Sort.asc);
    });
  }

  QueryBuilder<empresa, empresa, QAfterSortBy> sortByLogo_brancaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logo_branca', Sort.desc);
    });
  }

  QueryBuilder<empresa, empresa, QAfterSortBy> sortByLogo_padrao() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logo_padrao', Sort.asc);
    });
  }

  QueryBuilder<empresa, empresa, QAfterSortBy> sortByLogo_padraoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logo_padrao', Sort.desc);
    });
  }

  QueryBuilder<empresa, empresa, QAfterSortBy> sortByMunicipio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'municipio', Sort.asc);
    });
  }

  QueryBuilder<empresa, empresa, QAfterSortBy> sortByMunicipioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'municipio', Sort.desc);
    });
  }

  QueryBuilder<empresa, empresa, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<empresa, empresa, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<empresa, empresa, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<empresa, empresa, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }
}

extension empresaQuerySortThenBy
    on QueryBuilder<empresa, empresa, QSortThenBy> {
  QueryBuilder<empresa, empresa, QAfterSortBy> thenByBairro() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bairro', Sort.asc);
    });
  }

  QueryBuilder<empresa, empresa, QAfterSortBy> thenByBairroDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bairro', Sort.desc);
    });
  }

  QueryBuilder<empresa, empresa, QAfterSortBy> thenByCep() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cep', Sort.asc);
    });
  }

  QueryBuilder<empresa, empresa, QAfterSortBy> thenByCepDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cep', Sort.desc);
    });
  }

  QueryBuilder<empresa, empresa, QAfterSortBy> thenByCnpj() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cnpj', Sort.asc);
    });
  }

  QueryBuilder<empresa, empresa, QAfterSortBy> thenByCnpjDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cnpj', Sort.desc);
    });
  }

  QueryBuilder<empresa, empresa, QAfterSortBy> thenByComplemento() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'complemento', Sort.asc);
    });
  }

  QueryBuilder<empresa, empresa, QAfterSortBy> thenByComplementoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'complemento', Sort.desc);
    });
  }

  QueryBuilder<empresa, empresa, QAfterSortBy> thenByEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.asc);
    });
  }

  QueryBuilder<empresa, empresa, QAfterSortBy> thenByEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.desc);
    });
  }

  QueryBuilder<empresa, empresa, QAfterSortBy> thenByEndereco() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endereco', Sort.asc);
    });
  }

  QueryBuilder<empresa, empresa, QAfterSortBy> thenByEnderecoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endereco', Sort.desc);
    });
  }

  QueryBuilder<empresa, empresa, QAfterSortBy> thenByEnderecoNumero() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enderecoNumero', Sort.asc);
    });
  }

  QueryBuilder<empresa, empresa, QAfterSortBy> thenByEnderecoNumeroDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enderecoNumero', Sort.desc);
    });
  }

  QueryBuilder<empresa, empresa, QAfterSortBy> thenByFantasia() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fantasia', Sort.asc);
    });
  }

  QueryBuilder<empresa, empresa, QAfterSortBy> thenByFantasiaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fantasia', Sort.desc);
    });
  }

  QueryBuilder<empresa, empresa, QAfterSortBy> thenByFone1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fone1', Sort.asc);
    });
  }

  QueryBuilder<empresa, empresa, QAfterSortBy> thenByFone1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fone1', Sort.desc);
    });
  }

  QueryBuilder<empresa, empresa, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<empresa, empresa, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<empresa, empresa, QAfterSortBy> thenByIdMunicipio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idMunicipio', Sort.asc);
    });
  }

  QueryBuilder<empresa, empresa, QAfterSortBy> thenByIdMunicipioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idMunicipio', Sort.desc);
    });
  }

  QueryBuilder<empresa, empresa, QAfterSortBy> thenByLogo_branca() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logo_branca', Sort.asc);
    });
  }

  QueryBuilder<empresa, empresa, QAfterSortBy> thenByLogo_brancaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logo_branca', Sort.desc);
    });
  }

  QueryBuilder<empresa, empresa, QAfterSortBy> thenByLogo_padrao() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logo_padrao', Sort.asc);
    });
  }

  QueryBuilder<empresa, empresa, QAfterSortBy> thenByLogo_padraoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logo_padrao', Sort.desc);
    });
  }

  QueryBuilder<empresa, empresa, QAfterSortBy> thenByMunicipio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'municipio', Sort.asc);
    });
  }

  QueryBuilder<empresa, empresa, QAfterSortBy> thenByMunicipioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'municipio', Sort.desc);
    });
  }

  QueryBuilder<empresa, empresa, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<empresa, empresa, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<empresa, empresa, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<empresa, empresa, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }
}

extension empresaQueryWhereDistinct
    on QueryBuilder<empresa, empresa, QDistinct> {
  QueryBuilder<empresa, empresa, QDistinct> distinctByBairro(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bairro', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<empresa, empresa, QDistinct> distinctByCep(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cep', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<empresa, empresa, QDistinct> distinctByCnpj(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cnpj', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<empresa, empresa, QDistinct> distinctByComplemento(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'complemento', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<empresa, empresa, QDistinct> distinctByEmail(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'email', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<empresa, empresa, QDistinct> distinctByEndereco(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'endereco', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<empresa, empresa, QDistinct> distinctByEnderecoNumero(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'enderecoNumero',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<empresa, empresa, QDistinct> distinctByFantasia(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fantasia', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<empresa, empresa, QDistinct> distinctByFone1(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fone1', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<empresa, empresa, QDistinct> distinctByIdMunicipio(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idMunicipio', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<empresa, empresa, QDistinct> distinctByLogo_branca(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'logo_branca', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<empresa, empresa, QDistinct> distinctByLogo_padrao(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'logo_padrao', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<empresa, empresa, QDistinct> distinctByMunicipio(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'municipio', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<empresa, empresa, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<empresa, empresa, QDistinct> distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }
}

extension empresaQueryProperty
    on QueryBuilder<empresa, empresa, QQueryProperty> {
  QueryBuilder<empresa, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<empresa, String?, QQueryOperations> bairroProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bairro');
    });
  }

  QueryBuilder<empresa, String?, QQueryOperations> cepProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cep');
    });
  }

  QueryBuilder<empresa, String?, QQueryOperations> cnpjProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cnpj');
    });
  }

  QueryBuilder<empresa, String?, QQueryOperations> complementoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'complemento');
    });
  }

  QueryBuilder<empresa, String?, QQueryOperations> emailProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'email');
    });
  }

  QueryBuilder<empresa, String?, QQueryOperations> enderecoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'endereco');
    });
  }

  QueryBuilder<empresa, String?, QQueryOperations> enderecoNumeroProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'enderecoNumero');
    });
  }

  QueryBuilder<empresa, String?, QQueryOperations> fantasiaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fantasia');
    });
  }

  QueryBuilder<empresa, String?, QQueryOperations> fone1Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fone1');
    });
  }

  QueryBuilder<empresa, String?, QQueryOperations> idMunicipioProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idMunicipio');
    });
  }

  QueryBuilder<empresa, String?, QQueryOperations> logo_brancaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'logo_branca');
    });
  }

  QueryBuilder<empresa, String?, QQueryOperations> logo_padraoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'logo_padrao');
    });
  }

  QueryBuilder<empresa, String?, QQueryOperations> municipioProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'municipio');
    });
  }

  QueryBuilder<empresa, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<empresa, int?, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }
}
