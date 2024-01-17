import 'package:dnf_cal/models/CustomColor.dart';
import 'package:dnf_cal/models/SearchCharacterModel.dart';
import 'package:flutter/material.dart';
import 'package:dnf_cal/widgets/global/DnfText.dart';

class SearchCharacterCell extends StatefulWidget {

  SearchCharacterModel character;
  SearchCharacterCell({required this.character});

  @override
  _SearchCharacterCellState createState() => _SearchCharacterCellState(character: character);
}

class _SearchCharacterCellState extends State<SearchCharacterCell> {
  SearchCharacterModel character;
  _SearchCharacterCellState({required this.character});
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          isPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          isPressed = false;
        });
        // Handle button click here
      },
      onTapCancel: () {
        setState(() {
          isPressed = false;
        });
      },
      child: AnimatedOpacity(
        opacity: isPressed ? 0.8 : 1.0,
        duration: Duration(milliseconds: 200),
        child: Stack(
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/images/character_background.png'),
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(color: CustomColor.buttonStroke(), width: 1),
                  borderRadius: BorderRadius.circular(16.0)),
            ),
            Row(
              children: [
                Container(
                  height: 100,
                  child: Padding(
                    padding:
                    EdgeInsets.only(left: 12, top: 12, bottom: 12, right: 36),
                    child: Image.network(
                      'https://img-api.neople.co.kr/df/servers/${character.serverId}/characters/${character.characterId}?zoom=2',
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                Column(
                  children: [
                    DnfText(
                      "${character.level}Lv. ${character.characterName}",
                      fontSize: 18,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 0),
                      child: DnfText(
                        "${character.jobName}",
                        fontSize: 10,
                      ),
                    ),
                    DnfText(
                      "${character.serverId} 명성 ${character.fame == null ? 0 : character.fame}",
                      color: CustomColor.epic(),
                      fontSize: 10,
                    ),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}