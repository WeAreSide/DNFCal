import 'package:dnf_cal/models/CustomColor.dart';
import 'package:dnf_cal/widgets/global/DnfText.dart';
import 'package:flutter/material.dart';

class AdventureInfo extends StatelessWidget {
  const AdventureInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.fromBorderSide(
          BorderSide(
            color: CustomColor.buttonStroke(),
            width: 1,
          ),
        ),
        borderRadius: BorderRadius.circular(10),
        color: Color(0xff0b1218),
      ),
      height: 97,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            child: Container(
              width: 97,
              height: 97,
              color: Colors.transparent,
              child: Center(
                child: Icon(
                  Icons.refresh,
                  size: 37,
                  color: CustomColor.darkGray(),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: DnfText('모험단 이름'),
                ),
                SizedBox(
                  height: 12,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: DnfText(
                    '등록된 캐릭터: 1개',
                    color: CustomColor.chronicle(),
                    fontSize: 10,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: DnfText(
                    '최근 갱신 날짜: 2024-01-10-12:12',
                    color: CustomColor.legendary(),
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
