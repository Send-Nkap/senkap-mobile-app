import 'package:flutter/material.dart';
import '../gen/fonts.gen.dart';

class AppStyles {
  static TextStyle textStyle(
          {required Color color,
          FontWeight weight = FontWeight.w400,
          double size = 15.0,
          bool isUnderlined = false,
          bool isItalic = false,
          double? height}) =>
      TextStyle(
        color: color,
        fontFamily: FontFamily.inter,
        fontWeight: weight,
        // height: 0.8,
        fontSize: size,
        height: height,
        fontStyle: isItalic ? FontStyle.italic : null,
        decoration: isUnderlined ? TextDecoration.underline : null,
        decorationColor: color,
      );
}
