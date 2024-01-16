import 'package:dnf_cal/models/CustomColor.dart';
import 'package:flutter/material.dart';
import 'package:dnf_cal/widgets/global/DnfText.dart';

class CharacterSearchPageTopWidget extends StatelessWidget {
  const CharacterSearchPageTopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20),
      child: SizedBox(
        height: 41,
        child: Row(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 30,
                height: 30,
                decoration: ShapeDecoration(
                  color: Color(0xFFD9D9D9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: DnfText(
                  '모험단 정보를 검색하세요',
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
