// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Calendar.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Calendar extends _Calendar
    with RealmEntity, RealmObjectBase, RealmObject {
  Calendar(
    String date, {
    int? year,
    int? month,
    int? day,
    int? hour,
    int? miniute,
    int? itemLevel,
    Iterable<String> characterIdList = const [],
    Iterable<String> characterNameList = const [],
    Iterable<String> characterGuildNameList = const [],
    Iterable<String> characterServerIdList = const [],
    Iterable<int> characterItemLevelList = const [],
    Iterable<int> characterFameList = const [],
  }) {
    RealmObjectBase.set(this, 'date', date);
    RealmObjectBase.set(this, 'year', year);
    RealmObjectBase.set(this, 'month', month);
    RealmObjectBase.set(this, 'day', day);
    RealmObjectBase.set(this, 'hour', hour);
    RealmObjectBase.set(this, 'miniute', miniute);
    RealmObjectBase.set(this, 'itemLevel', itemLevel);
    RealmObjectBase.set<RealmList<String>>(
        this, 'characterIdList', RealmList<String>(characterIdList));
    RealmObjectBase.set<RealmList<String>>(
        this, 'characterNameList', RealmList<String>(characterNameList));
    RealmObjectBase.set<RealmList<String>>(this, 'characterGuildNameList',
        RealmList<String>(characterGuildNameList));
    RealmObjectBase.set<RealmList<String>>(this, 'characterServerIdList',
        RealmList<String>(characterServerIdList));
    RealmObjectBase.set<RealmList<int>>(
        this, 'characterItemLevelList', RealmList<int>(characterItemLevelList));
    RealmObjectBase.set<RealmList<int>>(
        this, 'characterFameList', RealmList<int>(characterFameList));
  }

  Calendar._();

  @override
  String get date => RealmObjectBase.get<String>(this, 'date') as String;
  @override
  set date(String value) => throw RealmUnsupportedSetError();

  @override
  int? get year => RealmObjectBase.get<int>(this, 'year') as int?;
  @override
  set year(int? value) => RealmObjectBase.set(this, 'year', value);

  @override
  int? get month => RealmObjectBase.get<int>(this, 'month') as int?;
  @override
  set month(int? value) => RealmObjectBase.set(this, 'month', value);

  @override
  int? get day => RealmObjectBase.get<int>(this, 'day') as int?;
  @override
  set day(int? value) => RealmObjectBase.set(this, 'day', value);

  @override
  int? get hour => RealmObjectBase.get<int>(this, 'hour') as int?;
  @override
  set hour(int? value) => RealmObjectBase.set(this, 'hour', value);

  @override
  int? get miniute => RealmObjectBase.get<int>(this, 'miniute') as int?;
  @override
  set miniute(int? value) => RealmObjectBase.set(this, 'miniute', value);

  @override
  int? get itemLevel => RealmObjectBase.get<int>(this, 'itemLevel') as int?;
  @override
  set itemLevel(int? value) => RealmObjectBase.set(this, 'itemLevel', value);

  @override
  RealmList<String> get characterIdList =>
      RealmObjectBase.get<String>(this, 'characterIdList') as RealmList<String>;
  @override
  set characterIdList(covariant RealmList<String> value) =>
      throw RealmUnsupportedSetError();

  @override
  RealmList<String> get characterNameList =>
      RealmObjectBase.get<String>(this, 'characterNameList')
          as RealmList<String>;
  @override
  set characterNameList(covariant RealmList<String> value) =>
      throw RealmUnsupportedSetError();

  @override
  RealmList<String> get characterGuildNameList =>
      RealmObjectBase.get<String>(this, 'characterGuildNameList')
          as RealmList<String>;
  @override
  set characterGuildNameList(covariant RealmList<String> value) =>
      throw RealmUnsupportedSetError();

  @override
  RealmList<String> get characterServerIdList =>
      RealmObjectBase.get<String>(this, 'characterServerIdList')
          as RealmList<String>;
  @override
  set characterServerIdList(covariant RealmList<String> value) =>
      throw RealmUnsupportedSetError();

  @override
  RealmList<int> get characterItemLevelList =>
      RealmObjectBase.get<int>(this, 'characterItemLevelList')
          as RealmList<int>;
  @override
  set characterItemLevelList(covariant RealmList<int> value) =>
      throw RealmUnsupportedSetError();

  @override
  RealmList<int> get characterFameList =>
      RealmObjectBase.get<int>(this, 'characterFameList') as RealmList<int>;
  @override
  set characterFameList(covariant RealmList<int> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<Calendar>> get changes =>
      RealmObjectBase.getChanges<Calendar>(this);

  @override
  Calendar freeze() => RealmObjectBase.freezeObject<Calendar>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Calendar._);
    return const SchemaObject(ObjectType.realmObject, Calendar, 'Calendar', [
      SchemaProperty('date', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('year', RealmPropertyType.int, optional: true),
      SchemaProperty('month', RealmPropertyType.int, optional: true),
      SchemaProperty('day', RealmPropertyType.int, optional: true),
      SchemaProperty('hour', RealmPropertyType.int, optional: true),
      SchemaProperty('miniute', RealmPropertyType.int, optional: true),
      SchemaProperty('itemLevel', RealmPropertyType.int, optional: true),
      SchemaProperty('characterIdList', RealmPropertyType.string,
          collectionType: RealmCollectionType.list),
      SchemaProperty('characterNameList', RealmPropertyType.string,
          collectionType: RealmCollectionType.list),
      SchemaProperty('characterGuildNameList', RealmPropertyType.string,
          collectionType: RealmCollectionType.list),
      SchemaProperty('characterServerIdList', RealmPropertyType.string,
          collectionType: RealmCollectionType.list),
      SchemaProperty('characterItemLevelList', RealmPropertyType.int,
          collectionType: RealmCollectionType.list),
      SchemaProperty('characterFameList', RealmPropertyType.int,
          collectionType: RealmCollectionType.list),
    ]);
  }
}
