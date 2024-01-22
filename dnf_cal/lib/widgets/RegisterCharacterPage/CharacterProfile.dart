import 'dart:ffi';

import 'package:dnf_cal/models/CustomColor.dart';
import 'package:dnf_cal/models/RegisterCharacterModel.dart';
import 'package:dnf_cal/realm/Character.dart';
import 'package:dnf_cal/widgets/RegisterCharacterPage/DeleteRegisterCharacterButton.dart';
import 'package:dnf_cal/widgets/global/DnfText.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CharacterProfile extends StatelessWidget {
  final Character? character;
  const CharacterProfile(
    this.character, {
    Key? key,
  }) : super(key: key);

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
      child: Stack(
        children: [
          DeleteRegisterCharacterButton(
            context,
            character!.characterId ?? 'null',
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 7),
            child: Container(
              color: Colors.transparent,
              child: Column(
                children: [
                  _GuildNameWidget(character),
                  _FameWidget(character),
                  _CharacterImageWidget(character),
                  _CharacterNameWidget(character),
                  _TotalItemLevelWidget(character),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _GuildNameWidget(Character? character) {
    return Container(
      margin: EdgeInsets.only(bottom: 4),
      child: DnfText(
        '${character?.guildName ?? '길드 없음'}}',
        fontSize: 6,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget _FameWidget(Character? character) {
    return Container(
      margin: EdgeInsets.only(bottom: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.square,
            size: 6,
          ),
          SizedBox(
            width: 4,
          ),
          DnfText(
            '${character?.fame ?? 0}',
            color: CustomColor.epic(),
            fontSize: 6,
          ),
        ],
      ),
    );
  }

  Widget _CharacterImageWidget(Character? character) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://img-api.neople.co.kr/df/servers/${character?.serverId ?? 'cain'}/characters/${character?.characterId ?? 'null'}?zoom=2',
            ),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  Widget _CharacterNameWidget(Character? character) {
    return Container(
      margin: EdgeInsets.only(top: 4),
      child: DnfText(
        '${character?.characterName ?? '캐릭터 없음'}',
        fontSize: 8,
      ),
    );
  }

  Widget _TotalItemLevelWidget(Character? character) {
    Color color;

    if (character?.totalItemLevel == null) {
      color = CustomColor.common();
    } else if (character!.totalItemLevel! < 120) {
      color = CustomColor.common();
    } else if (character.totalItemLevel! < 240) {
      color = CustomColor.uncommon();
    } else if (character.totalItemLevel! < 360) {
      color = CustomColor.unique();
    } else if (character.totalItemLevel! < 480) {
      color = CustomColor.legendary();
    } else {
      color = CustomColor.epic();
    }
    return Container(
      margin: EdgeInsets.only(top: 4, bottom: 4),
      child: DnfText(
        '${character?.totalItemLevel ?? 0}',
        color: color,
        fontSize: 6,
      ),
    );
  }
}
