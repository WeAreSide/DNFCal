// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Character.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Character extends _Character
    with RealmEntity, RealmObjectBase, RealmObject {
  Character(
    String characterId, {
    String? characterName,
    String? serverId,
    int? level,
    String? jobId,
    String? jobGrowId,
    String? jobName,
    String? jobGrowName,
    int? fame,
    String? adventureName,
    String? guildName,
    int? totalItemLevel,
  }) {
    RealmObjectBase.set(this, 'characterId', characterId);
    RealmObjectBase.set(this, 'characterName', characterName);
    RealmObjectBase.set(this, 'serverId', serverId);
    RealmObjectBase.set(this, 'level', level);
    RealmObjectBase.set(this, 'jobId', jobId);
    RealmObjectBase.set(this, 'jobGrowId', jobGrowId);
    RealmObjectBase.set(this, 'jobName', jobName);
    RealmObjectBase.set(this, 'jobGrowName', jobGrowName);
    RealmObjectBase.set(this, 'fame', fame);
    RealmObjectBase.set(this, 'adventureName', adventureName);
    RealmObjectBase.set(this, 'guildName', guildName);
    RealmObjectBase.set(this, 'totalItemLevel', totalItemLevel);
  }

  Character._();

  @override
  String get characterId =>
      RealmObjectBase.get<String>(this, 'characterId') as String;
  @override
  set characterId(String value) => throw RealmUnsupportedSetError();

  @override
  String? get characterName =>
      RealmObjectBase.get<String>(this, 'characterName') as String?;
  @override
  set characterName(String? value) =>
      RealmObjectBase.set(this, 'characterName', value);

  @override
  String? get serverId =>
      RealmObjectBase.get<String>(this, 'serverId') as String?;
  @override
  set serverId(String? value) => RealmObjectBase.set(this, 'serverId', value);

  @override
  int? get level => RealmObjectBase.get<int>(this, 'level') as int?;
  @override
  set level(int? value) => RealmObjectBase.set(this, 'level', value);

  @override
  String? get jobId => RealmObjectBase.get<String>(this, 'jobId') as String?;
  @override
  set jobId(String? value) => RealmObjectBase.set(this, 'jobId', value);

  @override
  String? get jobGrowId =>
      RealmObjectBase.get<String>(this, 'jobGrowId') as String?;
  @override
  set jobGrowId(String? value) => RealmObjectBase.set(this, 'jobGrowId', value);

  @override
  String? get jobName =>
      RealmObjectBase.get<String>(this, 'jobName') as String?;
  @override
  set jobName(String? value) => RealmObjectBase.set(this, 'jobName', value);

  @override
  String? get jobGrowName =>
      RealmObjectBase.get<String>(this, 'jobGrowName') as String?;
  @override
  set jobGrowName(String? value) =>
      RealmObjectBase.set(this, 'jobGrowName', value);

  @override
  int? get fame => RealmObjectBase.get<int>(this, 'fame') as int?;
  @override
  set fame(int? value) => RealmObjectBase.set(this, 'fame', value);

  @override
  String? get adventureName =>
      RealmObjectBase.get<String>(this, 'adventureName') as String?;
  @override
  set adventureName(String? value) =>
      RealmObjectBase.set(this, 'adventureName', value);

  @override
  String? get guildName =>
      RealmObjectBase.get<String>(this, 'guildName') as String?;
  @override
  set guildName(String? value) => RealmObjectBase.set(this, 'guildName', value);

  @override
  int? get totalItemLevel =>
      RealmObjectBase.get<int>(this, 'totalItemLevel') as int?;
  @override
  set totalItemLevel(int? value) =>
      RealmObjectBase.set(this, 'totalItemLevel', value);

  @override
  Stream<RealmObjectChanges<Character>> get changes =>
      RealmObjectBase.getChanges<Character>(this);

  @override
  Character freeze() => RealmObjectBase.freezeObject<Character>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Character._);
    return const SchemaObject(ObjectType.realmObject, Character, 'Character', [
      SchemaProperty('characterId', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('characterName', RealmPropertyType.string, optional: true),
      SchemaProperty('serverId', RealmPropertyType.string, optional: true),
      SchemaProperty('level', RealmPropertyType.int, optional: true),
      SchemaProperty('jobId', RealmPropertyType.string, optional: true),
      SchemaProperty('jobGrowId', RealmPropertyType.string, optional: true),
      SchemaProperty('jobName', RealmPropertyType.string, optional: true),
      SchemaProperty('jobGrowName', RealmPropertyType.string, optional: true),
      SchemaProperty('fame', RealmPropertyType.int, optional: true),
      SchemaProperty('adventureName', RealmPropertyType.string, optional: true),
      SchemaProperty('guildName', RealmPropertyType.string, optional: true),
      SchemaProperty('totalItemLevel', RealmPropertyType.int, optional: true),
    ]);
  }
}

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
  }) {
    RealmObjectBase.set(this, 'date', date);
    RealmObjectBase.set(this, 'year', year);
    RealmObjectBase.set(this, 'month', month);
    RealmObjectBase.set(this, 'day', day);
    RealmObjectBase.set(this, 'hour', hour);
    RealmObjectBase.set(this, 'miniute', miniute);
    RealmObjectBase.set(this, 'itemLevel', itemLevel);
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
    ]);
  }
}
