import 'dart:developer';

import 'package:dnf_cal/models/CustomColor.dart';
import 'package:flutter/material.dart';

class CharacterSearchBar extends StatefulWidget {
  const CharacterSearchBar({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CharacterSearchState();
  }
}

class _CharacterSearchState extends State<CharacterSearchBar> {

  String inputText = "";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, left: 20, right: 20),
      child: SizedBox(
        height: 40,
        child: TextField(
          onChanged: (text) {
            setState(() {
              inputText = text;
            });
          },
          onSubmitted: (text) {
            print("검색: $inputText");
          },
          decoration: InputDecoration(
            hintText: '모험단 이름',
            suffixIcon: const Icon(Icons.search),
            filled: true,
            fillColor: const Color(0xffD9D9D9).withOpacity(0.6),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(24),
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 18), // Adjust as needed
          ),
          style: const TextStyle(
            fontFamily: 'DNFForgedBlade', // Replace with your custom font family
            fontSize: 16, // Adjust the font size as needed
            // Other text style properties
          ),
        ),
      ),
    );
  }
}