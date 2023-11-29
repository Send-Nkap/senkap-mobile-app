import 'package:flutter/material.dart';
import '../ressources/app_colors.dart';
import '../ressources/app_styles.dart';
import '../ressources/constants.dart';

class PrimaryButtonWidget extends StatelessWidget {
  const PrimaryButtonWidget({
    super.key,
    required this.title,
    required this.butttonColor,
    required this.textColor,
    required this.onTap,
  });
  final String title;
  final Color butttonColor;
  final Color textColor;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: IntrinsicHeight(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 13.0),
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          width: double.infinity,
          decoration: BoxDecoration(
              color: butttonColor,
              borderRadius:
                  BorderRadius.circular(Constants.defaultBorderRadius)),
          child: Center(
            child: Text(
              title,
              style: AppStyles.textStyle(
                color: textColor,
                size: 16.0,
                weight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
