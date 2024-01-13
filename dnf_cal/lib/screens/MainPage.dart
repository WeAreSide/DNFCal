import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 44, bottom: 40),
      child: Container(
        color: Colors.transparent,
        child: Column(
          children: [
            const SizedBox(
              height: 98,
            ),
            AdventureInfo(),
            const SizedBox(
              height: 56,
            ),
            CalendarSpace(),
            const SizedBox(
              height: 76,
            ),
            RefreshButton(),
          ],
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

// 달력 위젯 공간, 현재는 달력이 구현되어 있지 않고 공간만 할당, 남은 공간을 모두 사용함
class CalendarSpace extends StatelessWidget {
  const CalendarSpace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.blue,
        child: Center(
          child: Text('달력'),
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
