import 'package:dnf_cal/models/CustomColor.dart';
import 'package:flutter/material.dart';
import 'package:dnf_cal/widgets/global/DnfText.dart';

class SearchCharacterCell extends StatelessWidget {
  const SearchCharacterCell({Key? key});

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                child: Image.asset(
                  'assets/images/dummy_character.png',
                ),
              ),
            ),
            Column(
              children: [
                DnfText(
                  "100Lv. 캐릭터 이름",
                  fontSize: 18,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 0),
                  child: DnfText(
                    "직업 이름",
                    fontSize: 10,
                  ),
                ),
                DnfText(
                  "명성",
                  color: CustomColor.epic(),
                  fontSize: 10,
                ),
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            )
          ],
        )
      ],
    );
  }
}
