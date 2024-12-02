import 'package:coffee_shop/style/app_colors.dart';
import 'package:coffee_shop/style/app_text_style.dart';
import 'package:flutter/material.dart';

class AppGlobalText extends StatelessWidget {
  final String text;
  final TextStyleEnum style;
  Color? color;
  AppGlobalText(
      {super.key, required this.text, required this.style, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: getTextStyle(style, color: color ?? dark),
    );
  }
}
