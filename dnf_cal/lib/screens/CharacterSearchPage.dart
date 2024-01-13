import 'package:dnf_cal/main.dart';
import 'package:dnf_cal/models/CustomColor.dart';
import 'package:flutter/material.dart';

class CharacterSearchPage extends StatefulWidget {
  const CharacterSearchPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CharacterSearchPageState();
  }
}

class _CharacterSearchPageState extends State<CharacterSearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child:
        GestureDetector(
            child: Text(
                '캐릭터 검색 페이지',
                style: TextStyle(color: CustomColor.epic()),

            )
        )
      ),

    );
  }
}