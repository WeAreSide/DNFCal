import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class BottomNavigationWidget extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onNavTapped;

  const BottomNavigationWidget({
    required this.selectedIndex,
    required this.onNavTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      fixedColor: Colors.blue,
      unselectedItemColor: Colors.blueGrey,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_month),
          label: '성장달력',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: '등록된 캐릭터',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.search),
          label: '캐릭터 검색',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings_outlined),
          label: '설정',
        ),
      ],
      currentIndex: selectedIndex,
      onTap: onNavTapped,
    );
  }
}
