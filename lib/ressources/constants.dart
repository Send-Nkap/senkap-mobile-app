import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Constants {
  // Screen size (Height and Width)
  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double defaultBorderRadius = 8.0;
  static double roundedCornerRadius = 8.0 * 5;
  static double defaultHorizontalMargin = 16.0;
  static double defaultTopverticalMargin = 70.0;
  static double defaultPageBottomverticalMargin(BuildContext context) =>
      screenHeight(context) / 15;
}
