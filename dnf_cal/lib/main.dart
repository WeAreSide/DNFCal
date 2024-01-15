import 'dart:ui';
import 'package:provider/provider.dart';
import 'package:dnf_cal/screens/CharacterSearchPage.dart';
import 'package:dnf_cal/screens/MainPage.dart';
import 'package:dnf_cal/screens/RegisterCharacterPage.dart';
import 'package:dnf_cal/screens/SettingPage.dart';
import 'package:dnf_cal/widgets/global/BottomNavigationWidget.dart';
import 'package:flutter/material.dart';
import 'models/SearchModel.dart';

void main() {
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => SearchModel()),
        ],
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'DNFCal',
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
    const MainPage(),
    const RegisterCharacterPage(),
    const CharacterSearchPage(),
    const SettingPage(),
  ];

  void _onNavTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => SearchModel(),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child:       Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/default_background.png'), // 배경 이미지
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                color: Colors.black.withOpacity(0.5),
                child: Scaffold(
                  body: _navIndex.elementAt(_selectedIndex),
                  bottomNavigationBar: BottomNavigationWidget(
                    selectedIndex: _selectedIndex,
                    onNavTapped: _onNavTapped,
                  ),
                  backgroundColor: Colors.transparent,
                ),
              ),
            )
        ),
      ),
    );
  }
}
