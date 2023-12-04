import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:keyboard_visibility_pro/keyboard_visibility_pro.dart';
import 'package:senkap/screens/login/login_screen.dart';
import 'package:senkap/screens/main/pages/dashboard_page.dart';
import 'package:senkap/screens/main/pages/profile_page.dart';
import '../../controllers/bottom_nav_bar_controller.dart';
import '../../controllers/confetti_controller.dart';
import '../../controllers/profile_controller.dart';
import '../../controllers/tab_bar_controller.dart';
import '../../gen/assets.gen.dart';
import '../../ressources/app_colors.dart';
import '../../ressources/app_styles.dart';
import '../../ressources/constants.dart';
import 'components/app_bar/app_bar_component.dart';
import 'pages/history_page.dart';
import 'pages/home_page.dart';
import 'components/bottom_nav_bar/bottom_nav_bar.dart';
import 'pages/transfer_page.dart';
import '../../widgets/primary_button_widget.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  final BottomNavBarController _bottomNavBarController =
      Get.put(BottomNavBarController());
  final ProfileController _profileController = Get.put(ProfileController());
  final AppConfettiController _appConfettiController =
      Get.put(AppConfettiController());
  // final FormController _formController = Get.put(FormController());
  // final TransactionController _transactionController =
  //     Get.put(TransactionController());
  ConfettiController controllerTopCenter =
      ConfettiController(duration: const Duration(seconds: 2));
  @override
  Widget build(BuildContext context) {
    return KeyboardVisibility(
      onChanged: (bool isVisible) {
        print(_bottomNavBarController.isKeyboardVisible);
        _bottomNavBarController.isKeyboardVisible(isVisible);
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: GestureDetector(
          onTap: () {},
          child: SafeArea(
            child: Stack(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Differents pages displayed on the main screen
                NotificationListener<ScrollNotification>(
                  onNotification: (ScrollNotification scrollInfo) {
                    // Vous pouvez accéder aux informations sur le défilement ici
                    print('Pixels: ${scrollInfo.metrics.pixels}');
                    print('Max Scroll: ${scrollInfo.metrics.maxScrollExtent}');
                    print('Extent Before: ${scrollInfo.metrics.extentBefore}');
                    print('Extent After: ${scrollInfo.metrics.extentAfter}');
                    if (scrollInfo.metrics.extentAfter == 0.0) {
                      _bottomNavBarController
                          .isBottomNavBarTransparent(false); //true
                    } else {
                      _bottomNavBarController.isBottomNavBarTransparent(false);
                    }
                    if (scrollInfo.metrics.extentBefore != 0) {
                      _bottomNavBarController.isAppBarElevated(true);
                    } else {
                      _bottomNavBarController.isAppBarElevated(false);
                    }
                    // Retournez true pour indiquer que la notification a été traitée
                    return true;
                  },
                  child: SingleChildScrollView(
                    controller: _bottomNavBarController.scrollController,
                    child: Obx(() {
                      return Padding(
                        padding: EdgeInsets.only(
                            top: _bottomNavBarController.pageIndex.value == 0
                                ? 90.0
                                : _bottomNavBarController.pageIndex.value == 1
                                    ? 70.0
                                    : _bottomNavBarController.pageIndex.value ==
                                            2
                                        ? 70.0
                                        : _bottomNavBarController
                                                    .pageIndex.value ==
                                                3
                                            ? 80.0
                                            : _bottomNavBarController
                                                        .pageIndex.value ==
                                                    4
                                                ? 70.0
                                                : 140.0), //90.0
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  _bottomNavBarController.pageIndex.value == 0
                                      ? 0.0
                                      : Constants.defaultHorizontalMargin),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _bottomNavBarController.pageIndex.value == 0
                                  ? HomePage()
                                  : _bottomNavBarController.pageIndex.value == 1
                                      ? DashboardPage()
                                      : _bottomNavBarController
                                                  .pageIndex.value ==
                                              2
                                          ? TransferPage()
                                          : _bottomNavBarController
                                                      .pageIndex.value ==
                                                  4
                                              ? ProfilePage()
                                              : HistoryPage(),
                              // Obx(() => _bottomNavBarController.pageIndex.value ==
                              //         0
                              //     // ? _formController.isAccountVerified.value && //TODO: uncomment this
                              //     ? (localUser.isProfileVerified != null &&
                              //             localUser
                              //                 .isProfileVerified!) //FIXME: Remove this comment
                              //         ? HomePage()
                              //         : UnverifiedHomeScreen()
                              //     : _bottomNavBarController.pageIndex.value == 1
                              //         ? CardsScreen()
                              //         : _bottomNavBarController.pageIndex.value ==
                              //                 2
                              //             ? TransfertsScreen()
                              //             : _bottomNavBarController
                              //                         .pageIndex.value ==
                              //                     3
                              //                 ? HistoryScreen()
                              //                 : _bottomNavBarController
                              //                             .pageIndex.value ==
                              //                         4
                              //                     ? const ServiceScreen()
                              //                     // : _bottomNavBarController
                              //                     //             .pageIndex
                              //                     //             .value ==
                              //                     //         5
                              //                     //     ? AddCardDescriptionScreen()
                              //                     : _bottomNavBarController
                              //                                 .pageIndex
                              //                                 .value ==
                              //                             6
                              //                         ? ChooseCardScreen()
                              //                         : RechargeCardDescriptionScreen()),
                              // _bottomNavBarController.pageIndex.value == 5
                              //     ? Align(
                              //         alignment: Alignment.bottomCenter,
                              //         child: SvgPicture.asset(
                              //           Assets.images.createCardBg,
                              //           width: Constants.screenWidth(context),
                              //         ),
                              //       )
                              //     : SizedBox(),
                              // _bottomNavBarController.isKeyboardVisible.value
                              //     ? SizedBox(
                              //         height: _bottomNavBarController
                              //                     .pageIndex.value !=
                              //                 4
                              //             ? Constants.screenHeight(context) / 25
                              //             : Constants.screenHeight(context) / 6)
                              //     : _bottomNavBarController.pageIndex.value != 4
                              //         ? SizedBox(
                              //             height:
                              //                 Constants.screenHeight(context) /
                              //                     30,
                              //           )
                              //         : SizedBox(
                              //             height:
                              //                 Constants.screenHeight(context) /
                              //                     6),

                              // New implementation
                              SizedBox(
                                  height: Constants.screenHeight(context) / 15),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),

                // }),
                AppBarComponent(),
                Align(
                  alignment: Alignment.topCenter,
                  child: ConfettiWidget(
                    confettiController:
                        _appConfettiController.controllerTopCenter,
                    blastDirection: pi / 5000000000000000000,
                    maxBlastForce: 5, // set a lower max blast force
                    minBlastForce: 1, // set a lower min blast force
                    emissionFrequency: 0.05,
                    numberOfParticles: 100, // a lot of particles at once
                    gravity: 0,

                    blastDirectionality: BlastDirectionality
                        .explosive, // don't specify a direction, blast randomly
                    shouldLoop:
                        false, // start again as soon as the animation is finished
                    colors: const [
                      Colors.green,
                      Colors.blue,
                      Colors.pink,
                      Colors.orange,
                      Colors.purple
                    ], // manually specify the colors to be used
                    // createParticlePath: _appConfettiController
                    //     .drawStar, // define a custom shape/path.
                  ),
                ),
                BottomNavBar(),

                Obx(() {
                  return _profileController.isLogOutBottomSheetShow.value ||
                          _profileController.isLanguageBottomSheetShow.value
                      ? Align(
                          alignment: Alignment.bottomCenter,
                          child: IntrinsicHeight(
                            child: Container(
                              padding: const EdgeInsets.only(
                                  top: 32.0,
                                  left: 20.0,
                                  right: 20.0,
                                  bottom: 50.0),
                              decoration: const BoxDecoration(
                                  color: AppColors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0x33000000),
                                      blurRadius: 24,
                                      offset: Offset(0, -12),
                                      spreadRadius: 0,
                                    )
                                  ],
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(26.0),
                                      topRight: Radius.circular(26.0))),
                              child: _profileController
                                      .isLogOutBottomSheetShow.value
                                  ? Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 18.0),
                                          child: Text(
                                            "Déconnecter ?",
                                            textAlign: TextAlign.center,
                                            style: AppStyles.textStyle(
                                              color: AppColors.primaryText,
                                              size: 27.0,
                                              weight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                Get.to(
                                                    () => const LoginScreen(),
                                                    transition:
                                                        Transition.cupertino,
                                                    duration: const Duration(
                                                        milliseconds: 500),
                                                    curve: Curves.linear);
                                                // _userController.logoutUser(context);
                                                // Get.off(() => LoginScreen());
                                              },
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 15.0,
                                                        horizontal: 20.0),
                                                decoration: BoxDecoration(
                                                    color: AppColors.primary,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            32.0)),
                                                child: Text(
                                                  "Continuer",
                                                  textAlign: TextAlign.center,
                                                  style: AppStyles.textStyle(
                                                    color: AppColors.white,
                                                    size: 16.0,
                                                    weight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 30.0),
                                            GestureDetector(
                                              onTap: () {
                                                _profileController
                                                    .isLogOutBottomSheetShow(
                                                        false);
                                              },
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 15.0,
                                                        horizontal: 20.0),
                                                decoration: BoxDecoration(
                                                    color: AppColors.imputBg,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            32.0)),
                                                child: Text(
                                                  "Annuler",
                                                  textAlign: TextAlign.center,
                                                  style: AppStyles.textStyle(
                                                    color:
                                                        AppColors.primaryText,
                                                    size: 16.0,
                                                    weight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    )
                                  : _profileController
                                          .isLanguageBottomSheetShow.value
                                      ? Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              onTap: () {
                                                _profileController
                                                    .selectedLanguage(
                                                        "Français");
                                                _profileController
                                                    .isLanguageBottomSheetShow(
                                                        false);
                                              },
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "FR",
                                                    style: AppStyles.textStyle(
                                                      color: AppColors
                                                          .secondaryText,
                                                      size: 14.0,
                                                      weight: FontWeight.w500,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 21.0),
                                                  Text(
                                                    "Français",
                                                    style: AppStyles.textStyle(
                                                      color:
                                                          AppColors.primaryText,
                                                      size: 14.0,
                                                      weight: FontWeight.w500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 21.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                onTap: () {
                                                  _profileController
                                                      .selectedLanguage(
                                                          "Anglais");
                                                  _profileController
                                                      .isLanguageBottomSheetShow(
                                                          false);
                                                },
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      "EN",
                                                      style:
                                                          AppStyles.textStyle(
                                                        color: AppColors
                                                            .secondaryText,
                                                        size: 14.0,
                                                        weight: FontWeight.w500,
                                                      ),
                                                    ),
                                                    const SizedBox(width: 21.0),
                                                    Text(
                                                      "Anglais",
                                                      style:
                                                          AppStyles.textStyle(
                                                        color: AppColors
                                                            .primaryText,
                                                        size: 14.0,
                                                        weight: FontWeight.w500,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                      : const SizedBox(),
                            ),
                          ),
                        )
                      : const SizedBox();
                }),
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}
