import 'dart:math';

import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../controllers/contact_controller.dart';
import '../../../controllers/transaction_controller.dart';
import '../../../gen/assets.gen.dart';
import '../../../ressources/app_colors.dart';
import '../../../ressources/app_styles.dart';
import '../../../ressources/constants.dart';
import '../../../ressources/data.dart';
import '../../../widgets/contact_widget.dart';
import '../../../widgets/input_field_widget.dart';
import '../../../widgets/section_title_widget.dart';

class TransferPage extends StatelessWidget {
  TransferPage({super.key});
  List<Map<String, dynamic>> recentList = [
    {"shortName": "MT", "color": colorList[0], "name": "Mael Toukap"},
    {"shortName": "J", "color": colorList[1], "name": "Jean"},
    {"shortName": "N", "color": colorList[2], "name": "Ngamba"},
    {"shortName": "B", "color": colorList[3], "name": "Booming"},
    {"shortName": "JP", "color": colorList[4], "name": "Jean Paul"},
    {"shortName": "JM", "color": colorList[5], "name": "Jean Mark"},
    {"shortName": "V", "color": colorList[6], "name": "Victor"},
  ];

  final TransactionController _transactionController =
      Get.put(TransactionController());
  final ContactController _contactController = Get.put(ContactController());
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(() {
          return _contactController.recentContacts.isNotEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SectionTitleWidget(title: "Sent Recently"),

                    SizedBox(
                      height: 50.0,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.zero,
                          itemCount: _contactController.recentContacts.length,
                          itemBuilder: ((context, index) {
                            return GestureDetector(
                              onTap: () {},
                              child: Container(
                                margin: EdgeInsets.only(
                                    left: index != 0 ? 10.0 : 0.0),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 12.0),
                                decoration: BoxDecoration(
                                  color: AppColors.secondary,
                                  borderRadius: BorderRadius.circular(
                                    Constants.defaultBorderRadius * 5, //*5
                                  ),
                                ),
                                child: Row(children: [
                                  Container(
                                    padding: const EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                        color: userList[index]['color'],
                                        shape: BoxShape.circle),
                                    child: SvgPicture.asset(
                                      Assets.icons.user,
                                      color: AppColors.white,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      _contactController
                                          .recentContacts[index].name,
                                      style: AppStyles.textStyle(
                                        color: AppColors.primaryText,
                                        weight: FontWeight.w600,
                                        size: 15.0,
                                      ),
                                    ),
                                  )
                                ]),
                              ),
                            );
                          })),
                    ),
                    // SizedBox(
                    //   height: 115.0,
                    //   child: ListView.builder(
                    //       scrollDirection: Axis.horizontal,
                    //       shrinkWrap: true,
                    //       itemCount: 5,
                    //       padding: EdgeInsets.zero,
                    //       itemBuilder: (context, index) {
                    //         return Column(
                    //           children: [
                    //             Container(
                    //               width: 45.0,
                    //               height: 45.0,
                    //               margin: EdgeInsets.only(
                    //                   top: Constants.defaultHorizontalMargin,
                    //                   left: index != 0 ? 10.0 : 0.0),
                    //               // padding: EdgeInsets.all(10.0),
                    //               decoration: BoxDecoration(
                    //                   color: recentList[index]['color'],
                    //                   shape: BoxShape.circle),
                    //               child: Center(
                    //                 child: Text(
                    //                   recentList[index]['shortName'],
                    //                   style: AppStyles.textStyle(
                    //                     color: AppColors.secondary,
                    //                     size: 18.0,
                    //                   ),
                    //                 ),
                    //               ),
                    //             ),
                    //             Container(
                    //               padding: const EdgeInsets.only(top: 5.0),
                    //               width: 45.0,
                    //               child: Text(
                    //                 recentList[index]['name'].split(' ')[0],
                    //                 textAlign: TextAlign.center,
                    //               ),
                    //             )
                    //           ],
                    //         );
                    //       }),
                    // ),
                  ],
                )
              : SizedBox();
        }),
        const SectionTitleWidget(title: "Earn Money"),
        Container(
          padding: const EdgeInsets.all(10.0),
          margin: const EdgeInsets.only(
            bottom: 10.0,
          ),
          decoration: BoxDecoration(
              color: AppColors.bgOpacColor,
              borderRadius:
                  BorderRadius.circular(Constants.defaultBorderRadius)),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: const BoxDecoration(
                        color: AppColors.secondary, shape: BoxShape.circle),
                    child: Image.asset(
                      Assets.icons.giftPng.path,
                      // color: AppColors.white,
                      width: 30.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Invite a friend",
                          style:
                              AppStyles.textStyle(color: AppColors.primaryText),
                        ),
                        Text(
                          "Get up to 10% by inviting a friend",
                          style: AppStyles.textStyle(
                            color: AppColors.primaryText,
                            size: 13.0,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        Obx(() {
          return !_contactController.isContactAcessGranted.value
              ? GestureDetector(
                  onTap: () async {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) {
                        return Container(
                          color: Colors.transparent,
                          child: const Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primary,
                            ),
                          ),
                        );
                      },
                    );
                    await _contactController.getContacts();
                    Get.back();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    // margin:
                    //     EdgeInsets.symmetric(vertical: Constants.defaultHorizontalMargin),
                    decoration: BoxDecoration(
                        color: AppColors.bgOpacColor,
                        borderRadius: BorderRadius.circular(
                            Constants.defaultBorderRadius)),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: const BoxDecoration(
                              color: AppColors.secondary,
                              shape: BoxShape.circle),
                          child: SvgPicture.asset(
                            Assets.icons.adressBook,
                            color: AppColors.primary,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Access your contacts",
                                style: AppStyles.textStyle(
                                    color: AppColors.primaryText),
                              ),
                              Text(
                                "Share money with your contacts",
                                style: AppStyles.textStyle(
                                  color: AppColors.primaryText,
                                  size: 13.0,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              : const SizedBox();
        }),
        Obx(() {
          return _contactController.contacts.isNotEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SectionTitleWidget(title: "Conatcts on Send Nkap"),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: InputField(
                        labelText: "Name, username, phone",
                        hasIcon: false,
                        isElevated: false,
                        hasShadow: false,
                        hasSuffix: true,
                        hasMarginRight: false,
                        contentPadding: 14.0,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: SvgPicture.asset(
                            Assets.icons.userSearch,
                            width: 23.0,
                            height: 23.0, //20.0
                            color: AppColors.secondaryText,
                          ),
                        ),
                        icon: Icons.abc,
                        keyboardType: TextInputType.text,
                        iconColor: AppColors.primaryText,
                        value: "",
                        onChanged: (String value) {
                          _contactController.searchAContact(input: value);
                        },
                      ),
                    ),
                    Obx(() {
                      return ListView.builder(
                          scrollDirection: Axis.vertical,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount:
                              min(_contactController.searchContacts.length, 10),
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) {
                            return ContactWidget(
                              contact: _contactController.searchContacts[index],
                            );
                          });
                    })
                  ],
                )
              : const SizedBox();
        })
      ],
    );
  }
}
