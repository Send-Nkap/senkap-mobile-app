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
    return SizedBox(
      // width: Constants.screenWidth(context) / 5.5,
      // height: 120.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              SvgPicture.asset(
                icon,
                width: title == "Cartes" || title == "Accueil" ? 27.0 : 23.0,
                height: 20.0,
                color: isActive ? AppColors.primary : AppColors.secondaryText,
              ),
              const SizedBox(height: 8.0),
              Text(
                title,
                style: AppStyles.textStyle(
                    //TODO: Change font to poppins
                    color: isActive ? AppColors.primary : AppColors.secondaryText,
                    size: 10.0,
                    weight: FontWeight.w400),
              ),
            ],
          ),
          const SizedBox(height: 14.42),
          isActive
              ? Container(
                  width: 35.0,
                  height: 4.0,
                  // margin: EdgeInsets.only(top: 14.42),
                  decoration: const BoxDecoration(color: AppColors.primary),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
