import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../main/main_screen.dart';
import '../../controllers/bottom_nav_bar_controller.dart';
import '../../gen/assets.gen.dart';
import '../../ressources/app_colors.dart';
import '../../ressources/app_styles.dart';
import '../../ressources/commons.dart';
import '../../ressources/constants.dart';
import '../../widgets/primary_button_widget.dart';

class ErrorScreen extends StatefulWidget {
  const ErrorScreen({super.key});

  @override
  State<ErrorScreen> createState() => _ErrorScreenState();
}

/// [AnimationController]s can be created with `vsync: this` because of
/// [TickerProviderStateMixin].
class _ErrorScreenState extends State<ErrorScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..repeat();
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  late AnimationController scaleController = AnimationController(
      duration: const Duration(milliseconds: 800), vsync: this);
  late Animation<double> scaleAnimation =
      CurvedAnimation(parent: scaleController, curve: Curves.elasticInOut);
  late AnimationController checkController = AnimationController(
      duration: const Duration(milliseconds: 400), vsync: this);
  late Animation<double> checkAnimation =
      CurvedAnimation(parent: checkController, curve: Curves.linear);

  final BottomNavBarController _bottomNavBarController =
      Get.put(BottomNavBarController());

  @override
  void initState() {
    super.initState();
    Commons.vibratePhone();
    scaleController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        checkController.forward();
      }
    });
    scaleController.forward();
  }

  @override
  void dispose() {
    scaleController.dispose();
    checkController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: IntrinsicHeight(
          child: Container(
            height: Constants.screenHeight(context) / 2,
            margin: EdgeInsets.symmetric(
                horizontal: Constants.defaultHorizontalMargin * 2),
            padding: EdgeInsets.all(Constants.defaultHorizontalMargin),
            decoration: BoxDecoration(
              color: AppColors.secondary,
              borderRadius: BorderRadius.circular(
                  Constants.defaultBorderRadius +
                      (Constants.defaultHorizontalMargin * 2)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  children: [
                    Center(
                      child: ScaleTransition(
                        scale: scaleAnimation,
                        child: Container(
                          height: 140,
                          width: 140,
                          decoration: const BoxDecoration(
                            color: AppColors.accent,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                    SizeTransition(
                      sizeFactor: checkAnimation,
                      axis: Axis.horizontal,
                      axisAlignment: -1,
                      child: Center(
                        child: SizedBox(
                          height: 140.0,
                          width: 140.0,
                          child: Center(
                            child: SvgPicture.asset(
                              Assets.icons.check,
                              width: 108.0,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  "Transfer faild",
                  style: AppStyles.textStyle(
                    color: AppColors.primaryText,
                    size: 18.0,
                    weight: FontWeight.w600,
                  ),
                ),
                Text(
                  "Your transfer have not been completed",
                  textAlign: TextAlign.center,
                  style: AppStyles.textStyle(
                    color: AppColors.secondaryText,
                    size: 15.0,
                    weight: FontWeight.w500,
                  ),
                ),
                Text(
                  "${Commons.formatAmount("80000")} XAF",
                  style: AppStyles.textStyle(
                    color: AppColors.primaryText,
                    size: 15.0,
                    weight: FontWeight.w700,
                  ),
                ),
                PrimaryButtonWidget(
                    title: "Done",
                    butttonColor: AppColors.primary,
                    textColor: AppColors.primaryText,
                    onTap: () {
                      _bottomNavBarController.setPageIndex(0);
                      // _bottomNavBarController.setPageIndex(2);
                      Get.offAll(() => MainScreen(),
                          transition: Transition.cupertino,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.linear);
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
