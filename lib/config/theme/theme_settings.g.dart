// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_settings.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetThemeSettingsCollection on Isar {
  IsarCollection<ThemeSettings> get themeSettings => this.collection();
}

const ThemeSettingsSchema = CollectionSchema(
  name: r'ThemeSettings',
  id: 815540309993789807,
  properties: {
    r'primaryColorHex': PropertySchema(
      id: 0,
      name: r'primaryColorHex',
      type: IsarType.string,
    ),
    r'themeMode': PropertySchema(
      id: 1,
      name: r'themeMode',
      type: IsarType.byte,
      enumMap: _ThemeSettingsthemeModeEnumValueMap,
    ),
    r'useDynamicColors': PropertySchema(
      id: 2,
      name: r'useDynamicColors',
      type: IsarType.bool,
    )
  },
  estimateSize: _themeSettingsEstimateSize,
  serialize: _themeSettingsSerialize,
  deserialize: _themeSettingsDeserialize,
  deserializeProp: _themeSettingsDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _themeSettingsGetId,
  getLinks: _themeSettingsGetLinks,
  attach: _themeSettingsAttach,
  version: '3.1.0+1',
);

int _themeSettingsEstimateSize(
  ThemeSettings object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.primaryColorHex.length * 3;
  return bytesCount;
}

void _themeSettingsSerialize(
  ThemeSettings object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.primaryColorHex);
  writer.writeByte(offsets[1], object.themeMode.index);
  writer.writeBool(offsets[2], object.useDynamicColors);
}

ThemeSettings _themeSettingsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ThemeSettings();
  object.id = id;
  object.primaryColorHex = reader.readString(offsets[0]);
  object.themeMode =
      _ThemeSettingsthemeModeValueEnumMap[reader.readByteOrNull(offsets[1])] ??
          AppThemeMode.light;
  object.useDynamicColors = reader.readBool(offsets[2]);
  return object;
}

P _themeSettingsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (_ThemeSettingsthemeModeValueEnumMap[
              reader.readByteOrNull(offset)] ??
          AppThemeMode.light) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _ThemeSettingsthemeModeEnumValueMap = {
  'light': 0,
  'dark': 1,
  'system': 2,
};
const _ThemeSettingsthemeModeValueEnumMap = {
  0: AppThemeMode.light,
  1: AppThemeMode.dark,
  2: AppThemeMode.system,
};

Id _themeSettingsGetId(ThemeSettings object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _themeSettingsGetLinks(ThemeSettings object) {
  return [];
}

void _themeSettingsAttach(
    IsarCollection<dynamic> col, Id id, ThemeSettings object) {
  object.id = id;
}

extension ThemeSettingsQueryWhereSort
    on QueryBuilder<ThemeSettings, ThemeSettings, QWhere> {
  QueryBuilder<ThemeSettings, ThemeSettings, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ThemeSettingsQueryWhere
    on QueryBuilder<ThemeSettings, ThemeSettings, QWhereClause> {
  QueryBuilder<ThemeSettings, ThemeSettings, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ThemeSettings, ThemeSettings, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<ThemeSettings, ThemeSettings, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ThemeSettings, ThemeSettings, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ThemeSettings, ThemeSettings, QAfterWhereClause> idBetween(
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

extension ThemeSettingsQueryFilter
    on QueryBuilder<ThemeSettings, ThemeSettings, QFilterCondition> {
  QueryBuilder<ThemeSettings, ThemeSettings, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ThemeSettings, ThemeSettings, QAfterFilterCondition>
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

  QueryBuilder<ThemeSettings, ThemeSettings, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<ThemeSettings, ThemeSettings, QAfterFilterCondition> idBetween(
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

  QueryBuilder<ThemeSettings, ThemeSettings, QAfterFilterCondition>
      primaryColorHexEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'primaryColorHex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ThemeSettings, ThemeSettings, QAfterFilterCondition>
      primaryColorHexGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'primaryColorHex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ThemeSettings, ThemeSettings, QAfterFilterCondition>
      primaryColorHexLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'primaryColorHex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ThemeSettings, ThemeSettings, QAfterFilterCondition>
      primaryColorHexBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'primaryColorHex',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ThemeSettings, ThemeSettings, QAfterFilterCondition>
      primaryColorHexStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'primaryColorHex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ThemeSettings, ThemeSettings, QAfterFilterCondition>
      primaryColorHexEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'primaryColorHex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ThemeSettings, ThemeSettings, QAfterFilterCondition>
      primaryColorHexContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'primaryColorHex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ThemeSettings, ThemeSettings, QAfterFilterCondition>
      primaryColorHexMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'primaryColorHex',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ThemeSettings, ThemeSettings, QAfterFilterCondition>
      primaryColorHexIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'primaryColorHex',
        value: '',
      ));
    });
  }

  QueryBuilder<ThemeSettings, ThemeSettings, QAfterFilterCondition>
      primaryColorHexIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'primaryColorHex',
        value: '',
      ));
    });
  }

  QueryBuilder<ThemeSettings, ThemeSettings, QAfterFilterCondition>
      themeModeEqualTo(AppThemeMode value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'themeMode',
        value: value,
      ));
    });
  }

  QueryBuilder<ThemeSettings, ThemeSettings, QAfterFilterCondition>
      themeModeGreaterThan(
    AppThemeMode value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'themeMode',
        value: value,
      ));
    });
  }

  QueryBuilder<ThemeSettings, ThemeSettings, QAfterFilterCondition>
      themeModeLessThan(
    AppThemeMode value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'themeMode',
        value: value,
      ));
    });
  }

  QueryBuilder<ThemeSettings, ThemeSettings, QAfterFilterCondition>
      themeModeBetween(
    AppThemeMode lower,
    AppThemeMode upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'themeMode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ThemeSettings, ThemeSettings, QAfterFilterCondition>
      useDynamicColorsEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'useDynamicColors',
        value: value,
      ));
    });
  }
}

extension ThemeSettingsQueryObject
    on QueryBuilder<ThemeSettings, ThemeSettings, QFilterCondition> {}

extension ThemeSettingsQueryLinks
    on QueryBuilder<ThemeSettings, ThemeSettings, QFilterCondition> {}

extension ThemeSettingsQuerySortBy
    on QueryBuilder<ThemeSettings, ThemeSettings, QSortBy> {
  QueryBuilder<ThemeSettings, ThemeSettings, QAfterSortBy>
      sortByPrimaryColorHex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'primaryColorHex', Sort.asc);
    });
  }

  QueryBuilder<ThemeSettings, ThemeSettings, QAfterSortBy>
      sortByPrimaryColorHexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'primaryColorHex', Sort.desc);
    });
  }

  QueryBuilder<ThemeSettings, ThemeSettings, QAfterSortBy> sortByThemeMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'themeMode', Sort.asc);
    });
  }

  QueryBuilder<ThemeSettings, ThemeSettings, QAfterSortBy>
      sortByThemeModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'themeMode', Sort.desc);
    });
  }

  QueryBuilder<ThemeSettings, ThemeSettings, QAfterSortBy>
      sortByUseDynamicColors() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'useDynamicColors', Sort.asc);
    });
  }

  QueryBuilder<ThemeSettings, ThemeSettings, QAfterSortBy>
      sortByUseDynamicColorsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'useDynamicColors', Sort.desc);
    });
  }
}

extension ThemeSettingsQuerySortThenBy
    on QueryBuilder<ThemeSettings, ThemeSettings, QSortThenBy> {
  QueryBuilder<ThemeSettings, ThemeSettings, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ThemeSettings, ThemeSettings, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ThemeSettings, ThemeSettings, QAfterSortBy>
      thenByPrimaryColorHex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'primaryColorHex', Sort.asc);
    });
  }

  QueryBuilder<ThemeSettings, ThemeSettings, QAfterSortBy>
      thenByPrimaryColorHexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'primaryColorHex', Sort.desc);
    });
  }

  QueryBuilder<ThemeSettings, ThemeSettings, QAfterSortBy> thenByThemeMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'themeMode', Sort.asc);
    });
  }

  QueryBuilder<ThemeSettings, ThemeSettings, QAfterSortBy>
      thenByThemeModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'themeMode', Sort.desc);
    });
  }

  QueryBuilder<ThemeSettings, ThemeSettings, QAfterSortBy>
      thenByUseDynamicColors() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'useDynamicColors', Sort.asc);
    });
  }

  QueryBuilder<ThemeSettings, ThemeSettings, QAfterSortBy>
      thenByUseDynamicColorsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'useDynamicColors', Sort.desc);
    });
  }
}

extension ThemeSettingsQueryWhereDistinct
    on QueryBuilder<ThemeSettings, ThemeSettings, QDistinct> {
  QueryBuilder<ThemeSettings, ThemeSettings, QDistinct>
      distinctByPrimaryColorHex({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'primaryColorHex',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ThemeSettings, ThemeSettings, QDistinct> distinctByThemeMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'themeMode');
    });
  }

  QueryBuilder<ThemeSettings, ThemeSettings, QDistinct>
      distinctByUseDynamicColors() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'useDynamicColors');
    });
  }
}

extension ThemeSettingsQueryProperty
    on QueryBuilder<ThemeSettings, ThemeSettings, QQueryProperty> {
  QueryBuilder<ThemeSettings, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ThemeSettings, String, QQueryOperations>
      primaryColorHexProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'primaryColorHex');
    });
  }

  QueryBuilder<ThemeSettings, AppThemeMode, QQueryOperations>
      themeModeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'themeMode');
    });
  }

  QueryBuilder<ThemeSettings, bool, QQueryOperations>
      useDynamicColorsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'useDynamicColors');
    });
  }
}
