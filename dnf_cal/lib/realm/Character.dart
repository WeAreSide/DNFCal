import 'package:realm/realm.dart';

part 'Character.g.dart';

@RealmModel()
class _Character {
  @PrimaryKey()
  late final String characterId;

  String? characterName;
  String? serverId;
  int? level;
  String? jobId;
  String? jobGrowId;
  String? jobName;
  String? jobGrowName;
  int? fame;
  String? adventureName;
  String? guildName;
  int? totalItemLevel;
}

@RealmModel()
class _Calendar {
  @PrimaryKey()
  late final String date;

  int? year;
  int? month;
  int? day;
  int? hour;
  int? miniute;
  int? itemLevel;
}
