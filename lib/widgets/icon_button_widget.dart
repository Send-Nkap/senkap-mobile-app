import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../ressources/app_colors.dart';
import '../ressources/app_styles.dart';
import '../ressources/constants.dart';

class IconButtonWidget extends StatelessWidget {
  final void Function() onTap;
  final bool hasMarginLeft;
  final String icon;
  final double? iconWidth;
  final String text;
  const IconButtonWidget({
    super.key,
    required this.onTap,
    this.hasMarginLeft = false,
    required this.icon,
    this.iconWidth,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(left: hasMarginLeft ? 10.0 : 0.0),
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(Constants.defaultBorderRadius),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              color: AppColors.white,
              width: iconWidth,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                text,
                style: AppStyles.textStyle(
                  color: AppColors.white,
                  weight: FontWeight.w500,
                  size: 15.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
