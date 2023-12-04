import 'dart:async';

import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../controllers/bottom_nav_bar_controller.dart';
import '../../controllers/contact_controller.dart';
import '../../controllers/transaction_controller.dart';
import '../../gen/assets.gen.dart';
import '../../models/contact_model.dart';
import '../../ressources/app_colors.dart';
import '../../ressources/app_styles.dart';
import '../../ressources/commons.dart';
import '../../ressources/constants.dart';
import '../main/components/app_bar/app_bar_component.dart';
import '../exceptions/success_screen.dart';
import '../../widgets/contact_widget.dart';
import '../../widgets/primary_button_widget.dart';

// Add here for accessibility. It should be accessible by all required components (Text, keyTouch, iconKeyTouch, etc...)
final TransactionController _transactionController = Get.find();

class TransfertMoneyScreen extends StatelessWidget {
  final Contact contact;
  TransfertMoneyScreen({super.key, required this.contact});
  final BottomNavBarController _bottomNavBarController = Get.find();
  final ContactController _contactController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: WillPopScope(
        onWillPop: () async {
          _bottomNavBarController.isOnTranfertMoneyScreen(false);
          _transactionController.clearAmount();
          return true;
        },
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppBarComponent(),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Constants.defaultHorizontalMargin),
                child: Obx(() {
                  return Text(
                    "${Commons.formatAmount(_transactionController.amount.value)} XAF",
                    textAlign: TextAlign.center,
                    style: AppStyles.textStyle(
                      color: AppColors.primaryText,
                      weight: FontWeight.w700,
                      size: 37,
                    ),
                  );
                }),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Constants.defaultHorizontalMargin),
                child: ContactWidget(
                  contact: contact,
                  hasClose: true,
                  hasColor: true,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Constants.defaultHorizontalMargin),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        keyTouch(
                          touch: "1",
                          hasMargin: false,
                        ),
                        keyTouch(
                          touch: "2",
                          hasMargin: true,
                        ),
                        keyTouch(
                          touch: "3",
                          hasMargin: true,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        keyTouch(
                          touch: "4",
                          hasMargin: false,
                        ),
                        keyTouch(
                          touch: "5",
                          hasMargin: true,
                        ),
                        keyTouch(
                          touch: "6",
                          hasMargin: true,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        keyTouch(
                          touch: "7",
                          hasMargin: false,
                        ),
                        keyTouch(
                          touch: "8",
                          hasMargin: true,
                        ),
                        keyTouch(
                          touch: "9",
                          hasMargin: true,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        iconKeyTouch(
                          icon: Assets.icons.close,
                          hasMargin: false,
                        ),
                        keyTouch(
                          touch: "0",
                          hasMargin: true,
                        ),
                        iconKeyTouch(
                          icon: Assets.icons.deleteLeft,
                          hasMargin: true,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    bottom: Constants.screenHeight(context) / 20),
                child: PrimaryButtonWidget(
                  title: "Send Now",
                  butttonColor: AppColors.primary,
                  textColor: AppColors.white,
                  onTap: () {
                    ContactModel newRecent = ContactModel(
                        name: contact.displayName!,
                        phone: int.parse(
                            contact.phones!.first.value!.split("(237)")[1]));
                    _contactController.addContactToRecents(newRecent);
                    Get.to(const SuccessScreen());
                    // Commons.snackBar(
                    //     bgColor: AppColors.success,
                    //     textColor: AppColors.white,
                    //     description: "Transfer done successfuly");
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget keyTouch({required String touch, required bool hasMargin}) => Expanded(
      child: GestureDetector(
        onTap: () {
          _transactionController.updateAmount(touch);
        },
        child: Container(
          margin: hasMargin ? const EdgeInsets.only(left: 10.0) : null,
          padding: const EdgeInsets.symmetric(vertical: 25.0),
          decoration: BoxDecoration(
            color: AppColors.bgOpacColor,
            borderRadius: BorderRadius.circular(
              Constants.defaultBorderRadius * 2,
            ),
          ),
          child: Center(
            child: Text(
              touch,
              style: AppStyles.textStyle(
                color: AppColors.primaryText,
                weight: FontWeight.w500,
                size: 25.0,
              ),
            ),
          ),
        ),
      ),
    );
Timer? _timer;

void _startDeleteAmount() {
  _timer = Timer.periodic(const Duration(milliseconds: 200), (_) {
    _transactionController.deleteAmount();
  });
}

void _stopTimer() {
  _timer?.cancel();
}

Widget iconKeyTouch({required String icon, required bool hasMargin}) =>
    Expanded(
      child: GestureDetector(
        onTap: () {
          if (icon == Assets.icons.close) {
            _transactionController.clearAmount();
          } else {
            _transactionController.deleteAmount();
          }
        },
        onLongPress: () {
          if (icon != Assets.icons.close) {
            _startDeleteAmount();
          }
        },
        onLongPressEnd: (details) {
          if (icon != Assets.icons.close) {
            _stopTimer();
          }
        },
        child: Container(
          margin: hasMargin ? const EdgeInsets.only(left: 10.0) : null,
          padding: const EdgeInsets.symmetric(vertical: 30.5),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(
              Constants.defaultBorderRadius * 2,
            ),
          ),
          child: Center(
            child: SvgPicture.asset(
              icon,
              width: 25.0,
            ),
          ),
        ),
      ),
    );
