// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetServiceReportCollection on Isar {
  IsarCollection<ServiceReport> get serviceReports => this.collection();
}

const ServiceReportSchema = CollectionSchema(
  name: r'ServiceReport',
  id: 3298408734959652195,
  properties: {
    r'completeBy': PropertySchema(
      id: 0,
      name: r'completeBy',
      type: IsarType.string,
    ),
    r'customer': PropertySchema(
      id: 1,
      name: r'customer',
      type: IsarType.string,
    ),
    r'customerSignature': PropertySchema(
      id: 2,
      name: r'customerSignature',
      type: IsarType.longList,
    ),
    r'date': PropertySchema(
      id: 3,
      name: r'date',
      type: IsarType.string,
    ),
    r'machine': PropertySchema(
      id: 4,
      name: r'machine',
      type: IsarType.string,
    ),
    r'meetWith': PropertySchema(
      id: 5,
      name: r'meetWith',
      type: IsarType.string,
    ),
    r'serialNo': PropertySchema(
      id: 6,
      name: r'serialNo',
      type: IsarType.string,
    ),
    r'technicianSignature': PropertySchema(
      id: 7,
      name: r'technicianSignature',
      type: IsarType.longList,
    ),
    r'type': PropertySchema(
      id: 8,
      name: r'type',
      type: IsarType.string,
    )
  },
  estimateSize: _serviceReportEstimateSize,
  serialize: _serviceReportSerialize,
  deserialize: _serviceReportDeserialize,
  deserializeProp: _serviceReportDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _serviceReportGetId,
  getLinks: _serviceReportGetLinks,
  attach: _serviceReportAttach,
  version: '3.1.0+1',
);

int _serviceReportEstimateSize(
  ServiceReport object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.completeBy.length * 3;
  bytesCount += 3 + object.customer.length * 3;
  bytesCount += 3 + object.customerSignature.length * 8;
  bytesCount += 3 + object.date.length * 3;
  bytesCount += 3 + object.machine.length * 3;
  bytesCount += 3 + object.meetWith.length * 3;
  bytesCount += 3 + object.serialNo.length * 3;
  bytesCount += 3 + object.technicianSignature.length * 8;
  bytesCount += 3 + object.type.length * 3;
  return bytesCount;
}

void _serviceReportSerialize(
  ServiceReport object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.completeBy);
  writer.writeString(offsets[1], object.customer);
  writer.writeLongList(offsets[2], object.customerSignature);
  writer.writeString(offsets[3], object.date);
  writer.writeString(offsets[4], object.machine);
  writer.writeString(offsets[5], object.meetWith);
  writer.writeString(offsets[6], object.serialNo);
  writer.writeLongList(offsets[7], object.technicianSignature);
  writer.writeString(offsets[8], object.type);
}

ServiceReport _serviceReportDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ServiceReport();
  object.completeBy = reader.readString(offsets[0]);
  object.customer = reader.readString(offsets[1]);
  object.customerSignature = reader.readLongList(offsets[2]) ?? [];
  object.date = reader.readString(offsets[3]);
  object.id = id;
  object.machine = reader.readString(offsets[4]);
  object.meetWith = reader.readString(offsets[5]);
  object.serialNo = reader.readString(offsets[6]);
  object.technicianSignature = reader.readLongList(offsets[7]) ?? [];
  object.type = reader.readString(offsets[8]);
  return object;
}

P _serviceReportDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readLongList(offset) ?? []) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readLongList(offset) ?? []) as P;
    case 8:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _serviceReportGetId(ServiceReport object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _serviceReportGetLinks(ServiceReport object) {
  return [];
}

void _serviceReportAttach(
    IsarCollection<dynamic> col, Id id, ServiceReport object) {
  object.id = id;
}

extension ServiceReportQueryWhereSort
    on QueryBuilder<ServiceReport, ServiceReport, QWhere> {
  QueryBuilder<ServiceReport, ServiceReport, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ServiceReportQueryWhere
    on QueryBuilder<ServiceReport, ServiceReport, QWhereClause> {
  QueryBuilder<ServiceReport, ServiceReport, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<ServiceReport, ServiceReport, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterWhereClause> idBetween(
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

extension ServiceReportQueryFilter
    on QueryBuilder<ServiceReport, ServiceReport, QFilterCondition> {
  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
      completeByEqualTo(
    String value, {
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

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
      completeByGreaterThan(
    String value, {
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

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
      completeByLessThan(
    String value, {
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

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
      completeByBetween(
    String lower,
    String upper, {
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

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
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

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
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

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
      completeByContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'completeBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
      completeByMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'completeBy',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
      completeByIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'completeBy',
        value: '',
      ));
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
      completeByIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'completeBy',
        value: '',
      ));
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
      customerEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
      customerGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'customer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
      customerLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'customer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
      customerBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'customer',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
      customerStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'customer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
      customerEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'customer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
      customerContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'customer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
      customerMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'customer',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
      customerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customer',
        value: '',
      ));
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
      customerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'customer',
        value: '',
      ));
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
      customerSignatureElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customerSignature',
        value: value,
      ));
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
      customerSignatureElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'customerSignature',
        value: value,
      ));
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
      customerSignatureElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'customerSignature',
        value: value,
      ));
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
      customerSignatureElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'customerSignature',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
      customerSignatureLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'customerSignature',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
      customerSignatureIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'customerSignature',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
      customerSignatureIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'customerSignature',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
      customerSignatureLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'customerSignature',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
      customerSignatureLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'customerSignature',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
      customerSignatureLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'customerSignature',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition> dateEqualTo(
    String value, {
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

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
      dateGreaterThan(
    String value, {
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

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
      dateLessThan(
    String value, {
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

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition> dateBetween(
    String lower,
    String upper, {
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

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
      dateStartsWith(
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

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
      dateEndsWith(
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

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
      dateContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition> dateMatches(
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

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
      dateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: '',
      ));
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
      dateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'date',
        value: '',
      ));
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition> idBetween(
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

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
      machineEqualTo(
    String value, {
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

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
      machineGreaterThan(
    String value, {
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

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
      machineLessThan(
    String value, {
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

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
      machineBetween(
    String lower,
    String upper, {
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

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
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

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
      machineEndsWith(
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

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
      machineContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'machine',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
      machineMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'machine',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
      machineIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'machine',
        value: '',
      ));
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
      machineIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'machine',
        value: '',
      ));
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
      meetWithEqualTo(
    String value, {
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

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
      meetWithGreaterThan(
    String value, {
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

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
      meetWithLessThan(
    String value, {
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

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
      meetWithBetween(
    String lower,
    String upper, {
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

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
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

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
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

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
      meetWithContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'meetWith',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
      meetWithMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'meetWith',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
      meetWithIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'meetWith',
        value: '',
      ));
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
      meetWithIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'meetWith',
        value: '',
      ));
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
      serialNoEqualTo(
    String value, {
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

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
      serialNoGreaterThan(
    String value, {
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

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
      serialNoLessThan(
    String value, {
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

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
      serialNoBetween(
    String lower,
    String upper, {
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

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
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

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
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

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
      serialNoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'serialNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
      serialNoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'serialNo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
      serialNoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'serialNo',
        value: '',
      ));
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
      serialNoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'serialNo',
        value: '',
      ));
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
      technicianSignatureElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'technicianSignature',
        value: value,
      ));
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
      technicianSignatureElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'technicianSignature',
        value: value,
      ));
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
      technicianSignatureElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'technicianSignature',
        value: value,
      ));
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
      technicianSignatureElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'technicianSignature',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
      technicianSignatureLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'technicianSignature',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
      technicianSignatureIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'technicianSignature',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
      technicianSignatureIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'technicianSignature',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
      technicianSignatureLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'technicianSignature',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
      technicianSignatureLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'technicianSignature',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
      technicianSignatureLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'technicianSignature',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition> typeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
      typeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
      typeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition> typeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
      typeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
      typeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
      typeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition> typeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'type',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
      typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterFilterCondition>
      typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'type',
        value: '',
      ));
    });
  }
}

extension ServiceReportQueryObject
    on QueryBuilder<ServiceReport, ServiceReport, QFilterCondition> {}

extension ServiceReportQueryLinks
    on QueryBuilder<ServiceReport, ServiceReport, QFilterCondition> {}

extension ServiceReportQuerySortBy
    on QueryBuilder<ServiceReport, ServiceReport, QSortBy> {
  QueryBuilder<ServiceReport, ServiceReport, QAfterSortBy> sortByCompleteBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completeBy', Sort.asc);
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterSortBy>
      sortByCompleteByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completeBy', Sort.desc);
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterSortBy> sortByCustomer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customer', Sort.asc);
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterSortBy>
      sortByCustomerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customer', Sort.desc);
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterSortBy> sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterSortBy> sortByMachine() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'machine', Sort.asc);
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterSortBy> sortByMachineDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'machine', Sort.desc);
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterSortBy> sortByMeetWith() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'meetWith', Sort.asc);
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterSortBy>
      sortByMeetWithDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'meetWith', Sort.desc);
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterSortBy> sortBySerialNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serialNo', Sort.asc);
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterSortBy>
      sortBySerialNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serialNo', Sort.desc);
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterSortBy> sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterSortBy> sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension ServiceReportQuerySortThenBy
    on QueryBuilder<ServiceReport, ServiceReport, QSortThenBy> {
  QueryBuilder<ServiceReport, ServiceReport, QAfterSortBy> thenByCompleteBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completeBy', Sort.asc);
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterSortBy>
      thenByCompleteByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completeBy', Sort.desc);
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterSortBy> thenByCustomer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customer', Sort.asc);
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterSortBy>
      thenByCustomerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customer', Sort.desc);
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterSortBy> thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterSortBy> thenByMachine() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'machine', Sort.asc);
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterSortBy> thenByMachineDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'machine', Sort.desc);
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterSortBy> thenByMeetWith() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'meetWith', Sort.asc);
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterSortBy>
      thenByMeetWithDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'meetWith', Sort.desc);
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterSortBy> thenBySerialNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serialNo', Sort.asc);
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterSortBy>
      thenBySerialNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serialNo', Sort.desc);
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterSortBy> thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QAfterSortBy> thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension ServiceReportQueryWhereDistinct
    on QueryBuilder<ServiceReport, ServiceReport, QDistinct> {
  QueryBuilder<ServiceReport, ServiceReport, QDistinct> distinctByCompleteBy(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'completeBy', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QDistinct> distinctByCustomer(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'customer', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QDistinct>
      distinctByCustomerSignature() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'customerSignature');
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QDistinct> distinctByDate(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QDistinct> distinctByMachine(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'machine', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QDistinct> distinctByMeetWith(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'meetWith', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QDistinct> distinctBySerialNo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'serialNo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QDistinct>
      distinctByTechnicianSignature() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'technicianSignature');
    });
  }

  QueryBuilder<ServiceReport, ServiceReport, QDistinct> distinctByType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type', caseSensitive: caseSensitive);
    });
  }
}

extension ServiceReportQueryProperty
    on QueryBuilder<ServiceReport, ServiceReport, QQueryProperty> {
  QueryBuilder<ServiceReport, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ServiceReport, String, QQueryOperations> completeByProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'completeBy');
    });
  }

  QueryBuilder<ServiceReport, String, QQueryOperations> customerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customer');
    });
  }

  QueryBuilder<ServiceReport, List<int>, QQueryOperations>
      customerSignatureProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customerSignature');
    });
  }

  QueryBuilder<ServiceReport, String, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<ServiceReport, String, QQueryOperations> machineProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'machine');
    });
  }

  QueryBuilder<ServiceReport, String, QQueryOperations> meetWithProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'meetWith');
    });
  }

  QueryBuilder<ServiceReport, String, QQueryOperations> serialNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'serialNo');
    });
  }

  QueryBuilder<ServiceReport, List<int>, QQueryOperations>
      technicianSignatureProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'technicianSignature');
    });
  }

  QueryBuilder<ServiceReport, String, QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }
}
