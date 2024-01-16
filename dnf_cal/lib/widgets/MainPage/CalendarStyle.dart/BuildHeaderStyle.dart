import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

HeaderStyle buildHeaderStyle() {
  return HeaderStyle(
    decoration: BoxDecoration(
      color: Color(0xff0f172f),
    ),
    titleCentered: true,
    formatButtonVisible: false,
    leftChevronIcon: Icon(
      Icons.chevron_left,
      color: Colors.white,
    ),
    rightChevronIcon: Icon(
      Icons.chevron_right,
      color: Colors.white,
    ),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 14,
      fontFamily: 'DNFForgedBlade',
      fontWeight: FontWeight.w700,
    ),
  );
}
