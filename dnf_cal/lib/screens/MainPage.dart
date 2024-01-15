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
    return Container(
      color: Colors.grey[400],
      child: Padding(
        padding:
            const EdgeInsets.only(left: 12, right: 12, top: 54, bottom: 40),
        child: Container(
          color: Colors.grey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: 44,
              ),
              AdventureInfo(),
              SizedBox(
                height: 56,
              ),
              CalendarSpace(),
              RefreshButton(),
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
        borderRadius: BorderRadius.circular(10),
        color: Colors.red,
      ),
      height: 97,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '모험단 정보',
                style: TextStyle(
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
                    fontSize: 10,
                    fontFamily: 'DNFForgedBlade',
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
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

// 즉시 갱신 버튼, 현재는 버튼 효과가 없고 눌러도 아무런 변화가 없음
class RefreshButton extends StatelessWidget {
  const RefreshButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.green,
      ),
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: 54,
      child: Center(
        child: Text('즉시 갱신하기'),
      ),
    );
  }
}
