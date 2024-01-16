import 'package:flutter/material.dart';
import '../../models/CustomColor.dart';
import '../global/DnfText.dart';

class OpenSourceNavigationBar extends StatelessWidget {
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
                '오픈소스 라이브러리',
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
