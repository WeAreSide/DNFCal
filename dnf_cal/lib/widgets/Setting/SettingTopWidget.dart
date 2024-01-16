import 'package:flutter/material.dart';
import '../../models/CustomColor.dart';

class SettingTopWidget extends StatelessWidget {
  const SettingTopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 41,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Expanded(
              child: Align(
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
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '설정',
                  style: TextStyle(
                    color: CustomColor.uncommon(),
                    fontSize: 16,
                    fontFamily: 'DNFForgedBlade',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}