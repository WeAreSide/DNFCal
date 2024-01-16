import 'package:dnf_cal/models/CustomColor.dart';
import 'package:dnf_cal/widgets/global/DnfText.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

CalendarBuilders buildCalendarBuilders() {
  return CalendarBuilders(
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
          bottom: 1,
          child: DnfText(
            '${events[0]}',
            color: levelColor,
          ),
        );
      }
      return Container();
    },
  );
}
