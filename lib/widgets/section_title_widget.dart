import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import '../ressources/app_colors.dart';
import '../ressources/app_styles.dart';
import '../ressources/constants.dart';

class SectionTitleWidget extends StatelessWidget {
  final String title;
  const SectionTitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: (Constants.defaultHorizontalMargin + 10.0),
          bottom: Constants.defaultHorizontalMargin),
      child: Text(
        title,
        style: AppStyles.textStyle(
          color: AppColors.primaryText,
          size: 18,
          weight: FontWeight.w600,
        ),
      ),
    );
  }
}
