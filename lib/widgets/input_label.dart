import 'package:flutter/material.dart';
import 'package:send_nkap/ressources/app_colors.dart';
import 'package:send_nkap/ressources/app_styles.dart';

class InputLabel extends StatelessWidget {
  final String label;
  final double paddingTop;
  final Color color;
  final bool hasSpecialCaraters;
  InputLabel({
    super.key,
    required this.label,
    required this.paddingTop,
    this.color = AppColors.primaryText,
    this.hasSpecialCaraters = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: paddingTop, bottom: 2.0),
      child: Text(
        label,
        style: AppStyles.textStyle(color: color, size: 12.0),
      ),
    );
  }
}
