// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dado_empresa.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension Getdado_empresaCollection on Isar {
  IsarCollection<dado_empresa> get dado_empresas => this.collection();
}

const Dado_empresaSchema = CollectionSchema(
  name: r'dado_empresa',
  id: 8509089205883310449,
  properties: {
    r'cor_fundo': PropertySchema(
      id: 0,
      name: r'cor_fundo',
      type: IsarType.string,
    ),
    r'id_empresa': PropertySchema(
      id: 1,
      name: r'id_empresa',
      type: IsarType.long,
    ),
    r'id_nfce': PropertySchema(
      id: 2,
      name: r'id_nfce',
      type: IsarType.long,
    ),
    r'num_caixa': PropertySchema(
      id: 3,
      name: r'num_caixa',
      type: IsarType.long,
    ),
    r'tamanho_impressora': PropertySchema(
      id: 4,
      name: r'tamanho_impressora',
      type: IsarType.string,
    )
  },
  estimateSize: _dado_empresaEstimateSize,
  serialize: _dado_empresaSerialize,
  deserialize: _dado_empresaDeserialize,
  deserializeProp: _dado_empresaDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _dado_empresaGetId,
  getLinks: _dado_empresaGetLinks,
  attach: _dado_empresaAttach,
  version: '3.1.0+1',
);

int _dado_empresaEstimateSize(
  dado_empresa object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.cor_fundo.length * 3;
  {
    final value = object.tamanho_impressora;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _dado_empresaSerialize(
  dado_empresa object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.cor_fundo);
  writer.writeLong(offsets[1], object.id_empresa);
  writer.writeLong(offsets[2], object.id_nfce);
  writer.writeLong(offsets[3], object.num_caixa);
  writer.writeString(offsets[4], object.tamanho_impressora);
}

dado_empresa _dado_empresaDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = dado_empresa(
    cor_fundo: reader.readString(offsets[0]),
    id_empresa: reader.readLongOrNull(offsets[1]),
    id_nfce: reader.readLongOrNull(offsets[2]),
    num_caixa: reader.readLongOrNull(offsets[3]),
    tamanho_impressora: reader.readStringOrNull(offsets[4]),
  );
  object.id = id;
  return object;
}

P _dado_empresaDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _dado_empresaGetId(dado_empresa object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _dado_empresaGetLinks(dado_empresa object) {
  return [];
}

void _dado_empresaAttach(
    IsarCollection<dynamic> col, Id id, dado_empresa object) {
  object.id = id;
}

extension dado_empresaQueryWhereSort
    on QueryBuilder<dado_empresa, dado_empresa, QWhere> {
  QueryBuilder<dado_empresa, dado_empresa, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension dado_empresaQueryWhere
    on QueryBuilder<dado_empresa, dado_empresa, QWhereClause> {
  QueryBuilder<dado_empresa, dado_empresa, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<dado_empresa, dado_empresa, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterWhereClause> idBetween(
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

extension dado_empresaQueryFilter
    on QueryBuilder<dado_empresa, dado_empresa, QFilterCondition> {
  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      cor_fundoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cor_fundo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      cor_fundoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cor_fundo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      cor_fundoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cor_fundo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      cor_fundoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cor_fundo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      cor_fundoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'cor_fundo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      cor_fundoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'cor_fundo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      cor_fundoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'cor_fundo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      cor_fundoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'cor_fundo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      cor_fundoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cor_fundo',
        value: '',
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      cor_fundoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cor_fundo',
        value: '',
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition> idBetween(
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

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      id_empresaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id_empresa',
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      id_empresaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id_empresa',
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      id_empresaEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id_empresa',
        value: value,
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      id_empresaGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id_empresa',
        value: value,
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      id_empresaLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id_empresa',
        value: value,
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      id_empresaBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id_empresa',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      id_nfceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id_nfce',
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      id_nfceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id_nfce',
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      id_nfceEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id_nfce',
        value: value,
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      id_nfceGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id_nfce',
        value: value,
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      id_nfceLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id_nfce',
        value: value,
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      id_nfceBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id_nfce',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      num_caixaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'num_caixa',
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      num_caixaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'num_caixa',
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      num_caixaEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'num_caixa',
        value: value,
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      num_caixaGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'num_caixa',
        value: value,
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      num_caixaLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'num_caixa',
        value: value,
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      num_caixaBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'num_caixa',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      tamanho_impressoraIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tamanho_impressora',
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      tamanho_impressoraIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tamanho_impressora',
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      tamanho_impressoraEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tamanho_impressora',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      tamanho_impressoraGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tamanho_impressora',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      tamanho_impressoraLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tamanho_impressora',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      tamanho_impressoraBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tamanho_impressora',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      tamanho_impressoraStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tamanho_impressora',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      tamanho_impressoraEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tamanho_impressora',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      tamanho_impressoraContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tamanho_impressora',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      tamanho_impressoraMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tamanho_impressora',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      tamanho_impressoraIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tamanho_impressora',
        value: '',
      ));
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterFilterCondition>
      tamanho_impressoraIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tamanho_impressora',
        value: '',
      ));
    });
  }
}

extension dado_empresaQueryObject
    on QueryBuilder<dado_empresa, dado_empresa, QFilterCondition> {}

extension dado_empresaQueryLinks
    on QueryBuilder<dado_empresa, dado_empresa, QFilterCondition> {}

extension dado_empresaQuerySortBy
    on QueryBuilder<dado_empresa, dado_empresa, QSortBy> {
  QueryBuilder<dado_empresa, dado_empresa, QAfterSortBy> sortByCor_fundo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cor_fundo', Sort.asc);
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterSortBy> sortByCor_fundoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cor_fundo', Sort.desc);
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterSortBy> sortById_empresa() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_empresa', Sort.asc);
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterSortBy>
      sortById_empresaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_empresa', Sort.desc);
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterSortBy> sortById_nfce() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_nfce', Sort.asc);
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterSortBy> sortById_nfceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_nfce', Sort.desc);
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterSortBy> sortByNum_caixa() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'num_caixa', Sort.asc);
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterSortBy> sortByNum_caixaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'num_caixa', Sort.desc);
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterSortBy>
      sortByTamanho_impressora() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tamanho_impressora', Sort.asc);
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterSortBy>
      sortByTamanho_impressoraDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tamanho_impressora', Sort.desc);
    });
  }
}

extension dado_empresaQuerySortThenBy
    on QueryBuilder<dado_empresa, dado_empresa, QSortThenBy> {
  QueryBuilder<dado_empresa, dado_empresa, QAfterSortBy> thenByCor_fundo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cor_fundo', Sort.asc);
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterSortBy> thenByCor_fundoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cor_fundo', Sort.desc);
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterSortBy> thenById_empresa() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_empresa', Sort.asc);
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterSortBy>
      thenById_empresaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_empresa', Sort.desc);
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterSortBy> thenById_nfce() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_nfce', Sort.asc);
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterSortBy> thenById_nfceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_nfce', Sort.desc);
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterSortBy> thenByNum_caixa() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'num_caixa', Sort.asc);
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterSortBy> thenByNum_caixaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'num_caixa', Sort.desc);
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterSortBy>
      thenByTamanho_impressora() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tamanho_impressora', Sort.asc);
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QAfterSortBy>
      thenByTamanho_impressoraDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tamanho_impressora', Sort.desc);
    });
  }
}

extension dado_empresaQueryWhereDistinct
    on QueryBuilder<dado_empresa, dado_empresa, QDistinct> {
  QueryBuilder<dado_empresa, dado_empresa, QDistinct> distinctByCor_fundo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cor_fundo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QDistinct> distinctById_empresa() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id_empresa');
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QDistinct> distinctById_nfce() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id_nfce');
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QDistinct> distinctByNum_caixa() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'num_caixa');
    });
  }

  QueryBuilder<dado_empresa, dado_empresa, QDistinct>
      distinctByTamanho_impressora({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tamanho_impressora',
          caseSensitive: caseSensitive);
    });
  }
}

extension dado_empresaQueryProperty
    on QueryBuilder<dado_empresa, dado_empresa, QQueryProperty> {
  QueryBuilder<dado_empresa, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<dado_empresa, String, QQueryOperations> cor_fundoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cor_fundo');
    });
  }

  QueryBuilder<dado_empresa, int?, QQueryOperations> id_empresaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id_empresa');
    });
  }

  QueryBuilder<dado_empresa, int?, QQueryOperations> id_nfceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id_nfce');
    });
  }

  QueryBuilder<dado_empresa, int?, QQueryOperations> num_caixaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'num_caixa');
    });
  }

  QueryBuilder<dado_empresa, String?, QQueryOperations>
      tamanho_impressoraProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tamanho_impressora');
    });
  }
}
