// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Character.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Character extends $Character
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
