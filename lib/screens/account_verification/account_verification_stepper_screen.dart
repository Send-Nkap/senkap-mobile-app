import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/account_verification_controller.dart';
import '../../ressources/app_colors.dart';
import '../../ressources/constants.dart';
import 'address_verification_screen.dart';
import 'identity_verification_screen.dart';
import 'personal_info_verification_screen.dart';
import '../main/main_screen.dart';
import '../../widgets/primary_button_widget.dart';

class AccountVerificationStepperScreen extends StatelessWidget {
  AccountVerificationStepperScreen({super.key});
  final AccountVerificationController _countVerificationController =
      Get.put(AccountVerificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Constants.defaultHorizontalMargin,
                  vertical: Constants.defaultTopverticalMargin / 2,
                ),
                child: Obx(() {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              height: 7.0,
                              // width: Constants.screenWidth(context) / 4,
                              decoration: BoxDecoration(
                                  color: _countVerificationController
                                              .pageVerificationIndex.value >=
                                          0
                                      ? AppColors.secondary
                                      : AppColors.imputBg,
                                  borderRadius: BorderRadius.circular(
                                      Constants.defaultBorderRadius / 2.5)),
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          Expanded(
                            child: Container(
                              height: 7.0,
                              // width: Constants.screenWidth(context) / 4,
                              decoration: BoxDecoration(
                                  color: _countVerificationController
                                              .pageVerificationIndex.value >=
                                          1
                                      ? AppColors.secondary
                                      : AppColors.imputBg,
                                  borderRadius: BorderRadius.circular(
                                      Constants.defaultBorderRadius / 2.5)),
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          Expanded(
                            child: Row(
                              children: [
                                Flexible(
                                  child: Container(
                                    height: 7.0,
                                    // width: 50.0,
                                    // width: Constants.screenWidth(context) / 4,
                                    decoration: BoxDecoration(
                                        color: _countVerificationController
                                                    .pageVerificationIndex
                                                    .value >=
                                                2
                                            ? AppColors.secondary
                                            : AppColors.imputBg,
                                        borderRadius: BorderRadius.circular(
                                            Constants.defaultBorderRadius /
                                                2.5)),
                                  ),
                                ),
                                const SizedBox(width: 5.0),
                                Flexible(
                                  child: Container(
                                    height: 7.0,
                                    // width: 50.0,
                                    // width: Constants.screenWidth(context) / 4,
                                    decoration: BoxDecoration(
                                        color: _countVerificationController
                                                    .pageVerificationIndex
                                                    .value >=
                                                3
                                            ? AppColors.secondary
                                            : AppColors.imputBg,
                                        borderRadius: BorderRadius.circular(
                                            Constants.defaultBorderRadius /
                                                2.5)),
                                  ),
                                ),
                                const SizedBox(width: 5.0),
                                Flexible(
                                  child: Container(
                                    height: 7.0,
                                    // width: 50.0,
                                    // width: Constants.screenWidth(context) / 4,
                                    decoration: BoxDecoration(
                                        color: _countVerificationController
                                                    .pageVerificationIndex
                                                    .value ==
                                                4
                                            ? AppColors.secondary
                                            : AppColors.imputBg,
                                        borderRadius: BorderRadius.circular(
                                            Constants.defaultBorderRadius /
                                                2.5)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      _countVerificationController
                                  .pageVerificationIndex.value ==
                              0
                          ? PersonalInfoVerificationScreen()
                          : _countVerificationController
                                      .pageVerificationIndex.value ==
                                  1
                              ? AddressVerificationScreen()
                              : IdentityVerificationScreen(),
                      SizedBox(
                        height:
                            Constants.defaultPageBottomverticalMargin(context),
                      )
                    ],
                  );
                }),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: Constants.screenHeight(context) / 20),
                child: Obx(() {
                  return PrimaryButtonWidget(
                    title: _countVerificationController
                                .pageVerificationIndex.value ==
                            4
                        ? "Save"
                        : "Next",
                    butttonColor: AppColors.primary,
                    textColor: AppColors.white,
                    onTap: () {
                      _countVerificationController.increment();
                      if (_countVerificationController
                              .pageVerificationIndex.value ==
                          4) {
                        Get.to(() => MainScreen(),
                            transition: Transition.cupertino,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.linear);
                      }
                    },
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
