import 'package:dnf_cal/models/CustomColor.dart';
import 'package:flutter/material.dart';

class CharacterSearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, left: 20, right: 20),
      child: Align(
        child: Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          height: 40,
          child: Row(
            children: [
              Text(
                '모험단 이름',
                style: TextStyle(
                  color: CustomColor.darkgray(),
                  fontSize: 14,
                  fontFamily: 'DNFForgedBlade',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          decoration: ShapeDecoration(
            color: Color(0x99D9D9D9),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),
        alignment: Alignment.center,
      ),
    );
  }
  

}