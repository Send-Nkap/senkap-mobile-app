import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../controllers/bottom_nav_bar_controller.dart';
import '../controllers/contact_controller.dart';
import '../controllers/transaction_controller.dart';
import '../gen/assets.gen.dart';
import '../ressources/app_colors.dart';
import '../ressources/app_styles.dart';
import '../ressources/constants.dart';
import '../screens/transfer_money/transfert_money_screen.dart';

class ContactWidget extends StatelessWidget {
  final Contact contact;
  final bool hasColor;
  final bool hasClose;
  ContactWidget({
    super.key,
    required this.contact,
    this.hasColor = false,
    this.hasClose = false,
  });

  final TransactionController _transactionController = Get.find();
  final BottomNavBarController _bottomNavBarController = Get.find();
  final ContactController _contactController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _bottomNavBarController.isOnTranfertMoneyScreen(true);
        Get.to(() => TransfertMoneyScreen(contact: contact),
            transition: Transition.downToUp,
            duration: const Duration(milliseconds: 200),
            curve: Curves.linear);
      },
      child: Container(
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.only(bottom: 10.0),
        decoration: BoxDecoration(
            color: hasColor ? AppColors.bgOpacColor : null,
            borderRadius: BorderRadius.circular(Constants.defaultBorderRadius)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 45.0,
                  height: 45.0,
                  decoration: BoxDecoration(
                    color: AppColors.bgColor,
                    shape: BoxShape.circle,
                    border:
                        hasColor ? Border.all(color: AppColors.white) : null,
                  ),
                  child: Center(
                    child:
                        //(contact.displayName != null &&
                        _contactController.isName(contact.displayName ??
                                contact.familyName ??
                                contact.givenName ??
                                contact.middleName!)
                            //         ||
                            // (contact.familyName != null &&
                            //     _contactController
                            //         .isName(contact.familyName!)) ||
                            // (contact.givenName != null &&
                            //     _contactController
                            //         .isName(contact.givenName!)) ||
                            // (contact.middleName != null &&
                            //     _contactController.isName(contact.middleName!))
                            ? Text(
                                // contact.displayName != null
                                //     ?
                                contact.displayName?[0] ??
                                    // : contact.familyName != null
                                    //     ?
                                    contact.familyName?[0] ??
                                    // : contact.givenName != null
                                    //     ?
                                    contact.givenName?[0] ??
                                    // : contact.middleName != null
                                    //     ?
                                    contact.middleName?[0] ??
                                    // : contact.androidAccountName != null
                                    //     ?
                                    contact.androidAccountName?[0] ??
                                    "U",
                                style: AppStyles.textStyle(
                                  color: AppColors.primaryText,
                                  size: 18.0,
                                ),
                              )
                            : SvgPicture.asset(
                                Assets.icons.user,
                                color: AppColors.primaryText,
                              ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        contact.displayName != null &&
                                _contactController.isName(contact.displayName!)
                            ? contact.displayName!
                            : contact.familyName != null &&
                                    _contactController
                                        .isName(contact.familyName!)
                                ? contact.familyName!
                                : contact.givenName != null &&
                                        _contactController
                                            .isName(contact.givenName!)
                                    ? contact.givenName!
                                    : contact.middleName != null &&
                                            _contactController
                                                .isName(contact.middleName!)
                                        ? contact.middleName!
                                        : "Unknow",
                        style:
                            AppStyles.textStyle(color: AppColors.primaryText),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        contact.phones != null && contact.phones!.isNotEmpty
                            // ? _transactionController
                            //     .formatPhoneNumber(contact.phones![0].value!)
                            ? contact.phones![0].value!
                            : "",
                        style:
                            AppStyles.textStyle(color: AppColors.primaryText),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            if (hasClose)
              GestureDetector(
                  onTap: () {
                    _bottomNavBarController.isOnTranfertMoneyScreen(false);
                    Get.back();
                    _transactionController.clearAmount();
                  },
                  child: SvgPicture.asset(Assets.icons.close))
          ],
        ),
      ),
    );
  }
}
