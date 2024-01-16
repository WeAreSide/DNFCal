import 'package:dnf_cal/main.dart';
import 'package:flutter/material.dart';

import '../models/CustomColor.dart';
import '../widgets/CharacterSearch/CharacterSearchTopWidget.dart';
import '../widgets/Setting/SettingTopWidget.dart';
import '../widgets/global/DefaultBackgroundWidget.dart';
import 'OpenSourcePage.dart';
import 'PrivacyPolicyPage.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SettingPageState();
  }
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    return Column(children: [
      Padding(
        padding: EdgeInsets.only(top: statusBarHeight + 16),
        child: const SettingTopWidget(),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 56, left: 20, right: 20),
        child: SizedBox(
          width: double.maxFinite,
          height: 54,
          child: ElevatedButton(
            onPressed: () => {
            Navigator.of(context)
                .push(MaterialPageRoute(
            builder: (context) => OpenSourcePage())
            )
          },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0B1218),
              side: BorderSide(color: CustomColor.buttonStroke(), width: 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0), // Adjust the corner radius here
              ),
            ),
            child: Text(
                "오픈소스 라이브러리 정보",
                style: TextStyle(
                  color: CustomColor.uncommon(),
                  fontSize: 12,
                  fontFamily: 'DNFForgedBlade',
                  fontWeight: FontWeight.w500,
                )
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: SizedBox(
          width: double.maxFinite,
          height: 54,
          child: ElevatedButton(
            onPressed: () => {
              Navigator.of(context)
                  .push(MaterialPageRoute(
                  builder: (context) => PrivacyPolicyPage())
              )
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0B1218),
              side: BorderSide(color: CustomColor.buttonStroke(), width: 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0), // Adjust the corner radius here
              ),
            ),
            child: Text(
                "개인 정보 처리 방침",
                style: TextStyle(
                  color: CustomColor.uncommon(),
                  fontSize: 12,
                  fontFamily: 'DNFForgedBlade',
                  fontWeight: FontWeight.w500,
                )
            ),
          ),
        ),
      ),
    ]);
  }
}
