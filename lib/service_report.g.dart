// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_report.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetLocalReportCollection on Isar {
  IsarCollection<LocalReport> get localReports => this.collection();
}

const LocalReportSchema = CollectionSchema(
  name: r'LocalReport',
  id: -1051565304046961834,
  properties: {
    r'actionTaken': PropertySchema(
      id: 0,
      name: r'actionTaken',
      type: IsarType.string,
    ),
    r'completeBy': PropertySchema(
      id: 1,
      name: r'completeBy',
      type: IsarType.string,
    ),
    r'customerName': PropertySchema(
      id: 2,
      name: r'customerName',
      type: IsarType.string,
    ),
    r'customerSignatureBase64': PropertySchema(
      id: 3,
      name: r'customerSignatureBase64',
      type: IsarType.string,
    ),
    r'date': PropertySchema(
      id: 4,
      name: r'date',
      type: IsarType.string,
    ),
    r'isSynced': PropertySchema(
      id: 5,
      name: r'isSynced',
      type: IsarType.bool,
    ),
    r'machine': PropertySchema(
      id: 6,
      name: r'machine',
      type: IsarType.string,
    ),
    r'machineType': PropertySchema(
      id: 7,
      name: r'machineType',
      type: IsarType.string,
    ),
    r'meetWith': PropertySchema(
      id: 8,
      name: r'meetWith',
      type: IsarType.string,
    ),
    r'problemDescription': PropertySchema(
      id: 9,
      name: r'problemDescription',
      type: IsarType.string,
    ),
    r'savedActionBlocks': PropertySchema(
      id: 10,
      name: r'savedActionBlocks',
      type: IsarType.stringList,
    ),
    r'serialNo': PropertySchema(
      id: 11,
      name: r'serialNo',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 12,
      name: r'status',
      type: IsarType.string,
    ),
    r'technicianSignatureBase64': PropertySchema(
      id: 13,
      name: r'technicianSignatureBase64',
      type: IsarType.string,
    )
  },
  estimateSize: _localReportEstimateSize,
  serialize: _localReportSerialize,
  deserialize: _localReportDeserialize,
  deserializeProp: _localReportDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _localReportGetId,
  getLinks: _localReportGetLinks,
  attach: _localReportAttach,
  version: '3.1.0+1',
);

int _localReportEstimateSize(
  LocalReport object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.actionTaken;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.completeBy;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.customerName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.customerSignatureBase64;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.date;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.machine;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.machineType;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.meetWith;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.problemDescription;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.savedActionBlocks;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  {
    final value = object.serialNo;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.status;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.technicianSignatureBase64;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _localReportSerialize(
  LocalReport object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.actionTaken);
  writer.writeString(offsets[1], object.completeBy);
  writer.writeString(offsets[2], object.customerName);
  writer.writeString(offsets[3], object.customerSignatureBase64);
  writer.writeString(offsets[4], object.date);
  writer.writeBool(offsets[5], object.isSynced);
  writer.writeString(offsets[6], object.machine);
  writer.writeString(offsets[7], object.machineType);
  writer.writeString(offsets[8], object.meetWith);
  writer.writeString(offsets[9], object.problemDescription);
  writer.writeStringList(offsets[10], object.savedActionBlocks);
  writer.writeString(offsets[11], object.serialNo);
  writer.writeString(offsets[12], object.status);
  writer.writeString(offsets[13], object.technicianSignatureBase64);
}

LocalReport _localReportDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LocalReport();
  object.actionTaken = reader.readStringOrNull(offsets[0]);
  object.completeBy = reader.readStringOrNull(offsets[1]);
  object.customerName = reader.readStringOrNull(offsets[2]);
  object.customerSignatureBase64 = reader.readStringOrNull(offsets[3]);
  object.date = reader.readStringOrNull(offsets[4]);
  object.id = id;
  object.isSynced = reader.readBool(offsets[5]);
  object.machine = reader.readStringOrNull(offsets[6]);
  object.machineType = reader.readStringOrNull(offsets[7]);
  object.meetWith = reader.readStringOrNull(offsets[8]);
  object.problemDescription = reader.readStringOrNull(offsets[9]);
  object.savedActionBlocks = reader.readStringList(offsets[10]);
  object.serialNo = reader.readStringOrNull(offsets[11]);
  object.status = reader.readStringOrNull(offsets[12]);
  object.technicianSignatureBase64 = reader.readStringOrNull(offsets[13]);
  return object;
}

P _localReportDeserializeProp<P>(
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
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readStringList(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _localReportGetId(LocalReport object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _localReportGetLinks(LocalReport object) {
  return [];
}

void _localReportAttach(
    IsarCollection<dynamic> col, Id id, LocalReport object) {
  object.id = id;
}

extension LocalReportQueryWhereSort
    on QueryBuilder<LocalReport, LocalReport, QWhere> {
  QueryBuilder<LocalReport, LocalReport, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension LocalReportQueryWhere
    on QueryBuilder<LocalReport, LocalReport, QWhereClause> {
  QueryBuilder<LocalReport, LocalReport, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<LocalReport, LocalReport, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterWhereClause> idBetween(
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

extension LocalReportQueryFilter
    on QueryBuilder<LocalReport, LocalReport, QFilterCondition> {
  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      actionTakenIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'actionTaken',
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      actionTakenIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'actionTaken',
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      actionTakenEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'actionTaken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      actionTakenGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'actionTaken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      actionTakenLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'actionTaken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      actionTakenBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'actionTaken',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      actionTakenStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'actionTaken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      actionTakenEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'actionTaken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      actionTakenContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'actionTaken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      actionTakenMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'actionTaken',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      actionTakenIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'actionTaken',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      actionTakenIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'actionTaken',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      completeByIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'completeBy',
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      completeByIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'completeBy',
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      completeByEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'completeBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      completeByGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'completeBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      completeByLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'completeBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      completeByBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'completeBy',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      completeByStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'completeBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      completeByEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'completeBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      completeByContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'completeBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      completeByMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'completeBy',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      completeByIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'completeBy',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      completeByIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'completeBy',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      customerNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'customerName',
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      customerNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'customerName',
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      customerNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      customerNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'customerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      customerNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'customerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      customerNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'customerName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      customerNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'customerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      customerNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'customerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      customerNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'customerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      customerNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'customerName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      customerNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customerName',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      customerNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'customerName',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      customerSignatureBase64IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'customerSignatureBase64',
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      customerSignatureBase64IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'customerSignatureBase64',
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      customerSignatureBase64EqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customerSignatureBase64',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      customerSignatureBase64GreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'customerSignatureBase64',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      customerSignatureBase64LessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'customerSignatureBase64',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      customerSignatureBase64Between(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'customerSignatureBase64',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      customerSignatureBase64StartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'customerSignatureBase64',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      customerSignatureBase64EndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'customerSignatureBase64',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      customerSignatureBase64Contains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'customerSignatureBase64',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      customerSignatureBase64Matches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'customerSignatureBase64',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      customerSignatureBase64IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customerSignatureBase64',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      customerSignatureBase64IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'customerSignatureBase64',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition> dateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'date',
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      dateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'date',
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition> dateEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition> dateGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition> dateLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition> dateBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'date',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition> dateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition> dateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition> dateContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition> dateMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'date',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition> dateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      dateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'date',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition> idBetween(
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

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition> isSyncedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      machineIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'machine',
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      machineIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'machine',
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition> machineEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'machine',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      machineGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'machine',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition> machineLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'machine',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition> machineBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'machine',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      machineStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'machine',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition> machineEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'machine',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition> machineContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'machine',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition> machineMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'machine',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      machineIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'machine',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      machineIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'machine',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      machineTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'machineType',
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      machineTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'machineType',
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      machineTypeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'machineType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      machineTypeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'machineType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      machineTypeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'machineType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      machineTypeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'machineType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      machineTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'machineType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      machineTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'machineType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      machineTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'machineType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      machineTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'machineType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      machineTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'machineType',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      machineTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'machineType',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      meetWithIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'meetWith',
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      meetWithIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'meetWith',
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition> meetWithEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'meetWith',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      meetWithGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'meetWith',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      meetWithLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'meetWith',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition> meetWithBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'meetWith',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      meetWithStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'meetWith',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      meetWithEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'meetWith',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      meetWithContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'meetWith',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition> meetWithMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'meetWith',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      meetWithIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'meetWith',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      meetWithIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'meetWith',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      problemDescriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'problemDescription',
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      problemDescriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'problemDescription',
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      problemDescriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'problemDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      problemDescriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'problemDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      problemDescriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'problemDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      problemDescriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'problemDescription',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      problemDescriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'problemDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      problemDescriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'problemDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      problemDescriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'problemDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      problemDescriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'problemDescription',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      problemDescriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'problemDescription',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      problemDescriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'problemDescription',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      savedActionBlocksIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'savedActionBlocks',
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      savedActionBlocksIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'savedActionBlocks',
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      savedActionBlocksElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'savedActionBlocks',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      savedActionBlocksElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'savedActionBlocks',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      savedActionBlocksElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'savedActionBlocks',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      savedActionBlocksElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'savedActionBlocks',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      savedActionBlocksElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'savedActionBlocks',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      savedActionBlocksElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'savedActionBlocks',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      savedActionBlocksElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'savedActionBlocks',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      savedActionBlocksElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'savedActionBlocks',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      savedActionBlocksElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'savedActionBlocks',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      savedActionBlocksElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'savedActionBlocks',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      savedActionBlocksLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'savedActionBlocks',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      savedActionBlocksIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'savedActionBlocks',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      savedActionBlocksIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'savedActionBlocks',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      savedActionBlocksLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'savedActionBlocks',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      savedActionBlocksLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'savedActionBlocks',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      savedActionBlocksLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'savedActionBlocks',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      serialNoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'serialNo',
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      serialNoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'serialNo',
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition> serialNoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'serialNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      serialNoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'serialNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      serialNoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'serialNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition> serialNoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'serialNo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      serialNoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'serialNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      serialNoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'serialNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      serialNoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'serialNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition> serialNoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'serialNo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      serialNoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'serialNo',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      serialNoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'serialNo',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition> statusIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'status',
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      statusIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'status',
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition> statusEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      statusGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition> statusLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition> statusBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'status',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      statusStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition> statusEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition> statusContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition> statusMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'status',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      technicianSignatureBase64IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'technicianSignatureBase64',
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      technicianSignatureBase64IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'technicianSignatureBase64',
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      technicianSignatureBase64EqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'technicianSignatureBase64',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      technicianSignatureBase64GreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'technicianSignatureBase64',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      technicianSignatureBase64LessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'technicianSignatureBase64',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      technicianSignatureBase64Between(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'technicianSignatureBase64',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      technicianSignatureBase64StartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'technicianSignatureBase64',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      technicianSignatureBase64EndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'technicianSignatureBase64',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      technicianSignatureBase64Contains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'technicianSignatureBase64',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      technicianSignatureBase64Matches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'technicianSignatureBase64',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      technicianSignatureBase64IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'technicianSignatureBase64',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterFilterCondition>
      technicianSignatureBase64IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'technicianSignatureBase64',
        value: '',
      ));
    });
  }
}

extension LocalReportQueryObject
    on QueryBuilder<LocalReport, LocalReport, QFilterCondition> {}

extension LocalReportQueryLinks
    on QueryBuilder<LocalReport, LocalReport, QFilterCondition> {}

extension LocalReportQuerySortBy
    on QueryBuilder<LocalReport, LocalReport, QSortBy> {
  QueryBuilder<LocalReport, LocalReport, QAfterSortBy> sortByActionTaken() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actionTaken', Sort.asc);
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterSortBy> sortByActionTakenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actionTaken', Sort.desc);
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterSortBy> sortByCompleteBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completeBy', Sort.asc);
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterSortBy> sortByCompleteByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completeBy', Sort.desc);
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterSortBy> sortByCustomerName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerName', Sort.asc);
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterSortBy>
      sortByCustomerNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerName', Sort.desc);
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterSortBy>
      sortByCustomerSignatureBase64() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerSignatureBase64', Sort.asc);
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterSortBy>
      sortByCustomerSignatureBase64Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerSignatureBase64', Sort.desc);
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterSortBy> sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterSortBy> sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterSortBy> sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterSortBy> sortByMachine() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'machine', Sort.asc);
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterSortBy> sortByMachineDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'machine', Sort.desc);
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterSortBy> sortByMachineType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'machineType', Sort.asc);
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterSortBy> sortByMachineTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'machineType', Sort.desc);
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterSortBy> sortByMeetWith() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'meetWith', Sort.asc);
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterSortBy> sortByMeetWithDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'meetWith', Sort.desc);
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterSortBy>
      sortByProblemDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'problemDescription', Sort.asc);
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterSortBy>
      sortByProblemDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'problemDescription', Sort.desc);
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterSortBy> sortBySerialNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serialNo', Sort.asc);
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterSortBy> sortBySerialNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serialNo', Sort.desc);
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterSortBy>
      sortByTechnicianSignatureBase64() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'technicianSignatureBase64', Sort.asc);
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterSortBy>
      sortByTechnicianSignatureBase64Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'technicianSignatureBase64', Sort.desc);
    });
  }
}

extension LocalReportQuerySortThenBy
    on QueryBuilder<LocalReport, LocalReport, QSortThenBy> {
  QueryBuilder<LocalReport, LocalReport, QAfterSortBy> thenByActionTaken() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actionTaken', Sort.asc);
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterSortBy> thenByActionTakenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actionTaken', Sort.desc);
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterSortBy> thenByCompleteBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completeBy', Sort.asc);
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterSortBy> thenByCompleteByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completeBy', Sort.desc);
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterSortBy> thenByCustomerName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerName', Sort.asc);
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterSortBy>
      thenByCustomerNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerName', Sort.desc);
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterSortBy>
      thenByCustomerSignatureBase64() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerSignatureBase64', Sort.asc);
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterSortBy>
      thenByCustomerSignatureBase64Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerSignatureBase64', Sort.desc);
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterSortBy> thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterSortBy> thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterSortBy> thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterSortBy> thenByMachine() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'machine', Sort.asc);
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterSortBy> thenByMachineDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'machine', Sort.desc);
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterSortBy> thenByMachineType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'machineType', Sort.asc);
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterSortBy> thenByMachineTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'machineType', Sort.desc);
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterSortBy> thenByMeetWith() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'meetWith', Sort.asc);
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterSortBy> thenByMeetWithDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'meetWith', Sort.desc);
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterSortBy>
      thenByProblemDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'problemDescription', Sort.asc);
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterSortBy>
      thenByProblemDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'problemDescription', Sort.desc);
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterSortBy> thenBySerialNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serialNo', Sort.asc);
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterSortBy> thenBySerialNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serialNo', Sort.desc);
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterSortBy>
      thenByTechnicianSignatureBase64() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'technicianSignatureBase64', Sort.asc);
    });
  }

  QueryBuilder<LocalReport, LocalReport, QAfterSortBy>
      thenByTechnicianSignatureBase64Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'technicianSignatureBase64', Sort.desc);
    });
  }
}

extension LocalReportQueryWhereDistinct
    on QueryBuilder<LocalReport, LocalReport, QDistinct> {
  QueryBuilder<LocalReport, LocalReport, QDistinct> distinctByActionTaken(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'actionTaken', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalReport, LocalReport, QDistinct> distinctByCompleteBy(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'completeBy', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalReport, LocalReport, QDistinct> distinctByCustomerName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'customerName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalReport, LocalReport, QDistinct>
      distinctByCustomerSignatureBase64({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'customerSignatureBase64',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalReport, LocalReport, QDistinct> distinctByDate(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalReport, LocalReport, QDistinct> distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<LocalReport, LocalReport, QDistinct> distinctByMachine(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'machine', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalReport, LocalReport, QDistinct> distinctByMachineType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'machineType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalReport, LocalReport, QDistinct> distinctByMeetWith(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'meetWith', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalReport, LocalReport, QDistinct>
      distinctByProblemDescription({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'problemDescription',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalReport, LocalReport, QDistinct>
      distinctBySavedActionBlocks() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'savedActionBlocks');
    });
  }

  QueryBuilder<LocalReport, LocalReport, QDistinct> distinctBySerialNo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'serialNo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalReport, LocalReport, QDistinct> distinctByStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalReport, LocalReport, QDistinct>
      distinctByTechnicianSignatureBase64({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'technicianSignatureBase64',
          caseSensitive: caseSensitive);
    });
  }
}

extension LocalReportQueryProperty
    on QueryBuilder<LocalReport, LocalReport, QQueryProperty> {
  QueryBuilder<LocalReport, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<LocalReport, String?, QQueryOperations> actionTakenProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'actionTaken');
    });
  }

  QueryBuilder<LocalReport, String?, QQueryOperations> completeByProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'completeBy');
    });
  }

  QueryBuilder<LocalReport, String?, QQueryOperations> customerNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customerName');
    });
  }

  QueryBuilder<LocalReport, String?, QQueryOperations>
      customerSignatureBase64Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customerSignatureBase64');
    });
  }

  QueryBuilder<LocalReport, String?, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<LocalReport, bool, QQueryOperations> isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<LocalReport, String?, QQueryOperations> machineProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'machine');
    });
  }

  QueryBuilder<LocalReport, String?, QQueryOperations> machineTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'machineType');
    });
  }

  QueryBuilder<LocalReport, String?, QQueryOperations> meetWithProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'meetWith');
    });
  }

  QueryBuilder<LocalReport, String?, QQueryOperations>
      problemDescriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'problemDescription');
    });
  }

  QueryBuilder<LocalReport, List<String>?, QQueryOperations>
      savedActionBlocksProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'savedActionBlocks');
    });
  }

  QueryBuilder<LocalReport, String?, QQueryOperations> serialNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'serialNo');
    });
  }

  QueryBuilder<LocalReport, String?, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<LocalReport, String?, QQueryOperations>
      technicianSignatureBase64Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'technicianSignatureBase64');
    });
  }
}
