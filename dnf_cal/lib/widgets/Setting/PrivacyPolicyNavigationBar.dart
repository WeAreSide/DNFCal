import 'package:flutter/material.dart';
import '../../models/CustomColor.dart';

class PrivacyPolicyNavigationBar extends StatelessWidget {
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
              child: Text(
                '개인 정보 처리 방침',
                style: TextStyle(
                  color: CustomColor.common(),
                  fontSize: 16,
                  fontFamily: 'DNFForgedBlade',
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
