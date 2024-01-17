// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SearchCharacterModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchCharacterModel _$SearchCharacterModelFromJson(
        Map<String, dynamic> json) =>
    SearchCharacterModel(
      serverId: json['serverId'] as String,
      characterId: json['characterId'] as String,
      characterName: json['characterName'] as String,
      level: json['level'] as int,
      jobId: json['jobId'] as String,
      jobGrowId: json['jobGrowId'] as String,
      jobName: json['jobName'] as String,
      jobGrowName: json['jobGrowName'] as String,
      fame: json['fame'] as int?,
    );

Map<String, dynamic> _$SearchCharacterModelToJson(
        SearchCharacterModel instance) =>
    <String, dynamic>{
      'serverId': instance.serverId,
      'characterId': instance.characterId,
      'characterName': instance.characterName,
      'level': instance.level,
      'jobId': instance.jobId,
      'jobGrowId': instance.jobGrowId,
      'jobName': instance.jobName,
      'jobGrowName': instance.jobGrowName,
      'fame': instance.fame,
    };

CharacterListResponse _$CharacterListResponseFromJson(
        Map<String, dynamic> json) =>
    CharacterListResponse(
      rows: (json['rows'] as List<dynamic>)
          .map((e) => SearchCharacterModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CharacterListResponseToJson(
        CharacterListResponse instance) =>
    <String, dynamic>{
      'rows': instance.rows,
    };
