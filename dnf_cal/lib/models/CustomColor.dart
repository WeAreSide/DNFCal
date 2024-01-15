import 'package:flutter/material.dart';

class CustomColor extends Color {

  // 사용법 예시 : CustomColor.epic()
  CustomColor(super.value);

  static Color uncommon() {
    return const Color(0xffFFFFFF);
  }

  static Color common() {
    return const Color(0xff68D5ED);
  }

  static Color rare() {
    return const Color(0xffB36BFF);
  }

  static Color unique() {
    return const Color(0xffFF00FF);
  }

  static Color epic() {
    return const Color(0xffFFB400);
  }

  static Color chronicle() {
    return const Color(0xffFF6666);
  }

  static Color legendary() {
    return const Color(0xffFF7800);
  }

  static Color darkGray() {
    return const Color(0xff5F5F5F);
  }

  static Color buttonStroke() {
    return const Color.fromRGBO(211, 211, 211, 0.3);
  }

  static Color buttonUnselected() {
    return const Color.fromRGBO(211, 211, 211, 0.3);
  }
}