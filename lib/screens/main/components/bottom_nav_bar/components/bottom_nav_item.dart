import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../ressources/app_colors.dart';
import '../../../../../ressources/app_styles.dart';

class BottomNavItem extends StatelessWidget {
  final String title;
  final String icon;
  final bool isActive;
  const BottomNavItem(
      {super.key,
      required this.title,
      required this.icon,
      required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: SvgPicture.asset(
        icon,
        width: 27.0,
        height: 27.0, //20.0
        color: isActive ? AppColors.primary : AppColors.secondaryText,
      ),
    );
  }
}
