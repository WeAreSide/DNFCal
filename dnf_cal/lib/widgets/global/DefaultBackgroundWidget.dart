import 'package:flutter/material.dart';

class DefaultBackgroundWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand, // Stack이 화면 전체를 채우도록 설정
      children: [
        Image.asset(
          'assets/images/default_background.png',
          fit: BoxFit.cover, // 이미지가 화면을 꽉 채우도록 설정
        ),
      ],
    );
  }
}
