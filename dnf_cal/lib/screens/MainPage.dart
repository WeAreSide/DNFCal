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
    double statusBarHeight = MediaQuery.of(context).padding.top;
    double spaceHeight =
        (MediaQuery.of(context).size.height - statusBarHeight - 533) * 0.3;
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
                height: spaceHeight,
              ),
              CalendarSpace(),
            ],
          ),
        ),
      ),
    );
  }
}
