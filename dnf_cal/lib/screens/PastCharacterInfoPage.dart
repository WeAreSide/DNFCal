import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:dnf_cal/widgets/MainPage/PastCharacterInfoNavigationBar.dart';
import 'package:dnf_cal/realm/Character.dart';
import 'package:dnf_cal/widgets/RegisterCharacterPage/CharacterProfile.dart';
import 'package:dnf_cal/widgets/global/DnfText.dart';
import 'package:dnf_cal/models/CustomColor.dart';

class PastCharacterInfoPage extends StatelessWidget {
  final DateTime date;
  final List<String> characterNameList;
  final List<String> characterGuildNameList;
  final List<int> characterItemLevelList;
  final List<int> characterFameList;
  final List<String> characterIdList;
  final List<String> serverIdList;
  const PastCharacterInfoPage({
    super.key,
    required this.date,
    required this.characterNameList,
    required this.characterGuildNameList,
    required this.characterItemLevelList,
    required this.characterFameList,
    required this.characterIdList,
    required this.serverIdList,
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
                      for (int i = 0; i < characterNameList.length; i++)
                        CharacterProfileByDate(
                          characterName: characterNameList[i],
                          characterGuildName: characterGuildNameList[i],
                          characterItemLevel: characterItemLevelList[i],
                          characterFame: characterFameList[i],
                          characterId: characterIdList[i],
                          serverId: serverIdList[i],
                        ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

class CharacterProfileByDate extends StatelessWidget {
  final String characterName;
  final String characterGuildName;
  final int characterItemLevel;
  final int characterFame;
  final String characterId;
  final String serverId;
  const CharacterProfileByDate({
    super.key,
    required this.characterName,
    required this.characterGuildName,
    required this.characterItemLevel,
    required this.characterFame,
    required this.characterId,
    required this.serverId,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage('assets/images/character_background.png'),
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.4),
            BlendMode.darken,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 7),
        child: Container(
          color: Colors.transparent,
          child: Column(
            children: [
              _GuildNameWidget(characterGuildName),
              _FameWidget(characterFame),
              _CharacterImageWidget(characterId, serverId),
              _CharacterNameWidget(characterName),
              _TotalItemLevelWidget(characterItemLevel),
            ],
          ),
        ),
      ),
    );
  }

  Widget _GuildNameWidget(String characterGuildName) {
    return Container(
      margin: EdgeInsets.only(bottom: 4),
      child: DnfText(
        '$characterGuildName',
        fontSize: 6,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget _FameWidget(int characterFame) {
    return Container(
      margin: EdgeInsets.only(bottom: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/fame_icon.png',
            width: 7,
          ),
          SizedBox(
            width: 1,
          ),
          DnfText(
            '$characterFame',
            color: CustomColor.epic(),
            fontSize: 6,
          ),
        ],
      ),
    );
  }

  Widget _CharacterImageWidget(String characterId, String serverId) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://img-api.neople.co.kr/df/servers/${serverId}/characters/${characterId}?zoom=2',
            ),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  Widget _CharacterNameWidget(String characterName) {
    return Container(
      margin: EdgeInsets.only(top: 4),
      child: DnfText(
        '${characterName}',
        fontSize: 8,
      ),
    );
  }

  Widget _TotalItemLevelWidget(int characterItemLevel) {
    Color color;

    if (characterItemLevel < 120) {
      color = CustomColor.common();
    } else if (characterItemLevel < 240) {
      color = CustomColor.uncommon();
    } else if (characterItemLevel < 360) {
      color = CustomColor.rare();
    } else if (characterItemLevel < 480) {
      color = CustomColor.unique();
    } else {
      color = CustomColor.epic();
    }
    return Container(
      margin: EdgeInsets.only(top: 4, bottom: 4),
      child: DnfText(
        '$characterItemLevel',
        color: color,
        fontSize: 6,
      ),
    );
  }
}
