import 'dart:ffi';
import 'dart:ui';
import 'dart:async';
import 'package:path/path.dart';
import 'package:dnf_cal/models/RegisterCharacterModel.dart';
import 'package:dnf_cal/utils/APIModel.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:dnf_cal/screens/CharacterSearchPage.dart';
import 'package:dnf_cal/screens/MainPage.dart';
import 'package:dnf_cal/screens/RegisterCharacterPage.dart';
import 'package:dnf_cal/screens/SettingPage.dart';
import 'package:dnf_cal/widgets/global/BottomNavigationWidget.dart';
import 'package:flutter/material.dart';
import 'models/SearchModel.dart';
import 'package:realm/realm.dart';
import 'realm/Character.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env"); // 추가
  // realm 초기화
  var config = Configuration.local([Character.schema]);
  var realm = Realm(config);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => SearchModel()),
      ChangeNotifierProvider(create: (_) => RegisterCharacterModel()),
    ],
    child: MyApp(),
  ));
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
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image:
                  AssetImage('assets/images/default_background.png'), // 배경 이미지
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
          )),
    );
  }
}
