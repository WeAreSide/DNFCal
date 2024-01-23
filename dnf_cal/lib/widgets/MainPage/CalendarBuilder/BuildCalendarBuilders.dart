import 'package:dnf_cal/models/CustomColor.dart';
import 'package:dnf_cal/widgets/global/DnfText.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

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
        return Positioned(
          bottom: 3,
          child: DnfText(
            '${events[0]}',
            color: levelColor,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        );
      }
      return Container();
    },
  );
}
