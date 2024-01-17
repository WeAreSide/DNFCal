import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

part "SearchCharacterModel.g.dart";

@JsonSerializable()
class SearchCharacterModel {
  String serverId = "all";
  String characterId = "";
  String characterName = "";
  int level = 0;
  String jobId = "";
  String jobGrowId = "";
  String jobName = "";
  String jobGrowName = "";
  int fame = 0;

  SearchCharacterModel(
      {required this.serverId,
      required this.characterId,
      required this.characterName,
      required this.level,
      required this.jobId,
      required this.jobGrowId,
      required this.jobName,
      required this.jobGrowName,
      required this.fame});

  factory SearchCharacterModel.fromJson(Map<String, dynamic> json) {
    return _$SearchCharacterModelFromJson(json);
  }
}
