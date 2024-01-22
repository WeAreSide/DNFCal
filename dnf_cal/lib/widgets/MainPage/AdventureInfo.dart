import 'package:dnf_cal/models/CustomColor.dart';
import 'package:dnf_cal/widgets/global/DnfText.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/RegisterCharacterModel.dart';

class AdventureInfo extends StatelessWidget {
  const AdventureInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String adventurerName;
    final int characterCount;
    if (context.watch<RegisterCharacterModel>().isEmpty ||
        context.watch<RegisterCharacterModel>().characterList.isEmpty) {
      adventurerName = "등록된 캐릭터가 없습니다.";
      characterCount = 0;
    } else {
      adventurerName = context
              .read<RegisterCharacterModel>()
              .characterList
              .first
              .adventureName ??
          "등록된 캐릭터가 없습니다.";
      characterCount =
          context.read<RegisterCharacterModel>().characterList.length;
    }

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
      child: Stack(
        children: [
          Positioned(
            right: 0,
            child: Container(
              width: 97,
              height: 97,
              color: Colors.transparent,
              child: Center(
                child: IconButton(
                  onPressed: () {
                    context
                        .read<RegisterCharacterModel>()
                        .updateCharacterList();
                    context.read<RegisterCharacterModel>().loadItemLevel();
                  },
                  icon: Icon(
                    Icons.refresh,
                    size: 37,
                    color: CustomColor.darkGray(),
                  ),
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
                    child: DnfText(adventurerName)),
                SizedBox(
                  height: 12,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: DnfText(
                    '등록된 캐릭터: ${characterCount}개',
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
                    '최근 갱신 날짜: ${context.watch<RegisterCharacterModel>().lastUpdate}',
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
