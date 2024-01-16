import 'package:dnf_cal/models/CustomColor.dart';
import 'package:dnf_cal/widgets/RegisterCharacterPage/DeleteRegisterCharacterButton.dart';
import 'package:dnf_cal/widgets/global/DnfText.dart';
import 'package:flutter/material.dart';

class CharacterProfile extends StatelessWidget {
  final bool isEditing;
  final VoidCallback onDelete;
  final int id;
  const CharacterProfile({
    Key? key,
    required this.isEditing,
    required this.onDelete,
    required this.id,
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
          isEditing
              ? DeleteRegisterCharacterButton(context, onDelete: onDelete)
              : SizedBox(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 7),
            child: Container(
              color: Colors.transparent,
              child: Column(
                children: [
                  _GuildNameWidget(),
                  _FameWidget(),
                  _CharacterImageWidget(),
                  _CharacterNameWidget(),
                  _TotalItemLevelWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _GuildNameWidget() {
    return Container(
      margin: EdgeInsets.only(bottom: 4),
      child: DnfText(
        '[길드 이름]',
        fontSize: 6,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget _FameWidget() {
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
            '명성 수치',
            color: CustomColor.epic(),
            fontSize: 6,
          ),
        ],
      ),
    );
  }

  Widget _CharacterImageWidget() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/dummy_character.png'),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  Widget _CharacterNameWidget() {
    return Container(
      margin: EdgeInsets.only(top: 4),
      child: DnfText(
        '캐릭터 이름',
        fontSize: 8,
      ),
    );
  }

  Widget _TotalItemLevelWidget() {
    return Container(
      margin: EdgeInsets.only(top: 4, bottom: 4),
      child: DnfText(
        '총합 템레벨',
        color: CustomColor.epic(),
        fontSize: 6,
      ),
    );
  }
}
