import 'package:flutter/material.dart';

// 자주 사용되는 Text 위젯을 미리 정의해둔다.
// default 값을 주도록해서 인자가 생략되도 가능하도록 한다.
class DnfText extends StatelessWidget {
  const DnfText(
    this.text, {
    Key? key,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.fontFamily,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.decoration,
  }) : super(key: key);

  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color ?? Colors.white,
        fontSize: fontSize ?? 12,
        fontWeight: fontWeight ?? FontWeight.w500,
        fontFamily: fontFamily ?? 'DNFForgedBlade',
        decoration: decoration ?? TextDecoration.none,
      ),
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
