import 'package:dnf_cal/models/CustomColor.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    return Container(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Container(
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: statusBarHeight + 44,
              ),
              AdventureInfo(),
              SizedBox(
                height: 56,
              ),
              CalendarSpace(),
            ],
          ),
        ),
      ),
    );
  }
}

// 모험단 정보를 표시하는 공간
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
                  child: Text(
                    '모험단 이름',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'DNFForgedBlade',
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '등록된 캐릭터: 1개',
                    style: TextStyle(
                        color: CustomColor.chronicle(),
                        fontSize: 10,
                        fontFamily: 'DNFForgedBlade',
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '최근 갱신 날짜: 2024-01-10-12:12',
                    style: TextStyle(
                        color: CustomColor.legendary(),
                        fontSize: 10,
                        fontFamily: 'DNFForgedBlade',
                        fontWeight: FontWeight.w500),
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
          headerStyle: HeaderStyle(
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
              fontSize: 16,
              fontFamily: 'DNFForgedBlade',
              fontWeight: FontWeight.w500,
            ),
          ),
          daysOfWeekStyle: DaysOfWeekStyle(
            decoration: BoxDecoration(
              color: Color(0xff0f172f),
            ),
            weekdayStyle: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontFamily: 'DNFForgedBlade',
              fontWeight: FontWeight.w500,
            ),
            weekendStyle: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontFamily: 'DNFForgedBlade',
              fontWeight: FontWeight.w500,
            ),
          ),
          calendarStyle: CalendarStyle(
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
          ),
          eventLoader: (day) => _itemLevel[day] ?? [],
          calendarBuilders: CalendarBuilders(
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
                  child: Text(
                    '${events[0]}',
                    style: TextStyle(
                      color: levelColor,
                      fontSize: 12,
                      fontFamily: 'DNFForgedBlade',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
