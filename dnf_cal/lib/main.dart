import 'package:dnf_cal/screens/CharacterSearchPage.dart';
import 'package:dnf_cal/screens/MainPage.dart';
import 'package:dnf_cal/screens/RegisterCharacterPage.dart';
import 'package:dnf_cal/screens/SettingPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MemoApp',
      home: MyAppPage(),
    );
  }
}

// 기본 홈
class MyAppPage extends StatefulWidget {
  const MyAppPage({super.key});

  @override
  State<MyAppPage> createState() => MyAppState();
}

class MyAppState extends State<MyAppPage> {
  int _selectedIndex = 0;

  final List<Widget> _navIndex = [
    MainPage(),
    RegisterCharacterPage(),
    CharacterSearchPage(),
    SettingPage(),
  ];

  void _onNavTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _navIndex.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
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
        currentIndex: _selectedIndex,
        onTap: _onNavTapped,
      ),
    );
  }
}
