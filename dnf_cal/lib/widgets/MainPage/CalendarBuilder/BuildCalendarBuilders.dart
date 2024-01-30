import 'package:dnf_cal/models/CustomColor.dart';
import 'package:dnf_cal/widgets/global/DnfText.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:provider/provider.dart';
import 'package:realm/realm.dart';
import 'package:dnf_cal/realm/Character.dart';
import 'package:dnf_cal/models/RegisterCharacterModel.dart';
import 'package:dnf_cal/realm/Calendar.dart';
import 'package:dnf_cal/screens/PastCharacterInfoPage.dart';

CalendarBuilders buildCalendarBuilders() {
  return CalendarBuilders(
    defaultBuilder: (context, day, focusedDay) {
      return Container(
        decoration: BoxDecoration(
          color: Color(0x10ffffff),
        ),
        child: Container(
          margin: EdgeInsets.only(top: 1),
          decoration: BoxDecoration(
            color: Color(0xff0f172f),
          ),
          child: Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: DnfText(
                '${day.day}',
              ),
            ),
          ),
        ),
      );
    },
    todayBuilder: (context, day, focusedDay) {
      return Container(
        decoration: BoxDecoration(
          color: Color(0x0fffffff),
        ),
        child: Container(
          margin: EdgeInsets.only(top: 1),
          decoration: BoxDecoration(
            color: Color(0xff0f172f),
          ),
          child: Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: DnfText(
                '${day.day}',
              ),
            ),
          ),
        ),
      );
    },
    outsideBuilder: (context, day, focusedDay) {
      return Container(
        decoration: BoxDecoration(
          color: Color(0x0fffffff),
        ),
        child: Container(
          margin: EdgeInsets.only(top: 1),
          decoration: BoxDecoration(
            color: Color(0xff0f172f),
          ),
          child: Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: DnfText(
                '${day.day}',
                color: CustomColor.darkGray(),
              ),
            ),
          ),
        ),
      );
    },
    markerBuilder: (context, day, events) {
      if (events.isNotEmpty) {
        int levelValue = int.parse(events[0].toString()) ~/ 120;

        Color levelColor;
        switch (levelValue) {
          case 0:
            levelColor = CustomColor.common();
            break;
          case 1:
            levelColor = CustomColor.uncommon();
            break;
          case 2:
            levelColor = CustomColor.rare();
            break;
          case 3:
            levelColor = CustomColor.unique();
            break;
          case 4:
            levelColor = CustomColor.epic();
            break;
          default:
            levelColor = Colors.red;
        }
        return Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              // realm 에서 해당 날짜의 캘린더 정보를 가져온다.
              Realm realm = context.read<RegisterCharacterModel>().realm;
              Calendar? calendar =
                  realm.find<Calendar>('${day.year}-${day.month}-${day.day}');
              if (calendar == null) {
                return;
              }
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PastCharacterInfoPage(
                    date: day,
                    characterIdList: calendar.characterIdList,
                    characterFameList: calendar.characterFameList,
                    characterItemLevelList: calendar.characterItemLevelList,
                    characterGuildNameList: calendar.characterGuildNameList,
                    characterNameList: calendar.characterNameList,
                    serverIdList: calendar.characterServerIdList,
                  ),
                ),
              );
            },
            child: Stack(
              children: [
                Positioned.fill(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Center(
                      child: DnfText(
                        '${events[0]}',
                        color: levelColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }
      return Container();
    },
  );
}
