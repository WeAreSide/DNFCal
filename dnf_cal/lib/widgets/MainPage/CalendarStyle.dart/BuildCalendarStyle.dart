import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

CalendarStyle buildCalendarStyle() {
  return CalendarStyle(
    rowDecoration: BoxDecoration(
      color: Color(0xff0f172f),
    ),
    weekendTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 12,
      fontFamily: 'DNFForgedBlade',
      fontWeight: FontWeight.w500,
    ),
    defaultTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 12,
      fontFamily: 'DNFForgedBlade',
      fontWeight: FontWeight.w500,
    ),
    selectedTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 12,
      fontFamily: 'DNFForgedBlade',
      fontWeight: FontWeight.w500,
    ),
    todayTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 12,
      fontFamily: 'DNFForgedBlade',
      fontWeight: FontWeight.w500,
    ),
    outsideTextStyle: TextStyle(
      color: Color(0xff64748B),
      fontSize: 12,
      fontFamily: 'DNFForgedBlade',
      fontWeight: FontWeight.w500,
    ),
    todayDecoration: BoxDecoration(
      color: Color(0xff0f172f),
      shape: BoxShape.circle,
    ),
  );
}
