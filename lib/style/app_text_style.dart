import 'package:coffee_shop/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum TextStyleEnum {
  p_normal,
  p_light,
  p_medium,
  p_bold,
  h1_bold,
  h1_medium,
  h2_bold,
  h2_medium,
  h3_bold,
  h3_medium,
  italic,
  underline,
  caption,
  button_text,
  subtitle,
  overline,
}

TextStyle getTextStyle(TextStyleEnum style, {Color color = dark}) {
  switch (style) {
    case TextStyleEnum.p_normal:
      return GoogleFonts.sora(
        fontWeight: FontWeight.normal,
        color: color,
      );
    case TextStyleEnum.p_light:
      return GoogleFonts.sora(
        fontWeight: FontWeight.w300,
        color: color,
      );
    case TextStyleEnum.p_medium:
      return GoogleFonts.sora(
        fontWeight: FontWeight.w500,
        color: color,
      );
    case TextStyleEnum.p_bold:
      return GoogleFonts.sora(
        fontWeight: FontWeight.bold,
        color: color,
      );
    case TextStyleEnum.h1_bold:
      return GoogleFonts.sora(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: color,
      );
    case TextStyleEnum.h1_medium:
      return GoogleFonts.sora(
        fontSize: 32,
        fontWeight: FontWeight.w500,
        color: color,
      );
    case TextStyleEnum.h2_bold:
      return GoogleFonts.sora(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: color,
      );
    case TextStyleEnum.h2_medium:
      return GoogleFonts.sora(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        color: color,
      );
    case TextStyleEnum.h3_bold:
      return GoogleFonts.sora(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: color,
      );
    case TextStyleEnum.h3_medium:
      return GoogleFonts.sora(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: color,
      );
    case TextStyleEnum.italic:
      return GoogleFonts.sora(
        fontStyle: FontStyle.italic,
        color: color,
      );
    case TextStyleEnum.underline:
      return GoogleFonts.sora(
        decoration: TextDecoration.underline,
        color: color,
      );
    case TextStyleEnum.caption:
      return GoogleFonts.sora(
        fontSize: 12,
        color: color,
      );
    case TextStyleEnum.button_text:
      return GoogleFonts.sora(
        fontWeight: FontWeight.bold,
        fontSize: 14,
        color: color,
      );
    case TextStyleEnum.subtitle:
      return GoogleFonts.sora(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: color,
      );
    case TextStyleEnum.overline:
      return GoogleFonts.sora(
        fontSize: 10,
        color: color,
      );
    default:
      return GoogleFonts.sora(
        color: color,
      );
  }
}
