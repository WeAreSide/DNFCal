import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

DaysOfWeekStyle buildDaysOfWeekStyle() {
  return DaysOfWeekStyle(
    decoration: BoxDecoration(
      color: Color(0xff0f172f),
    ),
    weekdayStyle: TextStyle(
      color: Colors.white,
      fontSize: 12,
      fontFamily: 'DNFForgedBlade',
      fontWeight: FontWeight.w300,
    ),
    weekendStyle: TextStyle(
      color: Colors.white,
      fontSize: 12,
      fontFamily: 'DNFForgedBlade',
      fontWeight: FontWeight.w300,
    ),
  );
}
