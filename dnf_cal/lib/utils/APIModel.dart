import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';


class APIModel {

  static void getServer(String characterName) async {
    String apikey = dotenv.env['appKey'] ?? "";
    String baseUrl = "https://api.neople.co.kr";
    try {
      var response = await Dio().get(
          '$baseUrl/df/servers/all/characters?characterName=$characterName&apikey=$apikey');
      if (response.statusCode == 200) {
        String result = response.data.toString();
        print("result:... $result");
      }
    } catch (e) {
      print(e);
    }
  }
}
