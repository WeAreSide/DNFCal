import 'package:dnf_cal/models/CustomColor.dart';
import 'package:dnf_cal/widgets/MainPage/CalendarBuilder/BuildCalendarBuilders.dart';
import 'package:dnf_cal/widgets/MainPage/CalendarStyle.dart/BuildCalendarStyle.dart';
import 'package:dnf_cal/widgets/MainPage/CalendarStyle.dart/BuildDaysOfWeekStyle.dart';
import 'package:dnf_cal/widgets/MainPage/CalendarStyle.dart/BuildHeaderStyle.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:dnf_cal/widgets/global/DnfText.dart';

class CalendarSpace extends StatefulWidget {
  const CalendarSpace({Key? key}) : super(key: key);

  @override
  State<CalendarSpace> createState() => _CalendarSpaceState();
}

class _CalendarSpaceState extends State<CalendarSpace> {
  final Map<DateTime, List> _itemLevel = {
    DateTime.utc(2024, 1, 1): ['10'],
    DateTime.utc(2024, 1, 3): ['120'],
    DateTime.utc(2024, 1, 5): ['356'],
    DateTime.utc(2024, 1, 8): ['362'],
    DateTime.utc(2024, 1, 15): ['480'],
  };

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: TableCalendar(
          firstDay: DateTime.utc(2021, 1, 1),
          lastDay: DateTime.utc(2024, 12, 31),
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
