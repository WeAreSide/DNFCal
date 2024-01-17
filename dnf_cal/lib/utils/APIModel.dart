import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../models/SearchCharacterModel.dart';


class APIModel {
  static Future<List<SearchCharacterModel>> fetchDataFromApi(String characterName, String serverId) async {
    String apikey = dotenv.env['appKey'] ?? "";
    String baseUrl = "https://api.neople.co.kr";
    try {
      var response = await Dio().get(
          '$baseUrl/df/servers/$serverId/characters?characterName=$characterName&apikey=$apikey');
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = response.data;
        final CharacterListResponse characterListResponse =
        CharacterListResponse.fromJson(jsonResponse);
        final List<SearchCharacterModel> characters = characterListResponse.rows;
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
}
