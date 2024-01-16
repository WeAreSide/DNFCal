import 'package:flutter/material.dart';
import '../global/DnfText.dart';

class SettingTopWidget extends StatelessWidget {
  const SettingTopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 41,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 30,
                height: 30,
                decoration: ShapeDecoration(
                  color: const Color(0xFFD9D9D9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: DnfText(
                '설정',
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
