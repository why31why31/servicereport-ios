// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spare_part_draft.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSparePartDraftCollection on Isar {
  IsarCollection<SparePartDraft> get sparePartDrafts => this.collection();
}

const SparePartDraftSchema = CollectionSchema(
  name: r'SparePartDraft',
  id: 3962345481826449001,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'customer': PropertySchema(
      id: 1,
      name: r'customer',
      type: IsarType.string,
    ),
    r'customerName': PropertySchema(
      id: 2,
      name: r'customerName',
      type: IsarType.string,
    ),
    r'date': PropertySchema(
      id: 3,
      name: r'date',
      type: IsarType.string,
    ),
    r'items': PropertySchema(
      id: 4,
      name: r'items',
      type: IsarType.objectList,
      target: r'SparePartDraftItem',
    ),
    r'machine': PropertySchema(
      id: 5,
      name: r'machine',
      type: IsarType.string,
    ),
    r'machineType': PropertySchema(
      id: 6,
      name: r'machineType',
      type: IsarType.string,
    ),
    r'meetWith': PropertySchema(
      id: 7,
      name: r'meetWith',
      type: IsarType.string,
    ),
    r'notes': PropertySchema(
      id: 8,
      name: r'notes',
      type: IsarType.string,
    ),
    r'partNames': PropertySchema(
      id: 9,
      name: r'partNames',
      type: IsarType.stringList,
    ),
    r'serialNo': PropertySchema(
      id: 10,
      name: r'serialNo',
      type: IsarType.string,
    ),
    r'technician': PropertySchema(
      id: 11,
      name: r'technician',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 12,
      name: r'updatedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _sparePartDraftEstimateSize,
  serialize: _sparePartDraftSerialize,
  deserialize: _sparePartDraftDeserialize,
  deserializeProp: _sparePartDraftDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'SparePartDraftItem': SparePartDraftItemSchema},
  getId: _sparePartDraftGetId,
  getLinks: _sparePartDraftGetLinks,
  attach: _sparePartDraftAttach,
  version: '3.1.0+1',
);

int _sparePartDraftEstimateSize(
  SparePartDraft object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.customer;
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
    final value = object.date;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.items;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[SparePartDraftItem]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              SparePartDraftItemSchema.estimateSize(value, offsets, allOffsets);
        }
      }
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
    final value = object.notes;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.partNames;
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
    final value = object.technician;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _sparePartDraftSerialize(
  SparePartDraft object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeString(offsets[1], object.customer);
  writer.writeString(offsets[2], object.customerName);
  writer.writeString(offsets[3], object.date);
  writer.writeObjectList<SparePartDraftItem>(
    offsets[4],
    allOffsets,
    SparePartDraftItemSchema.serialize,
    object.items,
  );
  writer.writeString(offsets[5], object.machine);
  writer.writeString(offsets[6], object.machineType);
  writer.writeString(offsets[7], object.meetWith);
  writer.writeString(offsets[8], object.notes);
  writer.writeStringList(offsets[9], object.partNames);
  writer.writeString(offsets[10], object.serialNo);
  writer.writeString(offsets[11], object.technician);
  writer.writeDateTime(offsets[12], object.updatedAt);
}

SparePartDraft _sparePartDraftDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SparePartDraft();
  object.createdAt = reader.readDateTime(offsets[0]);
  object.customer = reader.readStringOrNull(offsets[1]);
  object.date = reader.readStringOrNull(offsets[3]);
  object.id = id;
  object.items = reader.readObjectList<SparePartDraftItem>(
    offsets[4],
    SparePartDraftItemSchema.deserialize,
    allOffsets,
    SparePartDraftItem(),
  );
  object.machine = reader.readStringOrNull(offsets[5]);
  object.machineType = reader.readStringOrNull(offsets[6]);
  object.meetWith = reader.readStringOrNull(offsets[7]);
  object.notes = reader.readStringOrNull(offsets[8]);
  object.serialNo = reader.readStringOrNull(offsets[10]);
  object.technician = reader.readStringOrNull(offsets[11]);
  object.updatedAt = reader.readDateTime(offsets[12]);
  return object;
}

P _sparePartDraftDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readObjectList<SparePartDraftItem>(
        offset,
        SparePartDraftItemSchema.deserialize,
        allOffsets,
        SparePartDraftItem(),
      )) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readStringList(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _sparePartDraftGetId(SparePartDraft object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _sparePartDraftGetLinks(SparePartDraft object) {
  return [];
}

void _sparePartDraftAttach(
    IsarCollection<dynamic> col, Id id, SparePartDraft object) {
  object.id = id;
}

extension SparePartDraftQueryWhereSort
    on QueryBuilder<SparePartDraft, SparePartDraft, QWhere> {
  QueryBuilder<SparePartDraft, SparePartDraft, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SparePartDraftQueryWhere
    on QueryBuilder<SparePartDraft, SparePartDraft, QWhereClause> {
  QueryBuilder<SparePartDraft, SparePartDraft, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterWhereClause> idBetween(
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

extension SparePartDraftQueryFilter
    on QueryBuilder<SparePartDraft, SparePartDraft, QFilterCondition> {
  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      customerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'customer',
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      customerIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'customer',
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      customerEqualTo(
    String? value, {
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

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      customerGreaterThan(
    String? value, {
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

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      customerLessThan(
    String? value, {
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

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      customerBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
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

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
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

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      customerContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'customer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      customerMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'customer',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      customerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customer',
        value: '',
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      customerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'customer',
        value: '',
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      customerNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'customerName',
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      customerNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'customerName',
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
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

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
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

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
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

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
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

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
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

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
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

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      customerNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'customerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      customerNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'customerName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      customerNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customerName',
        value: '',
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      customerNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'customerName',
        value: '',
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      dateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'date',
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      dateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'date',
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      dateEqualTo(
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

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      dateGreaterThan(
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

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      dateLessThan(
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

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      dateBetween(
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

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
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

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
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

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      dateContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      dateMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'date',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      dateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: '',
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      dateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'date',
        value: '',
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
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

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition> idBetween(
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

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      itemsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'items',
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      itemsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'items',
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      itemsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'items',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      itemsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'items',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      itemsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'items',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      itemsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'items',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      itemsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'items',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      itemsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'items',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      machineIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'machine',
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      machineIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'machine',
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      machineEqualTo(
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

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
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

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      machineLessThan(
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

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      machineBetween(
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

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
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

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
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

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      machineContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'machine',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      machineMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'machine',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      machineIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'machine',
        value: '',
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      machineIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'machine',
        value: '',
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      machineTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'machineType',
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      machineTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'machineType',
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
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

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
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

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
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

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
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

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
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

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
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

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      machineTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'machineType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      machineTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'machineType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      machineTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'machineType',
        value: '',
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      machineTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'machineType',
        value: '',
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      meetWithIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'meetWith',
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      meetWithIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'meetWith',
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      meetWithEqualTo(
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

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
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

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
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

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      meetWithBetween(
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

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
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

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
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

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      meetWithContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'meetWith',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      meetWithMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'meetWith',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      meetWithIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'meetWith',
        value: '',
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      meetWithIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'meetWith',
        value: '',
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      notesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      notesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      notesEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      notesGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      notesLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      notesBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'notes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      notesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      notesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      notesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      notesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'notes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      partNamesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'partNames',
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      partNamesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'partNames',
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      partNamesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'partNames',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      partNamesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'partNames',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      partNamesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'partNames',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      partNamesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'partNames',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      partNamesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'partNames',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      partNamesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'partNames',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      partNamesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'partNames',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      partNamesElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'partNames',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      partNamesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'partNames',
        value: '',
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      partNamesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'partNames',
        value: '',
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      partNamesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'partNames',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      partNamesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'partNames',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      partNamesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'partNames',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      partNamesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'partNames',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      partNamesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'partNames',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      partNamesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'partNames',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      serialNoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'serialNo',
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      serialNoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'serialNo',
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      serialNoEqualTo(
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

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
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

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
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

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      serialNoBetween(
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

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
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

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
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

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      serialNoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'serialNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      serialNoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'serialNo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      serialNoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'serialNo',
        value: '',
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      serialNoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'serialNo',
        value: '',
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      technicianIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'technician',
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      technicianIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'technician',
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      technicianEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'technician',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      technicianGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'technician',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      technicianLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'technician',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      technicianBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'technician',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      technicianStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'technician',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      technicianEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'technician',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      technicianContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'technician',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      technicianMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'technician',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      technicianIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'technician',
        value: '',
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      technicianIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'technician',
        value: '',
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      updatedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      updatedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      updatedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updatedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SparePartDraftQueryObject
    on QueryBuilder<SparePartDraft, SparePartDraft, QFilterCondition> {
  QueryBuilder<SparePartDraft, SparePartDraft, QAfterFilterCondition>
      itemsElement(FilterQuery<SparePartDraftItem> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'items');
    });
  }
}

extension SparePartDraftQueryLinks
    on QueryBuilder<SparePartDraft, SparePartDraft, QFilterCondition> {}

extension SparePartDraftQuerySortBy
    on QueryBuilder<SparePartDraft, SparePartDraft, QSortBy> {
  QueryBuilder<SparePartDraft, SparePartDraft, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterSortBy> sortByCustomer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customer', Sort.asc);
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterSortBy>
      sortByCustomerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customer', Sort.desc);
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterSortBy>
      sortByCustomerName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerName', Sort.asc);
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterSortBy>
      sortByCustomerNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerName', Sort.desc);
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterSortBy> sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterSortBy> sortByMachine() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'machine', Sort.asc);
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterSortBy>
      sortByMachineDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'machine', Sort.desc);
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterSortBy>
      sortByMachineType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'machineType', Sort.asc);
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterSortBy>
      sortByMachineTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'machineType', Sort.desc);
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterSortBy> sortByMeetWith() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'meetWith', Sort.asc);
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterSortBy>
      sortByMeetWithDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'meetWith', Sort.desc);
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterSortBy> sortByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterSortBy> sortByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterSortBy> sortBySerialNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serialNo', Sort.asc);
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterSortBy>
      sortBySerialNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serialNo', Sort.desc);
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterSortBy>
      sortByTechnician() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'technician', Sort.asc);
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterSortBy>
      sortByTechnicianDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'technician', Sort.desc);
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension SparePartDraftQuerySortThenBy
    on QueryBuilder<SparePartDraft, SparePartDraft, QSortThenBy> {
  QueryBuilder<SparePartDraft, SparePartDraft, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterSortBy> thenByCustomer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customer', Sort.asc);
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterSortBy>
      thenByCustomerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customer', Sort.desc);
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterSortBy>
      thenByCustomerName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerName', Sort.asc);
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterSortBy>
      thenByCustomerNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerName', Sort.desc);
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterSortBy> thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterSortBy> thenByMachine() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'machine', Sort.asc);
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterSortBy>
      thenByMachineDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'machine', Sort.desc);
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterSortBy>
      thenByMachineType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'machineType', Sort.asc);
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterSortBy>
      thenByMachineTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'machineType', Sort.desc);
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterSortBy> thenByMeetWith() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'meetWith', Sort.asc);
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterSortBy>
      thenByMeetWithDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'meetWith', Sort.desc);
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterSortBy> thenByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterSortBy> thenByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterSortBy> thenBySerialNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serialNo', Sort.asc);
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterSortBy>
      thenBySerialNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serialNo', Sort.desc);
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterSortBy>
      thenByTechnician() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'technician', Sort.asc);
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterSortBy>
      thenByTechnicianDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'technician', Sort.desc);
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension SparePartDraftQueryWhereDistinct
    on QueryBuilder<SparePartDraft, SparePartDraft, QDistinct> {
  QueryBuilder<SparePartDraft, SparePartDraft, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QDistinct> distinctByCustomer(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'customer', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QDistinct>
      distinctByCustomerName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'customerName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QDistinct> distinctByDate(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QDistinct> distinctByMachine(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'machine', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QDistinct> distinctByMachineType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'machineType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QDistinct> distinctByMeetWith(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'meetWith', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QDistinct> distinctByNotes(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notes', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QDistinct>
      distinctByPartNames() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'partNames');
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QDistinct> distinctBySerialNo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'serialNo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QDistinct> distinctByTechnician(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'technician', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SparePartDraft, SparePartDraft, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension SparePartDraftQueryProperty
    on QueryBuilder<SparePartDraft, SparePartDraft, QQueryProperty> {
  QueryBuilder<SparePartDraft, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SparePartDraft, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<SparePartDraft, String?, QQueryOperations> customerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customer');
    });
  }

  QueryBuilder<SparePartDraft, String?, QQueryOperations>
      customerNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customerName');
    });
  }

  QueryBuilder<SparePartDraft, String?, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<SparePartDraft, List<SparePartDraftItem>?, QQueryOperations>
      itemsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'items');
    });
  }

  QueryBuilder<SparePartDraft, String?, QQueryOperations> machineProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'machine');
    });
  }

  QueryBuilder<SparePartDraft, String?, QQueryOperations>
      machineTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'machineType');
    });
  }

  QueryBuilder<SparePartDraft, String?, QQueryOperations> meetWithProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'meetWith');
    });
  }

  QueryBuilder<SparePartDraft, String?, QQueryOperations> notesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notes');
    });
  }

  QueryBuilder<SparePartDraft, List<String>?, QQueryOperations>
      partNamesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'partNames');
    });
  }

  QueryBuilder<SparePartDraft, String?, QQueryOperations> serialNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'serialNo');
    });
  }

  QueryBuilder<SparePartDraft, String?, QQueryOperations> technicianProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'technician');
    });
  }

  QueryBuilder<SparePartDraft, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const SparePartDraftItemSchema = Schema(
  name: r'SparePartDraftItem',
  id: 1306144541931097640,
  properties: {
    r'imagePath': PropertySchema(
      id: 0,
      name: r'imagePath',
      type: IsarType.string,
    ),
    r'partName': PropertySchema(
      id: 1,
      name: r'partName',
      type: IsarType.string,
    ),
    r'partNumber': PropertySchema(
      id: 2,
      name: r'partNumber',
      type: IsarType.string,
    ),
    r'qty': PropertySchema(
      id: 3,
      name: r'qty',
      type: IsarType.string,
    ),
    r'remark': PropertySchema(
      id: 4,
      name: r'remark',
      type: IsarType.string,
    )
  },
  estimateSize: _sparePartDraftItemEstimateSize,
  serialize: _sparePartDraftItemSerialize,
  deserialize: _sparePartDraftItemDeserialize,
  deserializeProp: _sparePartDraftItemDeserializeProp,
);

int _sparePartDraftItemEstimateSize(
  SparePartDraftItem object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.imagePath;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.partName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.partNumber;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.qty;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.remark;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _sparePartDraftItemSerialize(
  SparePartDraftItem object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.imagePath);
  writer.writeString(offsets[1], object.partName);
  writer.writeString(offsets[2], object.partNumber);
  writer.writeString(offsets[3], object.qty);
  writer.writeString(offsets[4], object.remark);
}

SparePartDraftItem _sparePartDraftItemDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SparePartDraftItem();
  object.imagePath = reader.readStringOrNull(offsets[0]);
  object.partName = reader.readStringOrNull(offsets[1]);
  object.partNumber = reader.readStringOrNull(offsets[2]);
  object.qty = reader.readStringOrNull(offsets[3]);
  object.remark = reader.readStringOrNull(offsets[4]);
  return object;
}

P _sparePartDraftItemDeserializeProp<P>(
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
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension SparePartDraftItemQueryFilter
    on QueryBuilder<SparePartDraftItem, SparePartDraftItem, QFilterCondition> {
  QueryBuilder<SparePartDraftItem, SparePartDraftItem, QAfterFilterCondition>
      imagePathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'imagePath',
      ));
    });
  }

  QueryBuilder<SparePartDraftItem, SparePartDraftItem, QAfterFilterCondition>
      imagePathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'imagePath',
      ));
    });
  }

  QueryBuilder<SparePartDraftItem, SparePartDraftItem, QAfterFilterCondition>
      imagePathEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SparePartDraftItem, SparePartDraftItem, QAfterFilterCondition>
      imagePathGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'imagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SparePartDraftItem, SparePartDraftItem, QAfterFilterCondition>
      imagePathLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'imagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SparePartDraftItem, SparePartDraftItem, QAfterFilterCondition>
      imagePathBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'imagePath',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SparePartDraftItem, SparePartDraftItem, QAfterFilterCondition>
      imagePathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'imagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SparePartDraftItem, SparePartDraftItem, QAfterFilterCondition>
      imagePathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'imagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SparePartDraftItem, SparePartDraftItem, QAfterFilterCondition>
      imagePathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'imagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SparePartDraftItem, SparePartDraftItem, QAfterFilterCondition>
      imagePathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'imagePath',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SparePartDraftItem, SparePartDraftItem, QAfterFilterCondition>
      imagePathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imagePath',
        value: '',
      ));
    });
  }

  QueryBuilder<SparePartDraftItem, SparePartDraftItem, QAfterFilterCondition>
      imagePathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'imagePath',
        value: '',
      ));
    });
  }

  QueryBuilder<SparePartDraftItem, SparePartDraftItem, QAfterFilterCondition>
      partNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'partName',
      ));
    });
  }

  QueryBuilder<SparePartDraftItem, SparePartDraftItem, QAfterFilterCondition>
      partNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'partName',
      ));
    });
  }

  QueryBuilder<SparePartDraftItem, SparePartDraftItem, QAfterFilterCondition>
      partNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'partName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SparePartDraftItem, SparePartDraftItem, QAfterFilterCondition>
      partNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'partName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SparePartDraftItem, SparePartDraftItem, QAfterFilterCondition>
      partNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'partName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SparePartDraftItem, SparePartDraftItem, QAfterFilterCondition>
      partNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'partName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SparePartDraftItem, SparePartDraftItem, QAfterFilterCondition>
      partNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'partName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SparePartDraftItem, SparePartDraftItem, QAfterFilterCondition>
      partNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'partName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SparePartDraftItem, SparePartDraftItem, QAfterFilterCondition>
      partNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'partName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SparePartDraftItem, SparePartDraftItem, QAfterFilterCondition>
      partNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'partName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SparePartDraftItem, SparePartDraftItem, QAfterFilterCondition>
      partNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'partName',
        value: '',
      ));
    });
  }

  QueryBuilder<SparePartDraftItem, SparePartDraftItem, QAfterFilterCondition>
      partNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'partName',
        value: '',
      ));
    });
  }

  QueryBuilder<SparePartDraftItem, SparePartDraftItem, QAfterFilterCondition>
      partNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'partNumber',
      ));
    });
  }

  QueryBuilder<SparePartDraftItem, SparePartDraftItem, QAfterFilterCondition>
      partNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'partNumber',
      ));
    });
  }

  QueryBuilder<SparePartDraftItem, SparePartDraftItem, QAfterFilterCondition>
      partNumberEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'partNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SparePartDraftItem, SparePartDraftItem, QAfterFilterCondition>
      partNumberGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'partNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SparePartDraftItem, SparePartDraftItem, QAfterFilterCondition>
      partNumberLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'partNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SparePartDraftItem, SparePartDraftItem, QAfterFilterCondition>
      partNumberBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'partNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SparePartDraftItem, SparePartDraftItem, QAfterFilterCondition>
      partNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'partNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SparePartDraftItem, SparePartDraftItem, QAfterFilterCondition>
      partNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'partNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SparePartDraftItem, SparePartDraftItem, QAfterFilterCondition>
      partNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'partNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SparePartDraftItem, SparePartDraftItem, QAfterFilterCondition>
      partNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'partNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SparePartDraftItem, SparePartDraftItem, QAfterFilterCondition>
      partNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'partNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<SparePartDraftItem, SparePartDraftItem, QAfterFilterCondition>
      partNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'partNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<SparePartDraftItem, SparePartDraftItem, QAfterFilterCondition>
      qtyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'qty',
      ));
    });
  }

  QueryBuilder<SparePartDraftItem, SparePartDraftItem, QAfterFilterCondition>
      qtyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'qty',
      ));
    });
  }

  QueryBuilder<SparePartDraftItem, SparePartDraftItem, QAfterFilterCondition>
      qtyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'qty',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SparePartDraftItem, SparePartDraftItem, QAfterFilterCondition>
      qtyGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'qty',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SparePartDraftItem, SparePartDraftItem, QAfterFilterCondition>
      qtyLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'qty',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SparePartDraftItem, SparePartDraftItem, QAfterFilterCondition>
      qtyBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'qty',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SparePartDraftItem, SparePartDraftItem, QAfterFilterCondition>
      qtyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'qty',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SparePartDraftItem, SparePartDraftItem, QAfterFilterCondition>
      qtyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'qty',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SparePartDraftItem, SparePartDraftItem, QAfterFilterCondition>
      qtyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'qty',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SparePartDraftItem, SparePartDraftItem, QAfterFilterCondition>
      qtyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'qty',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SparePartDraftItem, SparePartDraftItem, QAfterFilterCondition>
      qtyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'qty',
        value: '',
      ));
    });
  }

  QueryBuilder<SparePartDraftItem, SparePartDraftItem, QAfterFilterCondition>
      qtyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'qty',
        value: '',
      ));
    });
  }

  QueryBuilder<SparePartDraftItem, SparePartDraftItem, QAfterFilterCondition>
      remarkIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'remark',
      ));
    });
  }

  QueryBuilder<SparePartDraftItem, SparePartDraftItem, QAfterFilterCondition>
      remarkIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'remark',
      ));
    });
  }

  QueryBuilder<SparePartDraftItem, SparePartDraftItem, QAfterFilterCondition>
      remarkEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remark',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SparePartDraftItem, SparePartDraftItem, QAfterFilterCondition>
      remarkGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'remark',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SparePartDraftItem, SparePartDraftItem, QAfterFilterCondition>
      remarkLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'remark',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SparePartDraftItem, SparePartDraftItem, QAfterFilterCondition>
      remarkBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'remark',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SparePartDraftItem, SparePartDraftItem, QAfterFilterCondition>
      remarkStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'remark',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SparePartDraftItem, SparePartDraftItem, QAfterFilterCondition>
      remarkEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'remark',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SparePartDraftItem, SparePartDraftItem, QAfterFilterCondition>
      remarkContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'remark',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SparePartDraftItem, SparePartDraftItem, QAfterFilterCondition>
      remarkMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'remark',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SparePartDraftItem, SparePartDraftItem, QAfterFilterCondition>
      remarkIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remark',
        value: '',
      ));
    });
  }

  QueryBuilder<SparePartDraftItem, SparePartDraftItem, QAfterFilterCondition>
      remarkIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'remark',
        value: '',
      ));
    });
  }
}

extension SparePartDraftItemQueryObject
    on QueryBuilder<SparePartDraftItem, SparePartDraftItem, QFilterCondition> {}
