import 'package:realm/realm.dart';

part 'Chracter.g.dart';

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
