// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr_code.dart';

// **************************************************************************
// _IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors
// ignore_for_file: type=lint

extension GetQRCodeCollection on Isar {
  IsarCollection<int, QRCode> get qRCodes => this.collection();
}

const QRCodeSchema = IsarGeneratedSchema(
  schema: IsarSchema(
    name: 'QRCode',
    idName: 'id',
    embedded: false,
    properties: [
      IsarPropertySchema(
        name: 'data',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'label',
        type: IsarType.string,
      ),
    ],
    indexes: [],
  ),
  converter: IsarObjectConverter<int, QRCode>(
    serialize: serializeQRCode,
    deserialize: deserializeQRCode,
    deserializeProperty: deserializeQRCodeProp,
  ),
  embeddedSchemas: [],
);

@isarProtected
int serializeQRCode(IsarWriter writer, QRCode object) {
  IsarCore.writeString(writer, 1, object.data);
  IsarCore.writeString(writer, 2, object.label);
  return object.id;
}

@isarProtected
QRCode deserializeQRCode(IsarReader reader) {
  final int _id;
  _id = IsarCore.readId(reader);
  final String _data;
  _data = IsarCore.readString(reader, 1) ?? '';
  final String _label;
  _label = IsarCore.readString(reader, 2) ?? '';
  final object = QRCode(
    id: _id,
    data: _data,
    label: _label,
  );
  return object;
}

@isarProtected
dynamic deserializeQRCodeProp(IsarReader reader, int property) {
  switch (property) {
    case 0:
      return IsarCore.readId(reader);
    case 1:
      return IsarCore.readString(reader, 1) ?? '';
    case 2:
      return IsarCore.readString(reader, 2) ?? '';
    default:
      throw ArgumentError('Unknown property: $property');
  }
}

sealed class _QRCodeUpdate {
  bool call({
    required int id,
    String? data,
    String? label,
  });
}

class _QRCodeUpdateImpl implements _QRCodeUpdate {
  const _QRCodeUpdateImpl(this.collection);

  final IsarCollection<int, QRCode> collection;

  @override
  bool call({
    required int id,
    Object? data = ignore,
    Object? label = ignore,
  }) {
    return collection.updateProperties([
          id
        ], {
          if (data != ignore) 1: data as String?,
          if (label != ignore) 2: label as String?,
        }) >
        0;
  }
}

sealed class _QRCodeUpdateAll {
  int call({
    required List<int> id,
    String? data,
    String? label,
  });
}

class _QRCodeUpdateAllImpl implements _QRCodeUpdateAll {
  const _QRCodeUpdateAllImpl(this.collection);

  final IsarCollection<int, QRCode> collection;

  @override
  int call({
    required List<int> id,
    Object? data = ignore,
    Object? label = ignore,
  }) {
    return collection.updateProperties(id, {
      if (data != ignore) 1: data as String?,
      if (label != ignore) 2: label as String?,
    });
  }
}

extension QRCodeUpdate on IsarCollection<int, QRCode> {
  _QRCodeUpdate get update => _QRCodeUpdateImpl(this);

  _QRCodeUpdateAll get updateAll => _QRCodeUpdateAllImpl(this);
}

sealed class _QRCodeQueryUpdate {
  int call({
    String? data,
    String? label,
  });
}

class _QRCodeQueryUpdateImpl implements _QRCodeQueryUpdate {
  const _QRCodeQueryUpdateImpl(this.query, {this.limit});

  final IsarQuery<QRCode> query;
  final int? limit;

  @override
  int call({
    Object? data = ignore,
    Object? label = ignore,
  }) {
    return query.updateProperties(limit: limit, {
      if (data != ignore) 1: data as String?,
      if (label != ignore) 2: label as String?,
    });
  }
}

extension QRCodeQueryUpdate on IsarQuery<QRCode> {
  _QRCodeQueryUpdate get updateFirst => _QRCodeQueryUpdateImpl(this, limit: 1);

  _QRCodeQueryUpdate get updateAll => _QRCodeQueryUpdateImpl(this);
}

class _QRCodeQueryBuilderUpdateImpl implements _QRCodeQueryUpdate {
  const _QRCodeQueryBuilderUpdateImpl(this.query, {this.limit});

  final QueryBuilder<QRCode, QRCode, QOperations> query;
  final int? limit;

  @override
  int call({
    Object? data = ignore,
    Object? label = ignore,
  }) {
    final q = query.build();
    try {
      return q.updateProperties(limit: limit, {
        if (data != ignore) 1: data as String?,
        if (label != ignore) 2: label as String?,
      });
    } finally {
      q.close();
    }
  }
}

extension QRCodeQueryBuilderUpdate on QueryBuilder<QRCode, QRCode, QOperations> {
  _QRCodeQueryUpdate get updateFirst => _QRCodeQueryBuilderUpdateImpl(this, limit: 1);

  _QRCodeQueryUpdate get updateAll => _QRCodeQueryBuilderUpdateImpl(this);
}

extension QRCodeQueryFilter on QueryBuilder<QRCode, QRCode, QFilterCondition> {
  QueryBuilder<QRCode, QRCode, QAfterFilterCondition> idEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<QRCode, QRCode, QAfterFilterCondition> idGreaterThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<QRCode, QRCode, QAfterFilterCondition> idGreaterThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<QRCode, QRCode, QAfterFilterCondition> idLessThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<QRCode, QRCode, QAfterFilterCondition> idLessThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<QRCode, QRCode, QAfterFilterCondition> idBetween(
    int lower,
    int upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 0,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<QRCode, QRCode, QAfterFilterCondition> dataEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QRCode, QRCode, QAfterFilterCondition> dataGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QRCode, QRCode, QAfterFilterCondition> dataGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QRCode, QRCode, QAfterFilterCondition> dataLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QRCode, QRCode, QAfterFilterCondition> dataLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QRCode, QRCode, QAfterFilterCondition> dataBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 1,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QRCode, QRCode, QAfterFilterCondition> dataStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QRCode, QRCode, QAfterFilterCondition> dataEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QRCode, QRCode, QAfterFilterCondition> dataContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QRCode, QRCode, QAfterFilterCondition> dataMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 1,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QRCode, QRCode, QAfterFilterCondition> dataIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<QRCode, QRCode, QAfterFilterCondition> dataIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<QRCode, QRCode, QAfterFilterCondition> labelEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QRCode, QRCode, QAfterFilterCondition> labelGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QRCode, QRCode, QAfterFilterCondition> labelGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QRCode, QRCode, QAfterFilterCondition> labelLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QRCode, QRCode, QAfterFilterCondition> labelLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QRCode, QRCode, QAfterFilterCondition> labelBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 2,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QRCode, QRCode, QAfterFilterCondition> labelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QRCode, QRCode, QAfterFilterCondition> labelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QRCode, QRCode, QAfterFilterCondition> labelContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QRCode, QRCode, QAfterFilterCondition> labelMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 2,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QRCode, QRCode, QAfterFilterCondition> labelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 2,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<QRCode, QRCode, QAfterFilterCondition> labelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 2,
          value: '',
        ),
      );
    });
  }
}

extension QRCodeQueryObject on QueryBuilder<QRCode, QRCode, QFilterCondition> {}

extension QRCodeQuerySortBy on QueryBuilder<QRCode, QRCode, QSortBy> {
  QueryBuilder<QRCode, QRCode, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<QRCode, QRCode, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<QRCode, QRCode, QAfterSortBy> sortByData({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        1,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<QRCode, QRCode, QAfterSortBy> sortByDataDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        1,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<QRCode, QRCode, QAfterSortBy> sortByLabel({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        2,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<QRCode, QRCode, QAfterSortBy> sortByLabelDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        2,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }
}

extension QRCodeQuerySortThenBy on QueryBuilder<QRCode, QRCode, QSortThenBy> {
  QueryBuilder<QRCode, QRCode, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<QRCode, QRCode, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<QRCode, QRCode, QAfterSortBy> thenByData({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QRCode, QRCode, QAfterSortBy> thenByDataDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QRCode, QRCode, QAfterSortBy> thenByLabel({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QRCode, QRCode, QAfterSortBy> thenByLabelDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }
}

extension QRCodeQueryWhereDistinct on QueryBuilder<QRCode, QRCode, QDistinct> {
  QueryBuilder<QRCode, QRCode, QAfterDistinct> distinctByData({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(1, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QRCode, QRCode, QAfterDistinct> distinctByLabel({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(2, caseSensitive: caseSensitive);
    });
  }
}

extension QRCodeQueryProperty1 on QueryBuilder<QRCode, QRCode, QProperty> {
  QueryBuilder<QRCode, int, QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<QRCode, String, QAfterProperty> dataProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<QRCode, String, QAfterProperty> labelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }
}

extension QRCodeQueryProperty2<R> on QueryBuilder<QRCode, R, QAfterProperty> {
  QueryBuilder<QRCode, (R, int), QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<QRCode, (R, String), QAfterProperty> dataProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<QRCode, (R, String), QAfterProperty> labelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }
}

extension QRCodeQueryProperty3<R1, R2> on QueryBuilder<QRCode, (R1, R2), QAfterProperty> {
  QueryBuilder<QRCode, (R1, R2, int), QOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<QRCode, (R1, R2, String), QOperations> dataProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<QRCode, (R1, R2, String), QOperations> labelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }
}
