import 'dart:convert';

import 'package:dnf_cal/models/RegisterCharacterModel.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:realm/realm.dart';
import 'package:dnf_cal/realm/Character.dart';
import 'package:dnf_cal/realm/Calendar.dart';

import '../models/SearchCharacterModel.dart';

class APIModel {
  static Future<List<SearchCharacterModel>> fetchDataFromApi(
      String characterName, String serverId) async {
    String apikey = dotenv.env['appKey'] ?? "";
    String baseUrl = "https://api.neople.co.kr";
    try {
      var response = await Dio().get(
          '$baseUrl/df/servers/$serverId/characters?characterName=$characterName&limit=20&wordType=full&apikey=$apikey');
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = response.data;
        final CharacterListResponse characterListResponse =
            CharacterListResponse.fromJson(jsonResponse);
        final List<SearchCharacterModel> characters =
            characterListResponse.rows;
        print("APIMODEL: ${characters.toString()}");
        return characters;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to parse');
    }
  }

  static Future<void> fetchCharacterFromApi(SearchCharacterModel info) async {
    String apikey = dotenv.env['appKey'] ?? "";
    String baseUrl = "https://api.neople.co.kr";
    try {
      var response = await Dio().get(
          '$baseUrl/df/servers/${info.serverId}/characters/${info.characterId}/equip/equipment?apikey=$apikey');
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = response.data;
        var config = Configuration.local([Character.schema, Calendar.schema]);
        var realm = Realm(config);

        // db에 캐릭터가 있는지 확인
        var character = realm.find<Character>(info.characterId);
        if (character == null) {
          character = Character(info.characterId);
          character.characterName = info.characterName;
          character.serverId = info.serverId;
          character.level = info.level;
          character.jobId = info.jobId;
          character.jobGrowId = info.jobGrowId;
          character.jobName = info.jobName;
          character.jobGrowName = info.jobGrowName;
          character.fame = info.fame ?? 0;
          character.adventureName = jsonResponse['adventureName'];
          character.guildName = jsonResponse['guildName'];
          character.totalItemLevel =
              calculateTotalItemLevel(jsonResponse) as int;
          realm.write(() {
            realm.add(character as Character);
          });
        } else {
          // 있다면 새로운 정보로 갱신
          realm.write(() {
            character?.characterName = info.characterName;
            character?.serverId = info.serverId;
            character?.level = info.level;
            character?.jobId = info.jobId;
            character?.jobGrowId = info.jobGrowId;
            character?.jobName = info.jobName;
            character?.jobGrowName = info.jobGrowName;
            character?.fame = info.fame ?? 0;
            character?.adventureName = jsonResponse['adventureName'];
            character?.guildName = jsonResponse['guildName'];
            character?.totalItemLevel =
                calculateTotalItemLevel(jsonResponse) as int;
          });
        }

        var characters = realm.all<Character>();
        Character myCharacter = characters[0];
        for (var character in characters) {
          print(
              "APIMODEL: ${character.characterId}, ${character.characterName}, ${character.level}, ${character.jobId}, ${character.jobGrowId}, ${character.jobName}, ${character.jobGrowName}, ${character.fame}, ${character.adventureName}, ${character.guildName}, ${character.totalItemLevel}");
        }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to parse');
    }
  }

  static num calculateTotalItemLevel(Map<String, dynamic> jsonResponse) {
    num totalItemLevel = 0;
    // level을 받아 올 수 있는 부위의 slotId 배열
    List<String> SlotId = [
      'WEAPON',
      'JACKET',
      'SHOULDER',
      'PANTS',
      'SHOES',
      'WAIST',
      'AMULET',
      'WRIST',
      'RING',
      'SUPPORT',
      'MAGIC_STON',
      'EARRING',
    ];
    // jsonResponse['equipment']는 List<Map<String, dynamic>> 형태
    // 각 아이템의 slotId를 확인하여 level을 더함
    for (var item in jsonResponse['equipment']) {
      if (SlotId.contains(item['slotId'])) {
        // item에는 customOption 또는 fixedOption이 있고, 둘 중 하나만 있음
        // customOption이 있으면 customOption의 level을 더하고, fixedOption이 있으면 fixedOption의 level을 더함
        // item['itemAvailableLevel']이 110이 아니면 더하지 않음
        if (item['itemAvailableLevel'] == 110) {
          if (item['customOption'] != null) {
            totalItemLevel += item['customOption']['level'] as num;
          } else if (item['fixedOption'] != null) {
            totalItemLevel += item['fixedOption']['level'] as num;
          }
        } else if (item['itemName'] != null &&
            item['itemName'].startsWith("불가침의 영역")) {
          num level = item['customOption']['level'] as num;
          if (level > 60) totalItemLevel += (level - 60) * 4;
        }
      }
    }
    return totalItemLevel;
  }
}
