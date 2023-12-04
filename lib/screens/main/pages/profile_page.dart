import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:senkap/controllers/confetti_controller.dart';
import 'package:senkap/gen/assets.gen.dart';
import 'package:senkap/ressources/app_colors.dart';
import 'package:senkap/ressources/app_styles.dart';
import 'package:senkap/ressources/commons.dart';
import 'package:senkap/ressources/constants.dart';
import 'package:senkap/screens/faq/faq_screen.dart';
import 'package:senkap/screens/main/main_screen.dart';
import 'package:senkap/widgets/input_label.dart';

import '../../../controllers/profile_controller.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  final ProfileController _profileController = Get.find();
  final AppConfettiController _appConfettiController = Get.find();
  // final UserController _userController = Get.put(UserController());
  // final TopNavBarController _topNavBarController =
  //     Get.put(TopNavBarController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // _topNavBarController.setPageIndex(0);
        // Get.offAll(MainScreen());
        return false;
      },
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              if (_profileController.isLanguageBottomSheetShow.value) {
                _profileController.isLanguageBottomSheetShow(false);
              } else if (_profileController.isLogOutBottomSheetShow.value) {
                _profileController.isLogOutBottomSheetShow(false);
              }
            },
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 34.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 61.0),
                              child: Container(
                                padding: const EdgeInsets.only(bottom: 23.0),
                                decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.circular(27.0)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // TODO: add app icon here
                                    SvgPicture.asset(
                                      Assets.icons.user,
                                      width:
                                          Constants.screenWidth(context) / 3.5,
                                    ),
                                    SizedBox(
                                      width:
                                          Constants.screenWidth(context) / 1.5,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(top: 10.0),
                                        child: Column(
                                          children: [
                                            // localUser.name!
                                            //             .split(" ")
                                            //             .length >
                                            //         2
                                            //     ? Text(
                                            //         "${localUser.name!.split(" ")[0].capitalize!} ${localUser.name!.split(" ")[1].capitalize!}",
                                            //         textAlign:
                                            //             TextAlign.center,
                                            //         style: AppStyles.textStyle(
                                            //             color:
                                            //                 AppColors.white,
                                            //             size: Constants
                                            //                     .screenWidth(
                                            //                         context) *
                                            //                 0.07,
                                            //             weight:
                                            //                 FontWeight.w700,
                                            //             height: 0.9),
                                            //       )
                                            //     : localUser.name!
                                            //                 .split(" ")
                                            //                 .length >
                                            //             1
                                            //         ?
                                            Text(
                                              "name",
                                              // localUser.name!
                                              //     .split(" ")[0]
                                              //     .capitalize!,
                                              textAlign: TextAlign.center,
                                              style: AppStyles.textStyle(
                                                  color: AppColors.white,
                                                  size: Constants.screenWidth(
                                                          context) *
                                                      0.07,
                                                  weight: FontWeight.w700,
                                                  height: 0.9),
                                            ),
                                            // : const SizedBox(),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                // localUser.name!
                                                //             .split(" ")
                                                //             .length >
                                                //         1
                                                //     ?
                                                Text(
                                                  "lastname",
                                                  // localUser.name!
                                                  //     .split(" ")
                                                  //     .last,
                                                  textAlign: TextAlign.center,
                                                  style: AppStyles.textStyle(
                                                      color: AppColors.white,
                                                      size:
                                                          Constants.screenWidth(
                                                                  context) *
                                                              0.07,
                                                      weight: FontWeight.w700,
                                                      height: 0.9),
                                                ),
                                                // : Text(
                                                //     localUser.name!,
                                                //     textAlign:
                                                //         TextAlign.center,
                                                //     style: AppStyles.textStyle(
                                                //         color: AppColors
                                                //             .white,
                                                //         size: Constants
                                                //                 .screenWidth(
                                                //                     context) *
                                                //             0.07,
                                                //         weight: FontWeight
                                                //             .w700,
                                                //         height: 0.9),
                                                //   ),
                                                const SizedBox(width: 3.0),
                                                SvgPicture.asset(
                                                    Assets.icons.certify)
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 11.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "+237 698509488",
                                            // "+237 ${localUser.phone}",
                                            style: AppStyles.textStyle(
                                              color: AppColors.white,
                                              size: 11.0,
                                              weight: FontWeight.w700,
                                            ),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(
                                                left: 12.0, right: 7.0),
                                            child: Icon(
                                              FontAwesomeIcons.locationDot,
                                              color: AppColors.white,
                                              size: 12.0,
                                            ),
                                          ),
                                          Text(
                                            // localUser.city != null &&
                                            //         localUser.city!.isNotEmpty
                                            // ?
                                            "Cameroun, Douala"
                                                // ? "Cameroun, ${localUser.city}"
                                                .capitalize!,
                                            // : "Cameroun, yaoundé",
                                            style: AppStyles.textStyle(
                                              color: AppColors.white,
                                              size: 12.0,
                                              weight: FontWeight.w700,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        // Get.to(() => UpdateProfileScreen());
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 70.0),
                                        width: double.infinity,
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10.0),
                                        decoration: BoxDecoration(
                                            color: AppColors.white,
                                            borderRadius:
                                                BorderRadius.circular(32.0)),
                                        child: Text(
                                          "Voir profil",
                                          // "Modifier profil",
                                          textAlign: TextAlign.center,
                                          style: AppStyles.textStyle(
                                            color: AppColors.primaryText,
                                            size: 16.0,
                                            weight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Stack(
                                children: [
                                  Container(
                                    // width: 130, //174
                                    // height: 174, //174
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 29.0, horizontal: 36.0),
                                    decoration: BoxDecoration(
                                      color: AppColors.bgColor,
                                      borderRadius: BorderRadius.circular(64),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color(0x26000000),
                                          blurRadius: 42,
                                          offset: Offset(0, 4),
                                          spreadRadius: 0,
                                        )
                                      ],
                                    ),
                                    child: SvgPicture.asset(
                                      Assets.icons.user,
                                      fit: BoxFit.fill,
                                      width: 120.0,
                                      color: AppColors.white,
                                    ),
                                    // child: ClipRRect(
                                    //   borderRadius: BorderRadius.circular(39),
                                    //   child: Image.asset(
                                    //     Assets.images.userProfile.path,
                                    //     fit: BoxFit.fill,
                                    //   ),
                                    // ),
                                  ),
                                  Positioned(
                                    right: 18.0,
                                    bottom: 18.0,
                                    child: Container(
                                      padding: const EdgeInsets.all(10.0),
                                      decoration: const BoxDecoration(
                                        color: AppColors.primary,
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        FontAwesomeIcons.camera,
                                        size: 18.0,
                                        color: AppColors.white,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 13.0),
                          // padding:
                          // const EdgeInsets.only(top: 21.0, bottom: 14.0),
                          padding: const EdgeInsets.only(
                              left: 10.0, right: 10.0, top: 21.0, bottom: 14.0),
                          decoration: BoxDecoration(
                              color: AppColors.bgOpacColor,
                              borderRadius: BorderRadius.circular(13.0)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Gagnez de l’argent en invitant vos amis",
                                textAlign: TextAlign.center,
                                style: AppStyles.textStyle(
                                    color: AppColors.primaryText,
                                    size: 23.0,
                                    weight: FontWeight.w700,
                                    height: 0.9),
                              ),
                              InputLabel(
                                  label: "Mon code de reference",
                                  paddingTop: 14.0),
                              Container(
                                padding: const EdgeInsets.all(14.0),
                                decoration: BoxDecoration(
                                    color: AppColors.imputBg,
                                    borderRadius: BorderRadius.circular(5.0)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      // localUser.sponsorshipCode != null &&
                                      //         localUser
                                      //             .sponsorshipCode!.isNotEmpty
                                      //     ? localUser.sponsorshipCode!
                                      //     : "",
                                      // :
                                      "skp-marie5587",
                                      style: AppStyles.textStyle(
                                        color: AppColors.primaryText,
                                        size: 14.0,
                                        weight: FontWeight.w400,
                                      ),
                                    ),
                                    // localUser.sponsorshipCode != null
                                    //     ?
                                    GestureDetector(
                                      onTap: () async {
                                        await Clipboard.setData(
                                            const ClipboardData(
                                                text: "skp-marie5587"));
                                        // text: localUser
                                        //     .sponsorshipCode!
                                        //     .toString()));
                                        Get.rawSnackbar(
                                            backgroundColor:
                                                AppColors.primaryText,
                                            borderRadius: 10.0,
                                            // colorText: AppColors.white,
                                            snackPosition: SnackPosition.BOTTOM,
                                            margin: const EdgeInsets.only(
                                                bottom: 40.0,
                                                left: 22.0,
                                                right: 22.0),
                                            messageText: Center(
                                              child: Text(
                                                'copié',
                                                style: AppStyles.textStyle(
                                                  color: Colors.white,
                                                  size: 12,
                                                  weight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10.0));
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12.0, vertical: 6.0),
                                        decoration: BoxDecoration(
                                            color: AppColors.primary,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Text(
                                          'copier',
                                          style: AppStyles.textStyle(
                                            color: Colors.white,
                                            size: 12,
                                            weight: FontWeight.w700,
                                            // height: 0.17,
                                            // letterSpacing: -0.48,
                                          ),
                                        ),
                                      ),
                                    )
                                    // : const SizedBox()
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 7.0, bottom: 11.0),
                                child: RichText(
                                    text: TextSpan(children: [
                                  TextSpan(
                                      text: "Vous recevez ",
                                      style: AppStyles.textStyle(
                                          color: AppColors.primaryText,
                                          size: 12.0,
                                          weight: FontWeight.w700)),
                                  TextSpan(
                                      text: "un bonus de recharge ",
                                      style: AppStyles.textStyle(
                                          color: AppColors.primary,
                                          size: 12.0,
                                          weight: FontWeight.w700)),
                                  TextSpan(
                                      text:
                                          "par personne à la création de leur premiere carte",
                                      style: AppStyles.textStyle(
                                          color: AppColors.primaryText,
                                          size: 12.0,
                                          weight: FontWeight.w700))
                                ])),
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                    left: 70.0, right: 70.0),
                                width: double.infinity,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.circular(32.0)),
                                child: Text(
                                  "Inviter un ami",
                                  textAlign: TextAlign.center,
                                  style: AppStyles.textStyle(
                                    color: AppColors.white,
                                    size: 16.0,
                                    weight: FontWeight.w500,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 16.0),
                          padding: const EdgeInsets.only(
                              left: 25.0, right: 19.0, top: 15.0, bottom: 15.0),
                          decoration: BoxDecoration(
                              color: AppColors.bgOpacColor,
                              borderRadius: BorderRadius.circular(13.0)),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10.0),
                                  child: Text(
                                    "Aide",
                                    style: AppStyles.textStyle(
                                      color: AppColors.primaryText,
                                      size: 10.0,
                                      weight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  onTap: () {
                                    Commons.showAlertDialog(
                                        context: context,
                                        title: "Nous Contacter",
                                        body:
                                            "Nous joindre sur whatsapp\n wa.me/+237698509488",
                                        isDoubleClick: true,
                                        textButtonCancel: "Ok",
                                        textButtonAccept: "Rejoindre");
                                    // Get.to(() => ServiceScreen());
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            Assets.icons.service,
                                            color: AppColors.primary,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 26.0),
                                            child: Text(
                                              "Service client".capitalize!,
                                              textAlign: TextAlign.center,
                                              style: AppStyles.textStyle(
                                                color: AppColors.primaryText,
                                                size: 14.0,
                                                weight: FontWeight.w500,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      const Icon(
                                        FontAwesomeIcons.chevronRight,
                                        size: 20.0,
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 40.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    onTap: () {
                                      Get.to(() => FAQScreen(),
                                          transition: Transition.cupertino,
                                          duration:
                                              const Duration(milliseconds: 500),
                                          curve: Curves.linear);
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                              Assets.icons.question,
                                              color: AppColors.primary,
                                              width: 25.0,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 26.0),
                                              child: Text(
                                                "FAQ",
                                                textAlign: TextAlign.center,
                                                style: AppStyles.textStyle(
                                                  color: AppColors.primaryText,
                                                  size: 14.0,
                                                  weight: FontWeight.w500,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        const Icon(
                                          FontAwesomeIcons.chevronRight,
                                          size: 20.0,
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ]),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 12.0),
                          padding: const EdgeInsets.only(
                              left: 25.0, right: 19.0, top: 15.0, bottom: 15.0),
                          decoration: BoxDecoration(
                              color: AppColors.bgOpacColor,
                              borderRadius: BorderRadius.circular(13.0)),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10.0),
                                  child: Text(
                                    "Aide",
                                    style: AppStyles.textStyle(
                                      color: AppColors.primaryText,
                                      size: 10.0,
                                      weight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          Assets.icons.moon,
                                          color: AppColors.primary,
                                          width: 25.0,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 26.0),
                                          child: Text(
                                            "Dark mode".capitalize!,
                                            textAlign: TextAlign.center,
                                            style: AppStyles.textStyle(
                                              color: AppColors.primaryText,
                                              size: 14.0,
                                              weight: FontWeight.w500,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Obx(() {
                                      return Row(
                                        children: [
                                          Text(
                                            _profileController
                                                    .isDarkModelActivated.value
                                                ? "On".capitalize!
                                                : 'Off'.capitalize!,
                                            style: AppStyles.textStyle(
                                              color: AppColors.primaryText,
                                              size: 12,
                                              weight: FontWeight.w400,
                                            ),
                                          ),
                                          const SizedBox(width: 3.0),
                                          CupertinoSwitch(
                                            value: _profileController
                                                .isDarkModelActivated.value,
                                            onChanged: (bool? value) {
                                              _profileController
                                                  .isDarkModelActivated(value);
                                            },
                                          ),
                                        ],
                                      );
                                    })
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 40.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            Assets.icons.print,
                                            color: AppColors.primary,
                                            width: 25.0,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 26.0),
                                            child: Text(
                                              "Empreintes digitales"
                                                  .capitalize!,
                                              textAlign: TextAlign.center,
                                              style: AppStyles.textStyle(
                                                color: AppColors.primaryText,
                                                size: 14.0,
                                                weight: FontWeight.w500,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Obx(() {
                                        return Row(
                                          children: [
                                            Text(
                                              _profileController
                                                      .isBiometricActivated
                                                      .value
                                                  ? "On".capitalize!
                                                  : 'Off'.capitalize!,
                                              style: AppStyles.textStyle(
                                                color: AppColors.primaryText,
                                                size: 12,
                                                weight: FontWeight.w400,
                                              ),
                                            ),
                                            const SizedBox(width: 3.0),
                                            CupertinoSwitch(
                                              value: _profileController
                                                  .isBiometricActivated.value,
                                              onChanged: (bool? value) {
                                                _profileController
                                                    .isBiometricActivated(
                                                        value);
                                              },
                                            ),
                                          ],
                                        );
                                      })
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 40.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    onTap: () {
                                      if (_profileController
                                          .isLogOutBottomSheetShow.value) {
                                        _profileController
                                            .isLogOutBottomSheetShow(false);
                                      }
                                      _profileController
                                          .isLanguageBottomSheetShow(true);
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                              Assets.icons.language,
                                              color: AppColors.primary,
                                              width: 25.0,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 26.0),
                                              child: Text(
                                                "Langue".capitalize!,
                                                textAlign: TextAlign.center,
                                                style: AppStyles.textStyle(
                                                  color: AppColors.primaryText,
                                                  size: 14.0,
                                                  weight: FontWeight.w500,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Obx(() {
                                              return Text(
                                                _profileController
                                                    .selectedLanguage
                                                    .value
                                                    .capitalize!,
                                                style: AppStyles.textStyle(
                                                  color: AppColors.primaryText,
                                                  size: 12,
                                                  weight: FontWeight.w400,
                                                ),
                                              );
                                            }),
                                            const SizedBox(width: 35.96),
                                            const Icon(
                                              FontAwesomeIcons.chevronRight,
                                              size: 20.0,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ]),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 12.0),
                          padding: const EdgeInsets.only(
                              left: 25.0, right: 19.0, top: 15.0, bottom: 15.0),
                          decoration: BoxDecoration(
                              color: AppColors.bgOpacColor,
                              borderRadius: BorderRadius.circular(13.0)),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10.0),
                                  child: Text(
                                    "Mon Compte".capitalize!,
                                    style: AppStyles.textStyle(
                                      color: AppColors.primaryText,
                                      size: 10.0,
                                      weight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          Assets.icons.password,
                                          color: AppColors.primary,
                                          width: 20.0,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 26.0),
                                          child: Text(
                                            "Mot de passe".capitalize!,
                                            textAlign: TextAlign.center,
                                            style: AppStyles.textStyle(
                                              color: AppColors.primaryText,
                                              size: 14.0,
                                              weight: FontWeight.w500,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    const Icon(
                                      FontAwesomeIcons.chevronRight,
                                      size: 20.0,
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 40.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            Assets.icons.certify,
                                            color: AppColors.primary,
                                            width: 25.0,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 22.0),
                                            child: Text(
                                              "Vous êtes déjà vérifié",
                                              textAlign: TextAlign.center,
                                              style: AppStyles.textStyle(
                                                color: AppColors.primaryText,
                                                size: 14.0,
                                                weight: FontWeight.w500,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      const Icon(
                                        FontAwesomeIcons.chevronRight,
                                        size: 20.0,
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 40.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            Assets.icons.security,
                                            color: AppColors.primary,
                                            width: 20.0,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 26.0),
                                            child: Text(
                                              "Politique de confidentialité"
                                                  .capitalize!,
                                              textAlign: TextAlign.center,
                                              style: AppStyles.textStyle(
                                                color: AppColors.primaryText,
                                                size: 14.0,
                                                weight: FontWeight.w500,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      const Icon(
                                        FontAwesomeIcons.chevronRight,
                                        size: 20.0,
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 40.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            Assets.icons.cachet,
                                            color: AppColors.primary,
                                            width: 20.0,
                                          ),
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 26.0),
                                              child: Text.rich(
                                                TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: 'Termes ',
                                                      style:
                                                          AppStyles.textStyle(
                                                        color: AppColors
                                                            .primaryText,
                                                        size: 14,
                                                        weight: FontWeight.w500,
                                                        // height: 0.9,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: '&',
                                                      style:
                                                          AppStyles.textStyle(
                                                        color: AppColors
                                                            .primaryText,
                                                        size: 14,
                                                        weight: FontWeight.w500,
                                                        // height: 0.9,
                                                        // letterSpacing: -0.12,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: ' Conditions',
                                                      style:
                                                          AppStyles.textStyle(
                                                        color: AppColors
                                                            .primaryText,
                                                        size: 14,
                                                        weight: FontWeight.w500,
                                                        // height: 0.9,
                                                        // letterSpacing: -0.12,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                              // Text(
                                              //     "termes & conditions".capitalize!,
                                              //     textAlign: TextAlign.center,
                                              //     style: AppStyles.textStyle(
                                              //       color: AppColors.primaryText,
                                              //       size: 15.0,
                                              //       weight: FontWeight.w500,
                                              //     ),
                                              //   ),
                                              )
                                        ],
                                      ),
                                      const Icon(
                                        FontAwesomeIcons.chevronRight,
                                        size: 20.0,
                                      )
                                    ],
                                  ),
                                ),
                              ]),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 12.0),
                          padding: const EdgeInsets.only(
                              left: 25.0, right: 19.0, top: 10.0, bottom: 15.0),
                          decoration: BoxDecoration(
                              color: AppColors.bgOpacColor,
                              borderRadius: BorderRadius.circular(13.0)),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10.0),
                                  child: Text(
                                    "Plus".capitalize!,
                                    style: AppStyles.textStyle(
                                      color: AppColors.primaryText,
                                      size: 10.0,
                                      weight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  onTap: () {
                                    if (_profileController
                                        .isLanguageBottomSheetShow.value) {
                                      _profileController
                                          .isLanguageBottomSheetShow(false);
                                    }
                                    _profileController
                                        .isLogOutBottomSheetShow(true);
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            Assets.icons.logout,
                                            color: AppColors.primary,
                                            width: 20.0,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 26.0),
                                            child: Text(
                                              "déconnexion".capitalize!,
                                              textAlign: TextAlign.center,
                                              style: AppStyles.textStyle(
                                                color: AppColors.primaryText,
                                                size: 14.0,
                                                weight: FontWeight.w500,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      const Icon(
                                        FontAwesomeIcons.chevronRight,
                                        size: 20.0,
                                      )
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Commons.showAlertDialog(
                                        context: context,
                                        title: "Mise à jour",
                                        body: "Vous etes a jour",
                                        isDoubleClick: false,
                                        textButtonCancel: "Ok");
                                  },
                                  child: Container(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 40.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                Assets.icons.circle,
                                                color: AppColors.primary,
                                                width: 25.0,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 26.0),
                                                child: Text(
                                                  "Mise à Jour",
                                                  textAlign: TextAlign.center,
                                                  style: AppStyles.textStyle(
                                                    color:
                                                        AppColors.primaryText,
                                                    size: 14.0,
                                                    weight: FontWeight.w500,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          const Icon(
                                            FontAwesomeIcons.chevronRight,
                                            size: 20.0,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  print("jsfdk");
                                  _appConfettiController.controllerTopCenter
                                      .play();
                                },
                                child: const Icon(
                                  FontAwesomeIcons.solidHeart,
                                  color: AppColors.primary,
                                ),
                              ),
                              const SizedBox(height: 10.0),
                              Text(
                                "Vous etes utilisateur Senkap",
                                textAlign: TextAlign.center,
                                style: AppStyles.textStyle(
                                  color: AppColors.primaryText,
                                  size: 14.0,
                                  weight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                "depuis x jours",
                                textAlign: TextAlign.center,
                                style: AppStyles.textStyle(
                                  color: AppColors.primaryText,
                                  size: 14.0,
                                  weight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Text(
                            "Version 1.0",
                            textAlign: TextAlign.center,
                            style: AppStyles.textStyle(
                              color: AppColors.primaryText,
                              size: 14.0,
                              weight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
