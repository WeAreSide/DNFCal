import 'package:dnf_cal/widgets/MainPage/AdventureInfo.dart';
import 'package:dnf_cal/widgets/MainPage/CalendarSpace.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Padding(
        padding:
            const EdgeInsets.only(left: 12, right: 12, top: 54, bottom: 40),
        child: Container(
          color: Colors.transparent,
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
            ],
          ),
        ),
      ),
    );
  }
}
