import 'package:auto_size_text/auto_size_text.dart';
import 'package:coffee_shop/style/app_colors.dart';
import 'package:coffee_shop/style/app_text_style.dart';
import 'package:flutter/material.dart';

class AppGlobalText extends StatelessWidget {
  final String text;
  final double? minFontSize;
  final int? maxLines;
  final TextStyleEnum style;
  Color? color;

  AppGlobalText({
    super.key,
    required this.text,
    required this.style,
    this.color,
    this.minFontSize,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      style: getTextStyle(style, color: color ?? dark),
      minFontSize: minFontSize ?? 13,
      maxLines: maxLines ?? 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}
