import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:dnf_cal/widgets/MainPage/PastCharacterInfoNavigationBar.dart';
import 'package:dnf_cal/realm/Character.dart';
import 'package:dnf_cal/widgets/RegisterCharacterPage/CharacterProfile.dart';

class PastCharacterInfoPage extends StatelessWidget {
  final DateTime date;
  final List<Character> characterList;
  const PastCharacterInfoPage({
    super.key,
    required this.date,
    required this.characterList,
  });

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/default_background.png'), // 배경 이미지
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
            color: Colors.black.withOpacity(0.5),
            child: Column(
              children: [
                SizedBox(
                  height: statusBarHeight + 16,
                ),
                PastCharacterInfoNavigationBar(date),
                Expanded(
                  child: GridView(
                    padding: EdgeInsets.only(top: 22, left: 22, right: 22),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 18,
                    ),
                    children: [
                      for (Character character in characterList)
                        CharacterProfile(character),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
