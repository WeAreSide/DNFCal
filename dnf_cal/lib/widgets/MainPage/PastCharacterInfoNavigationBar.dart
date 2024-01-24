import 'package:flutter/material.dart';
import 'package:dnf_cal/models/CustomColor.dart';
import 'package:dnf_cal/widgets/global/DnfText.dart';

class PastCharacterInfoNavigationBar extends StatelessWidget {
  final DateTime date;
  const PastCharacterInfoNavigationBar(this.date, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: SizedBox(
        height: 41,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          // Align items vertically in the center
          children: [
            IconButton(
              color: CustomColor.common(),
              iconSize: 22,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: DnfText(
                '${date.year}년 ${date.month}월 ${date.day}일',
                fontSize: 16,
                decoration: TextDecoration.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
