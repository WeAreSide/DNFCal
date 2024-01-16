import 'dart:ui';
import 'package:flutter/material.dart';
import '../models/CustomColor.dart';
import '../widgets/Setting/OpenSourceNavigationBar.dart';

class OpenSourcePage extends StatelessWidget {
  const OpenSourcePage({super.key});

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    return Container(
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
            child: Column(
              children: [
                SizedBox(
                  height: statusBarHeight + 16,
                ),
                OpenSourceNavigationBar()
              ],
            )),
      ),
    );
  }
}
