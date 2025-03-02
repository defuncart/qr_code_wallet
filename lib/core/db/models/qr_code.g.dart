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
        name: 'type',
        type: IsarType.byte,
        enumMap: {"url": 0, "vCard": 1, "text": 2, "email": 3, "phone": 4, "sms": 5, "wifi": 6, "other": 7},
      ),
      IsarPropertySchema(
        name: 'label',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'data',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'email',
        type: IsarType.object,
        target: 'EmailQRCodeData',
      ),
      IsarPropertySchema(
        name: 'phone',
        type: IsarType.object,
        target: 'PhoneQRCodeData',
      ),
      IsarPropertySchema(
        name: 'sms',
        type: IsarType.object,
        target: 'SMSQRCodeData',
      ),
      IsarPropertySchema(
        name: 'wifi',
        type: IsarType.object,
        target: 'WifiQRCodeData',
      ),
    ],
    indexes: [],
  ),
  converter: IsarObjectConverter<int, QRCode>(
    serialize: serializeQRCode,
    deserialize: deserializeQRCode,
    deserializeProperty: deserializeQRCodeProp,
  ),
  embeddedSchemas: [EmailQRCodeDataSchema, PhoneQRCodeDataSchema, SMSQRCodeDataSchema, WifiQRCodeDataSchema],
);

@isarProtected
int serializeQRCode(IsarWriter writer, QRCode object) {
  IsarCore.writeByte(writer, 1, object.type.index);
  IsarCore.writeString(writer, 2, object.label);
  IsarCore.writeString(writer, 3, object.data);
  {
    final value = object.email;
    if (value == null) {
      IsarCore.writeNull(writer, 4);
    } else {
      final objectWriter = IsarCore.beginObject(writer, 4);
      serializeEmailQRCodeData(objectWriter, value);
      IsarCore.endObject(writer, objectWriter);
    }
  }
  {
    final value = object.phone;
    if (value == null) {
      IsarCore.writeNull(writer, 5);
    } else {
      final objectWriter = IsarCore.beginObject(writer, 5);
      serializePhoneQRCodeData(objectWriter, value);
      IsarCore.endObject(writer, objectWriter);
    }
  }
  {
    final value = object.sms;
    if (value == null) {
      IsarCore.writeNull(writer, 6);
    } else {
      final objectWriter = IsarCore.beginObject(writer, 6);
      serializeSMSQRCodeData(objectWriter, value);
      IsarCore.endObject(writer, objectWriter);
    }
  }
  {
    final value = object.wifi;
    if (value == null) {
      IsarCore.writeNull(writer, 7);
    } else {
      final objectWriter = IsarCore.beginObject(writer, 7);
      serializeWifiQRCodeData(objectWriter, value);
      IsarCore.endObject(writer, objectWriter);
    }
  }
  return object.id;
}

@isarProtected
QRCode deserializeQRCode(IsarReader reader) {
  final int _id;
  _id = IsarCore.readId(reader);
  final QRCodeType _type;
  {
    if (IsarCore.readNull(reader, 1)) {
      _type = QRCodeType.url;
    } else {
      _type = _qRCodeType[IsarCore.readByte(reader, 1)] ?? QRCodeType.url;
    }
  }
  final String _label;
  _label = IsarCore.readString(reader, 2) ?? '';
  final String _data;
  _data = IsarCore.readString(reader, 3) ?? '';
  final EmailQRCodeData? _email;
  {
    final objectReader = IsarCore.readObject(reader, 4);
    if (objectReader.isNull) {
      _email = null;
    } else {
      final embedded = deserializeEmailQRCodeData(objectReader);
      IsarCore.freeReader(objectReader);
      _email = embedded;
    }
  }
  final PhoneQRCodeData? _phone;
  {
    final objectReader = IsarCore.readObject(reader, 5);
    if (objectReader.isNull) {
      _phone = null;
    } else {
      final embedded = deserializePhoneQRCodeData(objectReader);
      IsarCore.freeReader(objectReader);
      _phone = embedded;
    }
  }
  final SMSQRCodeData? _sms;
  {
    final objectReader = IsarCore.readObject(reader, 6);
    if (objectReader.isNull) {
      _sms = null;
    } else {
      final embedded = deserializeSMSQRCodeData(objectReader);
      IsarCore.freeReader(objectReader);
      _sms = embedded;
    }
  }
  final WifiQRCodeData? _wifi;
  {
    final objectReader = IsarCore.readObject(reader, 7);
    if (objectReader.isNull) {
      _wifi = null;
    } else {
      final embedded = deserializeWifiQRCodeData(objectReader);
      IsarCore.freeReader(objectReader);
      _wifi = embedded;
    }
  }
  final object = QRCode(
    id: _id,
    type: _type,
    label: _label,
    data: _data,
    email: _email,
    phone: _phone,
    sms: _sms,
    wifi: _wifi,
  );
  return object;
}

@isarProtected
dynamic deserializeQRCodeProp(IsarReader reader, int property) {
  switch (property) {
    case 0:
      return IsarCore.readId(reader);
    case 1:
      {
        if (IsarCore.readNull(reader, 1)) {
          return QRCodeType.url;
        } else {
          return _qRCodeType[IsarCore.readByte(reader, 1)] ?? QRCodeType.url;
        }
      }
    case 2:
      return IsarCore.readString(reader, 2) ?? '';
    case 3:
      return IsarCore.readString(reader, 3) ?? '';
    case 4:
      {
        final objectReader = IsarCore.readObject(reader, 4);
        if (objectReader.isNull) {
          return null;
        } else {
          final embedded = deserializeEmailQRCodeData(objectReader);
          IsarCore.freeReader(objectReader);
          return embedded;
        }
      }
    case 5:
      {
        final objectReader = IsarCore.readObject(reader, 5);
        if (objectReader.isNull) {
          return null;
        } else {
          final embedded = deserializePhoneQRCodeData(objectReader);
          IsarCore.freeReader(objectReader);
          return embedded;
        }
      }
    case 6:
      {
        final objectReader = IsarCore.readObject(reader, 6);
        if (objectReader.isNull) {
          return null;
        } else {
          final embedded = deserializeSMSQRCodeData(objectReader);
          IsarCore.freeReader(objectReader);
          return embedded;
        }
      }
    case 7:
      {
        final objectReader = IsarCore.readObject(reader, 7);
        if (objectReader.isNull) {
          return null;
        } else {
          final embedded = deserializeWifiQRCodeData(objectReader);
          IsarCore.freeReader(objectReader);
          return embedded;
        }
      }
    default:
      throw ArgumentError('Unknown property: $property');
  }
}

sealed class _QRCodeUpdate {
  bool call({
    required int id,
    QRCodeType? type,
    String? label,
    String? data,
  });
}

class _QRCodeUpdateImpl implements _QRCodeUpdate {
  const _QRCodeUpdateImpl(this.collection);

  final IsarCollection<int, QRCode> collection;

  @override
  bool call({
    required int id,
    Object? type = ignore,
    Object? label = ignore,
    Object? data = ignore,
  }) {
    return collection.updateProperties([
          id
        ], {
          if (type != ignore) 1: type as QRCodeType?,
          if (label != ignore) 2: label as String?,
          if (data != ignore) 3: data as String?,
        }) >
        0;
  }
}

sealed class _QRCodeUpdateAll {
  int call({
    required List<int> id,
    QRCodeType? type,
    String? label,
    String? data,
  });
}

class _QRCodeUpdateAllImpl implements _QRCodeUpdateAll {
  const _QRCodeUpdateAllImpl(this.collection);

  final IsarCollection<int, QRCode> collection;

  @override
  int call({
    required List<int> id,
    Object? type = ignore,
    Object? label = ignore,
    Object? data = ignore,
  }) {
    return collection.updateProperties(id, {
      if (type != ignore) 1: type as QRCodeType?,
      if (label != ignore) 2: label as String?,
      if (data != ignore) 3: data as String?,
    });
  }
}

extension QRCodeUpdate on IsarCollection<int, QRCode> {
  _QRCodeUpdate get update => _QRCodeUpdateImpl(this);

  _QRCodeUpdateAll get updateAll => _QRCodeUpdateAllImpl(this);
}

sealed class _QRCodeQueryUpdate {
  int call({
    QRCodeType? type,
    String? label,
    String? data,
  });
}

class _QRCodeQueryUpdateImpl implements _QRCodeQueryUpdate {
  const _QRCodeQueryUpdateImpl(this.query, {this.limit});

  final IsarQuery<QRCode> query;
  final int? limit;

  @override
  int call({
    Object? type = ignore,
    Object? label = ignore,
    Object? data = ignore,
  }) {
    return query.updateProperties(limit: limit, {
      if (type != ignore) 1: type as QRCodeType?,
      if (label != ignore) 2: label as String?,
      if (data != ignore) 3: data as String?,
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
    Object? type = ignore,
    Object? label = ignore,
    Object? data = ignore,
  }) {
    final q = query.build();
    try {
      return q.updateProperties(limit: limit, {
        if (type != ignore) 1: type as QRCodeType?,
        if (label != ignore) 2: label as String?,
        if (data != ignore) 3: data as String?,
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

const _qRCodeType = {
  0: QRCodeType.url,
  1: QRCodeType.vCard,
  2: QRCodeType.text,
  3: QRCodeType.email,
  4: QRCodeType.phone,
  5: QRCodeType.sms,
  6: QRCodeType.wifi,
  7: QRCodeType.other,
};

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

  QueryBuilder<QRCode, QRCode, QAfterFilterCondition> typeEqualTo(
    QRCodeType value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 1,
          value: value.index,
        ),
      );
    });
  }

  QueryBuilder<QRCode, QRCode, QAfterFilterCondition> typeGreaterThan(
    QRCodeType value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 1,
          value: value.index,
        ),
      );
    });
  }

  QueryBuilder<QRCode, QRCode, QAfterFilterCondition> typeGreaterThanOrEqualTo(
    QRCodeType value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 1,
          value: value.index,
        ),
      );
    });
  }

  QueryBuilder<QRCode, QRCode, QAfterFilterCondition> typeLessThan(
    QRCodeType value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 1,
          value: value.index,
        ),
      );
    });
  }

  QueryBuilder<QRCode, QRCode, QAfterFilterCondition> typeLessThanOrEqualTo(
    QRCodeType value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 1,
          value: value.index,
        ),
      );
    });
  }

  QueryBuilder<QRCode, QRCode, QAfterFilterCondition> typeBetween(
    QRCodeType lower,
    QRCodeType upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 1,
          lower: lower.index,
          upper: upper.index,
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

  QueryBuilder<QRCode, QRCode, QAfterFilterCondition> dataEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 3,
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
          property: 3,
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
          property: 3,
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
          property: 3,
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
          property: 3,
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
          property: 3,
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
          property: 3,
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
          property: 3,
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
          property: 3,
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
          property: 3,
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
          property: 3,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<QRCode, QRCode, QAfterFilterCondition> dataIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 3,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<QRCode, QRCode, QAfterFilterCondition> emailIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 4));
    });
  }

  QueryBuilder<QRCode, QRCode, QAfterFilterCondition> emailIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 4));
    });
  }

  QueryBuilder<QRCode, QRCode, QAfterFilterCondition> phoneIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 5));
    });
  }

  QueryBuilder<QRCode, QRCode, QAfterFilterCondition> phoneIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 5));
    });
  }

  QueryBuilder<QRCode, QRCode, QAfterFilterCondition> smsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 6));
    });
  }

  QueryBuilder<QRCode, QRCode, QAfterFilterCondition> smsIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 6));
    });
  }

  QueryBuilder<QRCode, QRCode, QAfterFilterCondition> wifiIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 7));
    });
  }

  QueryBuilder<QRCode, QRCode, QAfterFilterCondition> wifiIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 7));
    });
  }
}

extension QRCodeQueryObject on QueryBuilder<QRCode, QRCode, QFilterCondition> {
  QueryBuilder<QRCode, QRCode, QAfterFilterCondition> email(FilterQuery<EmailQRCodeData> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, 4);
    });
  }

  QueryBuilder<QRCode, QRCode, QAfterFilterCondition> phone(FilterQuery<PhoneQRCodeData> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, 5);
    });
  }

  QueryBuilder<QRCode, QRCode, QAfterFilterCondition> sms(FilterQuery<SMSQRCodeData> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, 6);
    });
  }

  QueryBuilder<QRCode, QRCode, QAfterFilterCondition> wifi(FilterQuery<WifiQRCodeData> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, 7);
    });
  }
}

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

  QueryBuilder<QRCode, QRCode, QAfterSortBy> sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1);
    });
  }

  QueryBuilder<QRCode, QRCode, QAfterSortBy> sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc);
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

  QueryBuilder<QRCode, QRCode, QAfterSortBy> sortByData({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        3,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<QRCode, QRCode, QAfterSortBy> sortByDataDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        3,
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

  QueryBuilder<QRCode, QRCode, QAfterSortBy> thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1);
    });
  }

  QueryBuilder<QRCode, QRCode, QAfterSortBy> thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc);
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

  QueryBuilder<QRCode, QRCode, QAfterSortBy> thenByData({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QRCode, QRCode, QAfterSortBy> thenByDataDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }
}

extension QRCodeQueryWhereDistinct on QueryBuilder<QRCode, QRCode, QDistinct> {
  QueryBuilder<QRCode, QRCode, QAfterDistinct> distinctByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(1);
    });
  }

  QueryBuilder<QRCode, QRCode, QAfterDistinct> distinctByLabel({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(2, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QRCode, QRCode, QAfterDistinct> distinctByData({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(3, caseSensitive: caseSensitive);
    });
  }
}

extension QRCodeQueryProperty1 on QueryBuilder<QRCode, QRCode, QProperty> {
  QueryBuilder<QRCode, int, QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<QRCode, QRCodeType, QAfterProperty> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<QRCode, String, QAfterProperty> labelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<QRCode, String, QAfterProperty> dataProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<QRCode, EmailQRCodeData?, QAfterProperty> emailProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<QRCode, PhoneQRCodeData?, QAfterProperty> phoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<QRCode, SMSQRCodeData?, QAfterProperty> smsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }

  QueryBuilder<QRCode, WifiQRCodeData?, QAfterProperty> wifiProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(7);
    });
  }
}

extension QRCodeQueryProperty2<R> on QueryBuilder<QRCode, R, QAfterProperty> {
  QueryBuilder<QRCode, (R, int), QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<QRCode, (R, QRCodeType), QAfterProperty> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<QRCode, (R, String), QAfterProperty> labelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<QRCode, (R, String), QAfterProperty> dataProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<QRCode, (R, EmailQRCodeData?), QAfterProperty> emailProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<QRCode, (R, PhoneQRCodeData?), QAfterProperty> phoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<QRCode, (R, SMSQRCodeData?), QAfterProperty> smsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }

  QueryBuilder<QRCode, (R, WifiQRCodeData?), QAfterProperty> wifiProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(7);
    });
  }
}

extension QRCodeQueryProperty3<R1, R2> on QueryBuilder<QRCode, (R1, R2), QAfterProperty> {
  QueryBuilder<QRCode, (R1, R2, int), QOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<QRCode, (R1, R2, QRCodeType), QOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<QRCode, (R1, R2, String), QOperations> labelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<QRCode, (R1, R2, String), QOperations> dataProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<QRCode, (R1, R2, EmailQRCodeData?), QOperations> emailProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<QRCode, (R1, R2, PhoneQRCodeData?), QOperations> phoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<QRCode, (R1, R2, SMSQRCodeData?), QOperations> smsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }

  QueryBuilder<QRCode, (R1, R2, WifiQRCodeData?), QOperations> wifiProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(7);
    });
  }
}

// **************************************************************************
// _IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors
// ignore_for_file: type=lint

const EmailQRCodeDataSchema = IsarGeneratedSchema(
  schema: IsarSchema(
    name: 'EmailQRCodeData',
    embedded: true,
    properties: [
      IsarPropertySchema(
        name: 'address',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'subject',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'body',
        type: IsarType.string,
      ),
    ],
    indexes: [],
  ),
  converter: IsarObjectConverter<void, EmailQRCodeData>(
    serialize: serializeEmailQRCodeData,
    deserialize: deserializeEmailQRCodeData,
  ),
);

@isarProtected
int serializeEmailQRCodeData(IsarWriter writer, EmailQRCodeData object) {
  {
    final value = object.address;
    if (value == null) {
      IsarCore.writeNull(writer, 1);
    } else {
      IsarCore.writeString(writer, 1, value);
    }
  }
  {
    final value = object.subject;
    if (value == null) {
      IsarCore.writeNull(writer, 2);
    } else {
      IsarCore.writeString(writer, 2, value);
    }
  }
  {
    final value = object.body;
    if (value == null) {
      IsarCore.writeNull(writer, 3);
    } else {
      IsarCore.writeString(writer, 3, value);
    }
  }
  return 0;
}

@isarProtected
EmailQRCodeData deserializeEmailQRCodeData(IsarReader reader) {
  final String? _address;
  _address = IsarCore.readString(reader, 1);
  final String? _subject;
  _subject = IsarCore.readString(reader, 2);
  final String? _body;
  _body = IsarCore.readString(reader, 3);
  final object = EmailQRCodeData(
    address: _address,
    subject: _subject,
    body: _body,
  );
  return object;
}

extension EmailQRCodeDataQueryFilter on QueryBuilder<EmailQRCodeData, EmailQRCodeData, QFilterCondition> {
  QueryBuilder<EmailQRCodeData, EmailQRCodeData, QAfterFilterCondition> addressIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 1));
    });
  }

  QueryBuilder<EmailQRCodeData, EmailQRCodeData, QAfterFilterCondition> addressIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 1));
    });
  }

  QueryBuilder<EmailQRCodeData, EmailQRCodeData, QAfterFilterCondition> addressEqualTo(
    String? value, {
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

  QueryBuilder<EmailQRCodeData, EmailQRCodeData, QAfterFilterCondition> addressGreaterThan(
    String? value, {
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

  QueryBuilder<EmailQRCodeData, EmailQRCodeData, QAfterFilterCondition> addressGreaterThanOrEqualTo(
    String? value, {
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

  QueryBuilder<EmailQRCodeData, EmailQRCodeData, QAfterFilterCondition> addressLessThan(
    String? value, {
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

  QueryBuilder<EmailQRCodeData, EmailQRCodeData, QAfterFilterCondition> addressLessThanOrEqualTo(
    String? value, {
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

  QueryBuilder<EmailQRCodeData, EmailQRCodeData, QAfterFilterCondition> addressBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<EmailQRCodeData, EmailQRCodeData, QAfterFilterCondition> addressStartsWith(
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

  QueryBuilder<EmailQRCodeData, EmailQRCodeData, QAfterFilterCondition> addressEndsWith(
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

  QueryBuilder<EmailQRCodeData, EmailQRCodeData, QAfterFilterCondition> addressContains(String value,
      {bool caseSensitive = true}) {
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

  QueryBuilder<EmailQRCodeData, EmailQRCodeData, QAfterFilterCondition> addressMatches(String pattern,
      {bool caseSensitive = true}) {
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

  QueryBuilder<EmailQRCodeData, EmailQRCodeData, QAfterFilterCondition> addressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<EmailQRCodeData, EmailQRCodeData, QAfterFilterCondition> addressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<EmailQRCodeData, EmailQRCodeData, QAfterFilterCondition> subjectIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 2));
    });
  }

  QueryBuilder<EmailQRCodeData, EmailQRCodeData, QAfterFilterCondition> subjectIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 2));
    });
  }

  QueryBuilder<EmailQRCodeData, EmailQRCodeData, QAfterFilterCondition> subjectEqualTo(
    String? value, {
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

  QueryBuilder<EmailQRCodeData, EmailQRCodeData, QAfterFilterCondition> subjectGreaterThan(
    String? value, {
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

  QueryBuilder<EmailQRCodeData, EmailQRCodeData, QAfterFilterCondition> subjectGreaterThanOrEqualTo(
    String? value, {
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

  QueryBuilder<EmailQRCodeData, EmailQRCodeData, QAfterFilterCondition> subjectLessThan(
    String? value, {
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

  QueryBuilder<EmailQRCodeData, EmailQRCodeData, QAfterFilterCondition> subjectLessThanOrEqualTo(
    String? value, {
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

  QueryBuilder<EmailQRCodeData, EmailQRCodeData, QAfterFilterCondition> subjectBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<EmailQRCodeData, EmailQRCodeData, QAfterFilterCondition> subjectStartsWith(
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

  QueryBuilder<EmailQRCodeData, EmailQRCodeData, QAfterFilterCondition> subjectEndsWith(
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

  QueryBuilder<EmailQRCodeData, EmailQRCodeData, QAfterFilterCondition> subjectContains(String value,
      {bool caseSensitive = true}) {
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

  QueryBuilder<EmailQRCodeData, EmailQRCodeData, QAfterFilterCondition> subjectMatches(String pattern,
      {bool caseSensitive = true}) {
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

  QueryBuilder<EmailQRCodeData, EmailQRCodeData, QAfterFilterCondition> subjectIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 2,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<EmailQRCodeData, EmailQRCodeData, QAfterFilterCondition> subjectIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 2,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<EmailQRCodeData, EmailQRCodeData, QAfterFilterCondition> bodyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 3));
    });
  }

  QueryBuilder<EmailQRCodeData, EmailQRCodeData, QAfterFilterCondition> bodyIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 3));
    });
  }

  QueryBuilder<EmailQRCodeData, EmailQRCodeData, QAfterFilterCondition> bodyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<EmailQRCodeData, EmailQRCodeData, QAfterFilterCondition> bodyGreaterThan(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<EmailQRCodeData, EmailQRCodeData, QAfterFilterCondition> bodyGreaterThanOrEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<EmailQRCodeData, EmailQRCodeData, QAfterFilterCondition> bodyLessThan(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<EmailQRCodeData, EmailQRCodeData, QAfterFilterCondition> bodyLessThanOrEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<EmailQRCodeData, EmailQRCodeData, QAfterFilterCondition> bodyBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 3,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<EmailQRCodeData, EmailQRCodeData, QAfterFilterCondition> bodyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<EmailQRCodeData, EmailQRCodeData, QAfterFilterCondition> bodyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<EmailQRCodeData, EmailQRCodeData, QAfterFilterCondition> bodyContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<EmailQRCodeData, EmailQRCodeData, QAfterFilterCondition> bodyMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 3,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<EmailQRCodeData, EmailQRCodeData, QAfterFilterCondition> bodyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 3,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<EmailQRCodeData, EmailQRCodeData, QAfterFilterCondition> bodyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 3,
          value: '',
        ),
      );
    });
  }
}

extension EmailQRCodeDataQueryObject on QueryBuilder<EmailQRCodeData, EmailQRCodeData, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors
// ignore_for_file: type=lint

const PhoneQRCodeDataSchema = IsarGeneratedSchema(
  schema: IsarSchema(
    name: 'PhoneQRCodeData',
    embedded: true,
    properties: [
      IsarPropertySchema(
        name: 'phoneNumber',
        type: IsarType.string,
      ),
    ],
    indexes: [],
  ),
  converter: IsarObjectConverter<void, PhoneQRCodeData>(
    serialize: serializePhoneQRCodeData,
    deserialize: deserializePhoneQRCodeData,
  ),
);

@isarProtected
int serializePhoneQRCodeData(IsarWriter writer, PhoneQRCodeData object) {
  {
    final value = object.phoneNumber;
    if (value == null) {
      IsarCore.writeNull(writer, 1);
    } else {
      IsarCore.writeString(writer, 1, value);
    }
  }
  return 0;
}

@isarProtected
PhoneQRCodeData deserializePhoneQRCodeData(IsarReader reader) {
  final String? _phoneNumber;
  _phoneNumber = IsarCore.readString(reader, 1);
  final object = PhoneQRCodeData(
    phoneNumber: _phoneNumber,
  );
  return object;
}

extension PhoneQRCodeDataQueryFilter on QueryBuilder<PhoneQRCodeData, PhoneQRCodeData, QFilterCondition> {
  QueryBuilder<PhoneQRCodeData, PhoneQRCodeData, QAfterFilterCondition> phoneNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 1));
    });
  }

  QueryBuilder<PhoneQRCodeData, PhoneQRCodeData, QAfterFilterCondition> phoneNumberIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 1));
    });
  }

  QueryBuilder<PhoneQRCodeData, PhoneQRCodeData, QAfterFilterCondition> phoneNumberEqualTo(
    String? value, {
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

  QueryBuilder<PhoneQRCodeData, PhoneQRCodeData, QAfterFilterCondition> phoneNumberGreaterThan(
    String? value, {
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

  QueryBuilder<PhoneQRCodeData, PhoneQRCodeData, QAfterFilterCondition> phoneNumberGreaterThanOrEqualTo(
    String? value, {
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

  QueryBuilder<PhoneQRCodeData, PhoneQRCodeData, QAfterFilterCondition> phoneNumberLessThan(
    String? value, {
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

  QueryBuilder<PhoneQRCodeData, PhoneQRCodeData, QAfterFilterCondition> phoneNumberLessThanOrEqualTo(
    String? value, {
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

  QueryBuilder<PhoneQRCodeData, PhoneQRCodeData, QAfterFilterCondition> phoneNumberBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<PhoneQRCodeData, PhoneQRCodeData, QAfterFilterCondition> phoneNumberStartsWith(
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

  QueryBuilder<PhoneQRCodeData, PhoneQRCodeData, QAfterFilterCondition> phoneNumberEndsWith(
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

  QueryBuilder<PhoneQRCodeData, PhoneQRCodeData, QAfterFilterCondition> phoneNumberContains(String value,
      {bool caseSensitive = true}) {
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

  QueryBuilder<PhoneQRCodeData, PhoneQRCodeData, QAfterFilterCondition> phoneNumberMatches(String pattern,
      {bool caseSensitive = true}) {
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

  QueryBuilder<PhoneQRCodeData, PhoneQRCodeData, QAfterFilterCondition> phoneNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<PhoneQRCodeData, PhoneQRCodeData, QAfterFilterCondition> phoneNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }
}

extension PhoneQRCodeDataQueryObject on QueryBuilder<PhoneQRCodeData, PhoneQRCodeData, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors
// ignore_for_file: type=lint

const SMSQRCodeDataSchema = IsarGeneratedSchema(
  schema: IsarSchema(
    name: 'SMSQRCodeData',
    embedded: true,
    properties: [
      IsarPropertySchema(
        name: 'phoneNumber',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'message',
        type: IsarType.string,
      ),
    ],
    indexes: [],
  ),
  converter: IsarObjectConverter<void, SMSQRCodeData>(
    serialize: serializeSMSQRCodeData,
    deserialize: deserializeSMSQRCodeData,
  ),
);

@isarProtected
int serializeSMSQRCodeData(IsarWriter writer, SMSQRCodeData object) {
  {
    final value = object.phoneNumber;
    if (value == null) {
      IsarCore.writeNull(writer, 1);
    } else {
      IsarCore.writeString(writer, 1, value);
    }
  }
  {
    final value = object.message;
    if (value == null) {
      IsarCore.writeNull(writer, 2);
    } else {
      IsarCore.writeString(writer, 2, value);
    }
  }
  return 0;
}

@isarProtected
SMSQRCodeData deserializeSMSQRCodeData(IsarReader reader) {
  final String? _phoneNumber;
  _phoneNumber = IsarCore.readString(reader, 1);
  final String? _message;
  _message = IsarCore.readString(reader, 2);
  final object = SMSQRCodeData(
    phoneNumber: _phoneNumber,
    message: _message,
  );
  return object;
}

extension SMSQRCodeDataQueryFilter on QueryBuilder<SMSQRCodeData, SMSQRCodeData, QFilterCondition> {
  QueryBuilder<SMSQRCodeData, SMSQRCodeData, QAfterFilterCondition> phoneNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 1));
    });
  }

  QueryBuilder<SMSQRCodeData, SMSQRCodeData, QAfterFilterCondition> phoneNumberIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 1));
    });
  }

  QueryBuilder<SMSQRCodeData, SMSQRCodeData, QAfterFilterCondition> phoneNumberEqualTo(
    String? value, {
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

  QueryBuilder<SMSQRCodeData, SMSQRCodeData, QAfterFilterCondition> phoneNumberGreaterThan(
    String? value, {
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

  QueryBuilder<SMSQRCodeData, SMSQRCodeData, QAfterFilterCondition> phoneNumberGreaterThanOrEqualTo(
    String? value, {
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

  QueryBuilder<SMSQRCodeData, SMSQRCodeData, QAfterFilterCondition> phoneNumberLessThan(
    String? value, {
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

  QueryBuilder<SMSQRCodeData, SMSQRCodeData, QAfterFilterCondition> phoneNumberLessThanOrEqualTo(
    String? value, {
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

  QueryBuilder<SMSQRCodeData, SMSQRCodeData, QAfterFilterCondition> phoneNumberBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<SMSQRCodeData, SMSQRCodeData, QAfterFilterCondition> phoneNumberStartsWith(
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

  QueryBuilder<SMSQRCodeData, SMSQRCodeData, QAfterFilterCondition> phoneNumberEndsWith(
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

  QueryBuilder<SMSQRCodeData, SMSQRCodeData, QAfterFilterCondition> phoneNumberContains(String value,
      {bool caseSensitive = true}) {
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

  QueryBuilder<SMSQRCodeData, SMSQRCodeData, QAfterFilterCondition> phoneNumberMatches(String pattern,
      {bool caseSensitive = true}) {
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

  QueryBuilder<SMSQRCodeData, SMSQRCodeData, QAfterFilterCondition> phoneNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<SMSQRCodeData, SMSQRCodeData, QAfterFilterCondition> phoneNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<SMSQRCodeData, SMSQRCodeData, QAfterFilterCondition> messageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 2));
    });
  }

  QueryBuilder<SMSQRCodeData, SMSQRCodeData, QAfterFilterCondition> messageIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 2));
    });
  }

  QueryBuilder<SMSQRCodeData, SMSQRCodeData, QAfterFilterCondition> messageEqualTo(
    String? value, {
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

  QueryBuilder<SMSQRCodeData, SMSQRCodeData, QAfterFilterCondition> messageGreaterThan(
    String? value, {
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

  QueryBuilder<SMSQRCodeData, SMSQRCodeData, QAfterFilterCondition> messageGreaterThanOrEqualTo(
    String? value, {
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

  QueryBuilder<SMSQRCodeData, SMSQRCodeData, QAfterFilterCondition> messageLessThan(
    String? value, {
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

  QueryBuilder<SMSQRCodeData, SMSQRCodeData, QAfterFilterCondition> messageLessThanOrEqualTo(
    String? value, {
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

  QueryBuilder<SMSQRCodeData, SMSQRCodeData, QAfterFilterCondition> messageBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<SMSQRCodeData, SMSQRCodeData, QAfterFilterCondition> messageStartsWith(
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

  QueryBuilder<SMSQRCodeData, SMSQRCodeData, QAfterFilterCondition> messageEndsWith(
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

  QueryBuilder<SMSQRCodeData, SMSQRCodeData, QAfterFilterCondition> messageContains(String value,
      {bool caseSensitive = true}) {
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

  QueryBuilder<SMSQRCodeData, SMSQRCodeData, QAfterFilterCondition> messageMatches(String pattern,
      {bool caseSensitive = true}) {
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

  QueryBuilder<SMSQRCodeData, SMSQRCodeData, QAfterFilterCondition> messageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 2,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<SMSQRCodeData, SMSQRCodeData, QAfterFilterCondition> messageIsNotEmpty() {
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

extension SMSQRCodeDataQueryObject on QueryBuilder<SMSQRCodeData, SMSQRCodeData, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors
// ignore_for_file: type=lint

const WifiQRCodeDataSchema = IsarGeneratedSchema(
  schema: IsarSchema(
    name: 'WifiQRCodeData',
    embedded: true,
    properties: [
      IsarPropertySchema(
        name: 'ssid',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'password',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'encryption',
        type: IsarType.string,
      ),
    ],
    indexes: [],
  ),
  converter: IsarObjectConverter<void, WifiQRCodeData>(
    serialize: serializeWifiQRCodeData,
    deserialize: deserializeWifiQRCodeData,
  ),
);

@isarProtected
int serializeWifiQRCodeData(IsarWriter writer, WifiQRCodeData object) {
  {
    final value = object.ssid;
    if (value == null) {
      IsarCore.writeNull(writer, 1);
    } else {
      IsarCore.writeString(writer, 1, value);
    }
  }
  {
    final value = object.password;
    if (value == null) {
      IsarCore.writeNull(writer, 2);
    } else {
      IsarCore.writeString(writer, 2, value);
    }
  }
  {
    final value = object.encryption;
    if (value == null) {
      IsarCore.writeNull(writer, 3);
    } else {
      IsarCore.writeString(writer, 3, value);
    }
  }
  return 0;
}

@isarProtected
WifiQRCodeData deserializeWifiQRCodeData(IsarReader reader) {
  final String? _ssid;
  _ssid = IsarCore.readString(reader, 1);
  final String? _password;
  _password = IsarCore.readString(reader, 2);
  final String? _encryption;
  _encryption = IsarCore.readString(reader, 3);
  final object = WifiQRCodeData(
    ssid: _ssid,
    password: _password,
    encryption: _encryption,
  );
  return object;
}

extension WifiQRCodeDataQueryFilter on QueryBuilder<WifiQRCodeData, WifiQRCodeData, QFilterCondition> {
  QueryBuilder<WifiQRCodeData, WifiQRCodeData, QAfterFilterCondition> ssidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 1));
    });
  }

  QueryBuilder<WifiQRCodeData, WifiQRCodeData, QAfterFilterCondition> ssidIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 1));
    });
  }

  QueryBuilder<WifiQRCodeData, WifiQRCodeData, QAfterFilterCondition> ssidEqualTo(
    String? value, {
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

  QueryBuilder<WifiQRCodeData, WifiQRCodeData, QAfterFilterCondition> ssidGreaterThan(
    String? value, {
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

  QueryBuilder<WifiQRCodeData, WifiQRCodeData, QAfterFilterCondition> ssidGreaterThanOrEqualTo(
    String? value, {
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

  QueryBuilder<WifiQRCodeData, WifiQRCodeData, QAfterFilterCondition> ssidLessThan(
    String? value, {
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

  QueryBuilder<WifiQRCodeData, WifiQRCodeData, QAfterFilterCondition> ssidLessThanOrEqualTo(
    String? value, {
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

  QueryBuilder<WifiQRCodeData, WifiQRCodeData, QAfterFilterCondition> ssidBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<WifiQRCodeData, WifiQRCodeData, QAfterFilterCondition> ssidStartsWith(
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

  QueryBuilder<WifiQRCodeData, WifiQRCodeData, QAfterFilterCondition> ssidEndsWith(
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

  QueryBuilder<WifiQRCodeData, WifiQRCodeData, QAfterFilterCondition> ssidContains(String value,
      {bool caseSensitive = true}) {
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

  QueryBuilder<WifiQRCodeData, WifiQRCodeData, QAfterFilterCondition> ssidMatches(String pattern,
      {bool caseSensitive = true}) {
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

  QueryBuilder<WifiQRCodeData, WifiQRCodeData, QAfterFilterCondition> ssidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<WifiQRCodeData, WifiQRCodeData, QAfterFilterCondition> ssidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<WifiQRCodeData, WifiQRCodeData, QAfterFilterCondition> passwordIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 2));
    });
  }

  QueryBuilder<WifiQRCodeData, WifiQRCodeData, QAfterFilterCondition> passwordIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 2));
    });
  }

  QueryBuilder<WifiQRCodeData, WifiQRCodeData, QAfterFilterCondition> passwordEqualTo(
    String? value, {
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

  QueryBuilder<WifiQRCodeData, WifiQRCodeData, QAfterFilterCondition> passwordGreaterThan(
    String? value, {
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

  QueryBuilder<WifiQRCodeData, WifiQRCodeData, QAfterFilterCondition> passwordGreaterThanOrEqualTo(
    String? value, {
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

  QueryBuilder<WifiQRCodeData, WifiQRCodeData, QAfterFilterCondition> passwordLessThan(
    String? value, {
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

  QueryBuilder<WifiQRCodeData, WifiQRCodeData, QAfterFilterCondition> passwordLessThanOrEqualTo(
    String? value, {
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

  QueryBuilder<WifiQRCodeData, WifiQRCodeData, QAfterFilterCondition> passwordBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<WifiQRCodeData, WifiQRCodeData, QAfterFilterCondition> passwordStartsWith(
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

  QueryBuilder<WifiQRCodeData, WifiQRCodeData, QAfterFilterCondition> passwordEndsWith(
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

  QueryBuilder<WifiQRCodeData, WifiQRCodeData, QAfterFilterCondition> passwordContains(String value,
      {bool caseSensitive = true}) {
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

  QueryBuilder<WifiQRCodeData, WifiQRCodeData, QAfterFilterCondition> passwordMatches(String pattern,
      {bool caseSensitive = true}) {
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

  QueryBuilder<WifiQRCodeData, WifiQRCodeData, QAfterFilterCondition> passwordIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 2,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<WifiQRCodeData, WifiQRCodeData, QAfterFilterCondition> passwordIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 2,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<WifiQRCodeData, WifiQRCodeData, QAfterFilterCondition> encryptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 3));
    });
  }

  QueryBuilder<WifiQRCodeData, WifiQRCodeData, QAfterFilterCondition> encryptionIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 3));
    });
  }

  QueryBuilder<WifiQRCodeData, WifiQRCodeData, QAfterFilterCondition> encryptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WifiQRCodeData, WifiQRCodeData, QAfterFilterCondition> encryptionGreaterThan(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WifiQRCodeData, WifiQRCodeData, QAfterFilterCondition> encryptionGreaterThanOrEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WifiQRCodeData, WifiQRCodeData, QAfterFilterCondition> encryptionLessThan(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WifiQRCodeData, WifiQRCodeData, QAfterFilterCondition> encryptionLessThanOrEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WifiQRCodeData, WifiQRCodeData, QAfterFilterCondition> encryptionBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 3,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WifiQRCodeData, WifiQRCodeData, QAfterFilterCondition> encryptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WifiQRCodeData, WifiQRCodeData, QAfterFilterCondition> encryptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WifiQRCodeData, WifiQRCodeData, QAfterFilterCondition> encryptionContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WifiQRCodeData, WifiQRCodeData, QAfterFilterCondition> encryptionMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 3,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WifiQRCodeData, WifiQRCodeData, QAfterFilterCondition> encryptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 3,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<WifiQRCodeData, WifiQRCodeData, QAfterFilterCondition> encryptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 3,
          value: '',
        ),
      );
    });
  }
}

extension WifiQRCodeDataQueryObject on QueryBuilder<WifiQRCodeData, WifiQRCodeData, QFilterCondition> {}
