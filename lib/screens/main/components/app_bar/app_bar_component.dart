import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../../controllers/bottom_nav_bar_controller.dart';
import '../../../../controllers/tab_bar_controller.dart';
import '../../../../controllers/transaction_controller.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../ressources/app_colors.dart';
import '../../../../ressources/app_styles.dart';
import '../../../../ressources/constants.dart';
import '../../../../widgets/input_field_widget.dart';

class AppBarComponent extends StatelessWidget {
  AppBarComponent({super.key});
  // final TabBarController _tabController = Get.put(TabBarController());
  final BottomNavBarController _bottomNavBarController = Get.find();
  final TransactionController _transactionController = Get.find();

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Obx(() {
        return Material(
          elevation:
              _bottomNavBarController.isAppBarElevated.value ? 10.0 : 0.0,
          child: Container(
            color: AppColors.white,
            padding: EdgeInsets.only(
              left: Constants.defaultHorizontalMargin,
              right: Constants.defaultHorizontalMargin,
              top: Constants.defaultHorizontalMargin,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (_bottomNavBarController.pageIndex.value == 0)
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  color: AppColors.bgColor,
                                  shape: BoxShape.circle),
                              child: SvgPicture.asset(
                                Assets.icons.user,
                                color: AppColors.primaryText,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Welcome Back,",
                                    style: AppStyles.textStyle(
                                      color: AppColors.secondaryText,
                                      size: 14,
                                      height: 0.9,
                                    ),
                                  ),
                                  Text(
                                    "John Doe",
                                    style: AppStyles.textStyle(
                                      color: AppColors.primaryText,
                                      size: 14,
                                      weight: FontWeight.w700,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      if (_bottomNavBarController.pageIndex.value == 0)
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                              color: AppColors.bgColor, shape: BoxShape.circle),
                          child: SvgPicture.asset(
                            Assets.icons.bell,
                            // width: 23.0,
                            // height: 23.0, //20.0
                            color: AppColors.primaryText,
                          ),
                        ),
                      if (_bottomNavBarController.pageIndex.value == 1)
                        Text(
                          "Dashboard",
                          style: AppStyles.textStyle(
                            color: AppColors.primaryText,
                            size: 18,
                            weight: FontWeight.w600,
                          ),
                        ),
                      if (_bottomNavBarController.pageIndex.value == 2 &&
                          !_bottomNavBarController
                              .isOnTranfertMoneyScreen.value)
                        Text(
                          "Transfer",
                          style: AppStyles.textStyle(
                            color: AppColors.primaryText,
                            size: 18,
                            weight: FontWeight.w600,
                          ),
                        ),
                      if (_bottomNavBarController.pageIndex.value == 2 &&
                          _bottomNavBarController.isOnTranfertMoneyScreen.value)
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                _bottomNavBarController
                                    .isOnTranfertMoneyScreen(false);
                                _transactionController.clearAmount();
                                Get.back();
                              },
                              child: const Icon(
                                FontAwesomeIcons.arrowLeft,
                                color: AppColors.primaryText,
                                // size: 25.0,
                              ),
                            ),
                          ],
                        ),
                      if (_bottomNavBarController.pageIndex.value == 3)
                        Text(
                          "Transaction History",
                          style: AppStyles.textStyle(
                            color: AppColors.primaryText,
                            size: 18,
                            weight: FontWeight.w600,
                          ),
                        ),
                      if (_bottomNavBarController.pageIndex.value == 4)
                        Text(
                          "Settings",
                          style: AppStyles.textStyle(
                            color: AppColors.primaryText,
                            size: 18,
                            weight: FontWeight.w600,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
