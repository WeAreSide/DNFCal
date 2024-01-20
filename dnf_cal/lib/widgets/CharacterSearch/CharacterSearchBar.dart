import 'dart:developer';

import 'package:dnf_cal/models/CustomColor.dart';
import 'package:dnf_cal/models/SearchModel.dart';
import 'package:dnf_cal/utils/APIModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/SearchCharacterModel.dart';

class CharacterSearchBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CharacterSearchState();
  }
}

class _CharacterSearchState extends State<CharacterSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: SizedBox(
        height: 40,
        child: TextField(
          controller: context.read<SearchModel>().fieldText,
          onSubmitted: (text) async {
            await search(text);
            context.read<SearchModel>().setSubmitted(true);
          },
          decoration: InputDecoration(
            hintText: '캐릭터 이름',
            suffixIcon: const Icon(Icons.search),
            filled: true,
            fillColor: const Color(0xffD9D9D9).withOpacity(0.6),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(24),
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 18,
            ), // Adjust as needed
          ),
          style: const TextStyle(
            fontFamily:
                'DNFForgedBlade', // Replace with your custom font family
            fontSize: 16, // Adjust the font size as needed
            // Other text style properties
          ),
        ),
      ),
    );
  }

  Future<void> search(String text) async {
    try {
      context.read<SearchModel>().setSearchedCharacter([]);
      List<SearchCharacterModel> characterList =
          await APIModel.fetchDataFromApi(
              text, context.read<SearchModel>().selectedServerId);
      context.read<SearchModel>().setSearchedCharacter(characterList);
    } catch (e) {
      print("Error during search: $e");
    }
  }
}
