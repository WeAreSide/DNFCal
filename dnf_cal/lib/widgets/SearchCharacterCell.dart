import 'package:dnf_cal/models/CustomColor.dart';
import 'package:flutter/material.dart';

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
                Text(
                  "100Lv. 캐릭터 이름",
                  style: TextStyle(
                    color: CustomColor.uncommon(),
                    fontSize: 18,
                    fontFamily: 'DNFForgedBlade',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 0),
                  child: Text(
                    "직업 이름",
                    style: TextStyle(
                      color: CustomColor.uncommon(),
                      fontSize: 10,
                      fontFamily: 'DNFForgedBlade',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Text(
                  "명성",
                  style: TextStyle(
                    color: CustomColor.epic(),
                    fontSize: 10,
                    fontFamily: 'DNFForgedBlade',
                    fontWeight: FontWeight.w500,
                  ),
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
