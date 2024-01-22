import 'package:dnf_cal/models/CustomColor.dart';
import 'package:dnf_cal/widgets/MainPage/CalendarBuilder/BuildCalendarBuilders.dart';
import 'package:dnf_cal/widgets/MainPage/CalendarStyle.dart/BuildCalendarStyle.dart';
import 'package:dnf_cal/widgets/MainPage/CalendarStyle.dart/BuildDaysOfWeekStyle.dart';
import 'package:dnf_cal/widgets/MainPage/CalendarStyle.dart/BuildHeaderStyle.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:dnf_cal/widgets/global/DnfText.dart';
import 'package:provider/provider.dart';
import 'package:realm/realm.dart';
import 'package:dnf_cal/realm/Character.dart';
import 'package:dnf_cal/models/RegisterCharacterModel.dart';

class CalendarSpace extends StatefulWidget {
  const CalendarSpace({Key? key}) : super(key: key);

  @override
  State<CalendarSpace> createState() => _CalendarSpaceState();
}

class _CalendarSpaceState extends State<CalendarSpace> {
  // Calendar DB의 데이터를 Map으로 저장
  @override
  Widget build(BuildContext context) {
    final Map<DateTime, List> _itemLevel =
        context.watch<RegisterCharacterModel>().itemLevel;
    return Expanded(
      child: Center(
        child: TableCalendar(
          firstDay: DateTime.utc(2021, 1, 1),
          lastDay: DateTime.utc(2025, 12, 31),
          focusedDay: DateTime.now(),
          headerStyle: buildHeaderStyle(),
          daysOfWeekStyle: buildDaysOfWeekStyle(),
          calendarStyle: buildCalendarStyle(),
          eventLoader: (day) => _itemLevel[day] ?? [],
          calendarBuilders: buildCalendarBuilders(),
        ),
      ),
    );
  }
}
