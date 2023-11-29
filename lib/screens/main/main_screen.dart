import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:keyboard_visibility_pro/keyboard_visibility_pro.dart';
import 'package:send_nkap/screens/main/pages/dashboard_page.dart';
import 'package:send_nkap/screens/main/pages/profile_page.dart';
import '../../controllers/bottom_nav_bar_controller.dart';
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
  // final FormController _formController = Get.put(FormController());
  // final TransactionController _transactionController =
  //     Get.put(TransactionController());
  @override
  Widget build(BuildContext context) {
    return KeyboardVisibility(
      onChanged: (bool isVisible) {
        print(_bottomNavBarController.isKeyboardVisible);
        _bottomNavBarController.isKeyboardVisible(isVisible);
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        body:
            // ((_transactionController.transactions == null ||
            //             _transactionController.transactions!.isEmpty) &&
            //         _bottomNavBarController.pageIndex.value == 3)
            //     ? Center(
            //         child: LoadingAnimationWidget.inkDrop(
            //           color: AppColors.primary,
            //           size: 20,
            //         ),
            //       )
            //     :
            GestureDetector(
          onTap: () {
            // if (_formController.isBottomSheetShow.value) {
            //   _formController.isBottomSheetShow(false);
            // } else if (_formController
            //     .isAccountTransactionBottomSheetShow.value) {
            //   // _formController.isAccountTransactionBottomSheetShow(false); FIXME: uncomment this
            // } else if (_formController.isCardDetailsBottomSheetShow.value) {
            //   _formController.isCardDetailsBottomSheetShow(false);
            // }
//Search text field
            // Padding(
            //         padding: const EdgeInsets.only(top: 25.0, bottom: 20.0),
            //         child: InputField(
            //           labelText: "Name, username, phone",
            //           hasIcon: false,
            //           isElevated: false,
            //           hasShadow: false,
            //           hasSuffix: true,
            //           hasMarginRight: false,
            //           contentPadding: 14.0,
            //           suffixIcon: Padding(
            //             padding: const EdgeInsets.symmetric(vertical: 10.0),
            //             child: SvgPicture.asset(
            //               Assets.icons.userSearch,
            //               width: 23.0,
            //               height: 23.0, //20.0
            //               color: AppColors.secondaryText,
            //             ),
            //           ),
            //           icon: Icons.abc,
            //           keyboardType: TextInputType.number,
            //           iconColor: AppColors.primaryText,
            //           value: "",
            //           onChanged: (String value) {},
            //         ),
            //       ),
          },
          child: SafeArea(
            child: Stack(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Obx(() {
                //   return _bottomNavBarController.pageIndex.value == 2 &&
                //           !_bottomNavBarController.isKeyboardVisible.value
                //       ? Align(
                //           alignment: Alignment.bottomCenter,
                //           child: SizedBox(
                //             width: double.infinity,
                //             child: SvgPicture.asset(
                //               Assets.images.transfertBg,
                //               fit: BoxFit.cover,
                //             ),
                //           ))
                //       : const SizedBox();
                // }),
                // Obx(() {
                //   return _bottomNavBarController.pageIndex.value == 4
                //       ? Container(
                //           height: Constants.screenHeight(context),
                //           width: Constants.screenWidth(context),
                //           color: AppColors.bgColor,
                //           child: SvgPicture.asset(
                //             Assets.images.chatBg,
                //             fit: BoxFit.cover,
                //           ))
                //       : const SizedBox();
                // }),

                // _bottomNavBarController.pageIndex.value == 5
                //     ? AddCardDescriptionScreen()
                //     :

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
                // _bottomNavBarController.pageIndex.value == 1 ||
                //         _bottomNavBarController.pageIndex.value == 5
                //     ? Align(
                //         alignment: Alignment.bottomCenter,
                //         child: Column(
                //           crossAxisAlignment: CrossAxisAlignment.end,
                //           mainAxisAlignment: MainAxisAlignment.end,
                //           children: [
                //             GestureDetector(
                //               onTap: () {
                //                 if (_bottomNavBarController.pageIndex.value == 1) {
                //                   _bottomNavBarController.pageIndex(5);
                //                 } else {
                //                   _bottomNavBarController.pageIndex(6);
                //                 }
                //                 // Get.to(AddCardDescriptionScreen());
                //               },
                //               child: Padding(
                //                 padding: const EdgeInsets.symmetric(
                //                     horizontal: 22.0),
                //                 child: PrimaryButtonWidget(
                //                   title:
                //                       _bottomNavBarController.pageIndex.value == 1
                //                           ? "Obtenir une nouvelle carte"
                //                           : "Créer ma carte maintenant",
                //                   butttonColor: AppColors.primaryText,
                //                   hasIcon: true,
                //                   paddingleft: 0.0,
                //                   sizedBoxSizes: 0.0,
                //                   textColor: AppColors.white,
                //                 ),
                //               ),
                //             ),
                //             SizedBox(
                //                 height: Constants.screenHeight(context) / 25),
                //           ],
                //         ),
                //       )
                //     : const SizedBox(),
                // Obx(() {
                //   return _bottomNavBarController.pageIndex.value == 2 &&
                //           !_bottomNavBarController.isKeyboardVisible.value
                //       ? Align(
                //           alignment: Alignment.bottomCenter,
                //           child: Padding(
                //             padding: EdgeInsets.only(
                //                 bottom: Constants.screenHeight(context) / 25,
                //                 left: 22.0,
                //                 right: 22.0),
                //             child: GestureDetector(
                //               onTap: () async {
                //                 _formController.fieldVerification(
                //                   field: _transactionController.amount.value,
                //                   isAmountBalance: true,
                //                   errorCallback: (String error) =>
                //                       _formController
                //                           .hasErrorOnRechargeAmount(error),
                //                 );
                //                 _formController.fieldVerification(
                //                   field: _transactionController.phone.value,
                //                   isSameUser: true,
                //                   errorCallback: (String error) =>
                //                       _formController
                //                           .hasErrorOnRechargePhone(error),
                //                 );
                //                 if (_formController.hasErrorOnRechargeAmount
                //                         .value.isEmpty &&
                //                     _formController
                //                         .hasErrorOnRechargePhone.isEmpty) {
                //                   if (_transactionController.receiver != null &&
                //                       _transactionController
                //                               .receiver!.value.name !=
                //                           null &&
                //                       _transactionController
                //                           .receiver!.value.name!.isNotEmpty) {
                //                     _bottomNavBarController
                //                         .loaderProvider("transfert");
                //                     Get.off(() => LoaderScreen());
                //                     _formController.isBottomSheetShow(false);
                //                     _formController
                //                         .isAccountTransactionBottomSheetShow(
                //                             false);
                //                     // Get.off(LoaderScreen());
                //                   } else {
                //                     Constants.snackBar(
                //                         bgColor: AppColors.red,
                //                         textColor: AppColors.white,
                //                         description:
                //                             "Aucun utilisateur trouvé");
                //                   }
                //                 }
                //               },
                //               child: const AppButtonWidget(
                //                 label: "Envoyer maintenant",
                //               ),
                //             ),
                //           ),
                //         )
                //       : const SizedBox();
                // }),
                // Obx(() {
                //   return _bottomNavBarController.pageIndex.value == 4
                //       ? Align(
                //           alignment: Alignment.bottomCenter,
                //           child: Column(
                //             mainAxisAlignment: MainAxisAlignment.end,
                //             children: [
                //               Container(
                //                 padding: const EdgeInsets.only(
                //                     top: 16.0,
                //                     bottom: 29.0,
                //                     left: 22.0,
                //                     right: 22.0),
                //                 color: AppColors.white,
                //                 child: Row(
                //                   children: [
                //                     Expanded(
                //                       child: InputField(
                //                         labelText: "message...",
                //                         hasIcon: false,
                //                         isElevated: false,
                //                         hasShadow: false,
                //                         hasSuffix: true,
                //                         maxLine: 1,
                //                         hasMaxLine: true,
                //                         isDoubleOnLine: true,
                //                         inputBg: AppColors.chatFieldBg,
                //                         // contentPadding: 16.0,
                //                         suffixIcon: IntrinsicWidth(
                //                           child: Row(
                //                             mainAxisAlignment:
                //                                 MainAxisAlignment.end,
                //                             children: [
                //                               Image.asset(
                //                                   Assets.icons.mic.path),
                //                               const SizedBox(width: 7.0),
                //                               Image.asset(
                //                                   Assets.icons.picture.path),
                //                             ],
                //                           ),
                //                         ),
                //                         icon: FontAwesomeIcons.a,
                //                         keyboardType: TextInputType.text,
                //                         iconColor: AppColors.primaryText,
                //                         value: "",
                //                         onChanged: (String value) {},
                //                       ),
                //                     ),
                //                     const SizedBox(width: 9.0),
                //                     Container(
                //                       height: 51.0,
                //                       width: 51.0,
                //                       decoration: const BoxDecoration(
                //                           color: AppColors.primary,
                //                           shape: BoxShape.circle),
                //                       child: Center(
                //                           child: SvgPicture.asset(
                //                               Assets.icons.plane)),
                //                     )
                //                   ],
                //                 ),
                //               ),
                //               // SizedBox(
                //               //     height:
                //               //         Constants.screenHeight(context) * 0.015),
                //             ],
                //           ),
                //         )
                //       : const SizedBox();
                // }),
                // Obx(() {
                //   return _formController.isBottomSheetShow.value
                //       ? Align(
                //           alignment: Alignment.bottomCenter,
                //           child: IntrinsicHeight(
                //             child: Container(
                //               padding: const EdgeInsets.only(
                //                   top: 32.0, left: 20.0, right: 20.0),
                //               decoration: const BoxDecoration(
                //                   color: AppColors.white,
                //                   boxShadow: [
                //                     BoxShadow(
                //                       color: Color(0x33000000),
                //                       blurRadius: 24,
                //                       offset: Offset(0, -12),
                //                       spreadRadius: 0,
                //                     )
                //                   ],
                //                   borderRadius: BorderRadius.only(
                //                       topLeft: Radius.circular(26.0),
                //                       topRight: Radius.circular(26.0))),
                //               child: Column(
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 children: [
                //                   Row(
                //                     mainAxisAlignment: MainAxisAlignment.end,
                //                     children: [
                //                       GestureDetector(
                //                         onTap: () {
                //                           _formController
                //                               .isBottomSheetShow(false);
                //                         },
                //                         child: const Icon(
                //                           FontAwesomeIcons.close,
                //                         ),
                //                       ),
                //                     ],
                //                   ),
                //                   _formController.isRechargeBottomSheet.value
                //                       ? SizedBox(
                //                           child: Text.rich(
                //                             TextSpan(
                //                               children: [
                //                                 TextSpan(
                //                                   text: 'Recharger en ',
                //                                   style: AppStyles.textStyle(
                //                                     color: AppColors.primaryText,
                //                                     size: 25,
                //                                     weight: FontWeight.w500,
                //                                     height: 0.9,
                //                                   ),
                //                                 ),
                //                                 TextSpan(
                //                                   text: '02 minutes',
                //                                   style: AppStyles.textStyle(
                //                                     color: AppColors.primary,
                //                                     size: 25,
                //                                     weight: FontWeight.w500,
                //                                     height: 0.9,
                //                                     // letterSpacing: -0.12,
                //                                   ),
                //                                 ),
                //                               ],
                //                             ),
                //                           ),
                //                         )
                //                       : SizedBox(
                //                           child: Text.rich(
                //                             TextSpan(
                //                               children: [
                //                                 TextSpan(
                //                                   text: 'Retirer en ',
                //                                   style: AppStyles.textStyle(
                //                                     color: AppColors.primary,
                //                                     size: 25,
                //                                     weight: FontWeight.w500,
                //                                     height: 0.9,
                //                                   ),
                //                                 ),
                //                                 TextSpan(
                //                                   text: 'vers mon compte',
                //                                   style: AppStyles.textStyle(
                //                                     color: AppColors.primaryText,
                //                                     size: 25,
                //                                     weight: FontWeight.w500,
                //                                     height: 0.9,
                //                                     // letterSpacing: -0.12,
                //                                   ),
                //                                 ),
                //                               ],
                //                             ),
                //                           ),
                //                         ),
                //                   const SizedBox(height: 8.0),
                //                   InputLabel(
                //                       label: "Montant à envoyer",
                //                       paddingTop: 10.0),
                //                   Padding(
                //                     padding: const EdgeInsets.only(top: 5.0),
                //                     child: InputField(
                //                       labelText: "5000",
                //                       hasIcon: false,
                //                       isElevated: false,
                //                       hasShadow: false,
                //                       hasSuffix: true,
                //                       isNotRegularCaracter: true,
                //                       inputBg: AppColors.imputBg,
                //                       contentPadding: 16.0,
                //                       suffixIcon: IntrinsicHeight(
                //                         child: IntrinsicWidth(
                //                           child: Container(
                //                               margin:
                //                                   const EdgeInsets.symmetric(
                //                                       vertical: 8.0),
                //                               padding: const EdgeInsets.only(
                //                                   left: 5.0, right: 5.0),
                //                               decoration: BoxDecoration(
                //                                   color: AppColors.primary,
                //                                   borderRadius:
                //                                       BorderRadius.circular(
                //                                           5.0)),
                //                               child: Center(
                //                                 child: RichText(
                //                                   text: TextSpan(
                //                                     text: "\$",
                //                                     style: const TextStyle(
                //                                       color: Colors.white,
                //                                       fontSize: 16,
                //                                       fontFamily: 'Poppins',
                //                                       fontWeight:
                //                                           FontWeight.w700,
                //                                       height: 0.09,
                //                                       letterSpacing: -0.64,
                //                                     ),
                //                                     children: [
                //                                       TextSpan(
                //                                           text: " USD",
                //                                           style: AppStyles
                //                                               .textStyle(
                //                                                   color:
                //                                                       AppColors
                //                                                           .white,
                //                                                   size: 16.0,
                //                                                   weight:
                //                                                       FontWeight
                //                                                           .w700))
                //                                     ],
                //                                   ),
                //                                 ),
                //                               )),
                //                         ),
                //                       ),
                //                       icon: FontAwesomeIcons.a,
                //                       keyboardType:
                //                           TextInputType.visiblePassword,
                //                       iconColor: AppColors.primaryText,
                //                       value: "",
                //                       onChanged: (String value) {},
                //                     ),
                //                   ),
                //                   Padding(
                //                     padding: const EdgeInsets.only(top: 5.0),
                //                     child: Row(
                //                       // mainAxisAlignment:
                //                       //     MainAxisAlignment.spaceBetween,
                //                       children: [
                //                         Text.rich(
                //                           TextSpan(
                //                             children: [
                //                               TextSpan(
                //                                 text: 'Frais de recharge: ',
                //                                 style: AppStyles.textStyle(
                //                                     color: AppColors.primaryText,
                //                                     size: 12.0,
                //                                     weight: FontWeight.w700),
                //                               ),
                //                               const TextSpan(
                //                                   text: '\$',
                //                                   style: TextStyle(
                //                                     color: Color(0xFF18BC7A),
                //                                     fontSize: 12,
                //                                     fontFamily: 'Poppins',
                //                                     fontWeight: FontWeight.w700,
                //                                     height: 0.17,
                //                                   )),
                //                               TextSpan(
                //                                 text: '2',
                //                                 style: AppStyles.textStyle(
                //                                     color: AppColors.primary,
                //                                     size: 12.0,
                //                                     weight: FontWeight.w700),
                //                               ),
                //                             ],
                //                           ),
                //                         ),
                //                         Padding(
                //                           padding:
                //                               const EdgeInsets.only(left: 22.0),
                //                           child: Text.rich(
                //                             TextSpan(
                //                               children: [
                //                                 TextSpan(
                //                                   text: 'Montant à débiter :',
                //                                   style: AppStyles.textStyle(
                //                                       color: AppColors.primaryText,
                //                                       size: 12.0,
                //                                       weight: FontWeight.w700),
                //                                 ),
                //                                 TextSpan(
                //                                   text: ' 1',
                //                                   style: AppStyles
                //                                       .textPoppinsStyle(
                //                                     color: AppColors.primary,
                //                                     size: 12,
                //                                     weight: FontWeight.w700,
                //                                     height: 0.17,
                //                                   ),
                //                                 ),
                //                                 TextSpan(
                //                                   text: '%',
                //                                   style: AppStyles.textStyle(
                //                                     color: AppColors.primary,
                //                                     size: 12.0,
                //                                     weight: FontWeight.w700,
                //                                   ),
                //                                 ),
                //                               ],
                //                             ),
                //                           ),
                //                         )
                //                       ],
                //                     ),
                //                   ),
                //                   const SizedBox(height: 28.0),
                //                   InputLabel(
                //                     label: "Mot de passe",
                //                     paddingTop: 15.0,
                //                   ),
                //                   Obx(() {
                //                     return InputField(
                //                       labelText: "",
                //                       hasIcon: false,
                //                       isElevated: false,
                //                       hasShadow: false,
                //                       hasSuffix: true,
                //                       isNotRegularCaracter: true,
                //                       obscureText:
                //                           _formController.isObscurePass.value,
                //                       hasMaxLine: true,
                //                       maxLine: 1,
                //                       contentPadding: 14.0,
                //                       suffixIcon: GestureDetector(
                //                           onTap: () {
                //                             _formController
                //                                     .isObscurePass.value =
                //                                 !_formController
                //                                     .isObscurePass.value;
                //                           },
                //                           child: _formController
                //                                   .isObscurePass.value
                //                               ? const Icon(
                //                                   FontAwesomeIcons.eye,
                //                                   size: 18.0,
                //                                 )
                //                               : const Icon(
                //                                   FontAwesomeIcons.eyeSlash,
                //                                   size: 18.0,
                //                                 )),
                //                       icon: FontAwesomeIcons.a,
                //                       keyboardType:
                //                           TextInputType.visiblePassword,
                //                       iconColor: AppColors.primaryText,
                //                       value: "",
                //                       onChanged: (String value) {},
                //                     );
                //                   }),
                //                   const SizedBox(height: 38.0),
                //                   !_formController.isKeyboardVisible.value
                //                       ? GestureDetector(
                //                           onTap: () {
                //                             _bottomNavBarController.loaderProvider(
                //                                 "card transaction");
                //                             Get.off(() => LoaderScreen());
                //                             // Get.off(LoaderScreen());
                //                             _formController
                //                                 .isBottomSheetShow(false);
                //                           },
                //                           child: Padding(
                //                             padding: EdgeInsets.only(
                //                                 bottom: Constants.screenHeight(
                //                                         context) /
                //                                     25),
                //                             // left: 22.0,
                //                             // right: 22.0),
                //                             child: AppButtonWidget(
                //                               label: _formController
                //                                       .isRechargeBottomSheet
                //                                       .value
                //                                   ? "Recharger"
                //                                   : "Retirer",
                //                             ),
                //                           ),
                //                         )
                //                       : const SizedBox(),
                //                 ],
                //               ),
                //             ),
                //           ),
                //         )
                //       : const SizedBox();
                // }),

                // //Card details bottomsheet
                // Obx(() {
                //   return _formController.isCardDetailsBottomSheetShow.value
                //       ? Align(
                //           alignment: Alignment.bottomCenter,
                //           child: IntrinsicHeight(
                //             child: Container(
                //               padding: const EdgeInsets.only(
                //                   top: 32.0, left: 20.0, right: 20.0),
                //               decoration: const BoxDecoration(
                //                   color: AppColors.white,
                //                   boxShadow: [
                //                     BoxShadow(
                //                       color: Color(0x33000000),
                //                       blurRadius: 24,
                //                       offset: Offset(0, -12),
                //                       spreadRadius: 0,
                //                     )
                //                   ],
                //                   borderRadius: BorderRadius.only(
                //                       topLeft: Radius.circular(26.0),
                //                       topRight: Radius.circular(26.0))),
                //               child: Column(
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 children: [
                //                   Row(
                //                     mainAxisAlignment: MainAxisAlignment.end,
                //                     children: [
                //                       GestureDetector(
                //                           onTap: () {
                //                             _formController
                //                                 .isCardDetailsBottomSheetShow(
                //                                     false);
                //                           },
                //                           child: const Icon(
                //                               FontAwesomeIcons.close)),
                //                     ],
                //                   ),
                //                   SizedBox(
                //                     width: 332,
                //                     child: Text(
                //                       'Afficher les details',
                //                       style: AppStyles.textStyle(
                //                         color: Color(0xFF0F0F0F),
                //                         size: 25,
                //                         weight: FontWeight.w500,
                //                       ),
                //                     ),
                //                   ),
                //                   InputLabel(
                //                     label: "Mot de passe",
                //                     paddingTop: 17.0,
                //                   ),
                //                   Obx(() {
                //                     return InputField(
                //                       labelText: "••••••••••••",
                //                       hasIcon: false,
                //                       isElevated: false,
                //                       hasShadow: false,
                //                       hasSuffix: true,
                //                       obscureText:
                //                           _formController.isObscurePass.value,
                //                       hasMaxLine: true,
                //                       maxLine: 1,
                //                       contentPadding: 14.0,
                //                       suffixIcon: GestureDetector(
                //                           onTap: () {
                //                             _formController
                //                                     .isObscurePass.value =
                //                                 !_formController
                //                                     .isObscurePass.value;
                //                           },
                //                           child: _formController
                //                                   .isObscurePass.value
                //                               ? const Icon(
                //                                   FontAwesomeIcons.eye,
                //                                   size: 18.0,
                //                                 )
                //                               : const Icon(
                //                                   FontAwesomeIcons.eyeSlash,
                //                                   size: 18.0,
                //                                 )),
                //                       icon: FontAwesomeIcons.a,
                //                       keyboardType:
                //                           TextInputType.visiblePassword,
                //                       iconColor: AppColors.primaryText,
                //                       value: "",
                //                       onChanged: (String value) {},
                //                     );
                //                   }),
                //                   const SizedBox(height: 38.0),
                //                   !_formController.isKeyboardVisible.value
                //                       ? GestureDetector(
                //                           onTap: () {
                //                             // _bottomNavBarController
                //                             //     .loaderProvider("open details");
                //                             // Get.off(() => LoaderScreen());
                //                             // Get.off(LoaderScreen());
                //                             _formController
                //                                 .isCardDetailsBottomSheetShow(
                //                                     false);
                //                             _bottomNavBarController
                //                                 .pageIndex.value = 7;
                //                             _bottomNavBarController
                //                                 .isCardDetailsActivated(true);
                //                           },
                //                           child: Padding(
                //                             padding: EdgeInsets.only(
                //                                 bottom: Constants.screenHeight(
                //                                         context) /
                //                                     25),
                //                             // left: 22.0,
                //                             // right: 22.0),
                //                             child: AppButtonWidget(
                //                               label: "Continuer",
                //                             ),
                //                           ),
                //                         )
                //                       : const SizedBox(),
                //                 ],
                //               ),
                //             ),
                //           ),
                //         )
                //       : const SizedBox();
                // }),
                // //Account recharge bottomsheet
                // Obx(() {
                //   return _formController
                //           .isAccountTransactionBottomSheetShow.value
                //       ? Align(
                //           alignment: Alignment.bottomCenter,
                //           child: IntrinsicHeight(
                //             child: GestureDetector(
                //               onTap: () {
                //                 FocusScope.of(context)
                //                     .requestFocus(FocusNode());
                //               },
                //               child: Container(
                //                 padding: const EdgeInsets.only(
                //                     top: 32.0, left: 20.0, right: 20.0),
                //                 decoration: const BoxDecoration(
                //                     color: AppColors.white,
                //                     boxShadow: [
                //                       BoxShadow(
                //                         color: Color(0x33000000),
                //                         blurRadius: 24,
                //                         offset: Offset(0, -12),
                //                         spreadRadius: 0,
                //                       )
                //                     ],
                //                     borderRadius: BorderRadius.only(
                //                         topLeft: Radius.circular(26.0),
                //                         topRight: Radius.circular(26.0))),
                //                 child: Column(
                //                   crossAxisAlignment: CrossAxisAlignment.start,
                //                   children: [
                //                     Row(
                //                       mainAxisAlignment: MainAxisAlignment.end,
                //                       children: [
                //                         GestureDetector(
                //                             onTap: () {
                //                               _formController
                //                                   .isAccountTransactionBottomSheetShow(
                //                                       false);
                //                               _transactionController
                //                                   .clearData();
                //                               _formController.resetFormErrors();
                //                             },
                //                             child: const Icon(
                //                                 FontAwesomeIcons.close)),
                //                       ],
                //                     ),
                //                     _formController.isRechargeBottomSheet.value
                //                         ? SizedBox(
                //                             child: Text.rich(
                //                               TextSpan(
                //                                 children: [
                //                                   TextSpan(
                //                                     text: 'Recharger avec les',
                //                                     style: AppStyles.textStyle(
                //                                       color: const Color(
                //                                           0xFF0F0F0F),
                //                                       size: 25,
                //                                       weight: FontWeight.w500,
                //                                       height: 0.9,
                //                                       // letterSpacing: -0.12,
                //                                     ),
                //                                   ),
                //                                   TextSpan(
                //                                     text: ' meilleurs taux',
                //                                     style: AppStyles.textStyle(
                //                                       color: AppColors.primary,
                //                                       size: 25,
                //                                       weight: FontWeight.w500,
                //                                       height: 0.9,
                //                                       // letterSpacing: -0.12,
                //                                     ),
                //                                   ),
                //                                   TextSpan(
                //                                     text: ' du dollars',
                //                                     style: AppStyles.textStyle(
                //                                       color: const Color(
                //                                           0xFF0F0F0F),
                //                                       size: 25,
                //                                       weight: FontWeight.w500,
                //                                       height: 0.9,
                //                                       // letterSpacing: -0.12,
                //                                     ),
                //                                   ),
                //                                 ],
                //                               ),
                //                             ),
                //                           )
                //                         : SizedBox(
                //                             child: Text.rich(
                //                               TextSpan(
                //                                 children: [
                //                                   TextSpan(
                //                                     text:
                //                                         'Retirer directement vers votre',
                //                                     style: AppStyles.textStyle(
                //                                       color: const Color(
                //                                           0xFF0F0F0F),
                //                                       size: 25,
                //                                       weight: FontWeight.w500,
                //                                       height: 0.9,
                //                                       // letterSpacing: -0.12,
                //                                     ),
                //                                   ),
                //                                   TextSpan(
                //                                     text: ' mobile money',
                //                                     style: AppStyles.textStyle(
                //                                       color: AppColors.primary,
                //                                       size: 25,
                //                                       weight: FontWeight.w500,
                //                                       height: 0.9,
                //                                       // letterSpacing: -0.12,
                //                                     ),
                //                                   ),
                //                                 ],
                //                               ),
                //                             ),
                //                           ),
                //                     const SizedBox(height: 8.0),
                //                     InputLabel(
                //                         label: "Montant à envoyer",
                //                         paddingTop: 10.0),
                //                     Padding(
                //                       padding: const EdgeInsets.only(top: 5.0),
                //                       child: InputField(
                //                         labelText: "5",
                //                         hasIcon: false,
                //                         isElevated: false,
                //                         hasShadow: false,
                //                         hasSuffix: true,
                //                         isNotRegularCaracter: true,
                //                         inputBg: AppColors.imputBg,
                //                         contentPadding: 16.0,
                //                         suffixIcon: IntrinsicHeight(
                //                           child: IntrinsicWidth(
                //                             child: Container(
                //                                 margin:
                //                                     const EdgeInsets.symmetric(
                //                                         vertical: 8.0),
                //                                 padding: const EdgeInsets.only(
                //                                     left: 5.0, right: 5.0),
                //                                 decoration: BoxDecoration(
                //                                     color: AppColors.primary,
                //                                     borderRadius:
                //                                         BorderRadius.circular(
                //                                             5.0)),
                //                                 child: Center(
                //                                   child: RichText(
                //                                     text: TextSpan(
                //                                       text: "\$",
                //                                       style: const TextStyle(
                //                                         color: Colors.white,
                //                                         fontSize: 16,
                //                                         fontFamily: 'Poppins',
                //                                         fontWeight:
                //                                             FontWeight.w700,
                //                                         height: 0.09,
                //                                         letterSpacing: -0.64,
                //                                       ),
                //                                       children: [
                //                                         TextSpan(
                //                                             text: " USD",
                //                                             style: AppStyles.textStyle(
                //                                                 color: AppColors
                //                                                     .white,
                //                                                 size: 16.0,
                //                                                 weight:
                //                                                     FontWeight
                //                                                         .w700))
                //                                       ],
                //                                     ),
                //                                   ),
                //                                 )),
                //                           ),
                //                         ),
                //                         icon: FontAwesomeIcons.a,
                //                         keyboardType: TextInputType.phone,
                //                         iconColor: AppColors.primaryText,
                //                         value:
                //                             _transactionController.amount.value,
                //                         onChanged: (String value) {
                //                           _transactionController.amount(value);
                //                           double amountinXAF = 0;
                //                           double transactionFees = 0;
                //                           if (_transactionController
                //                               .amount.isNotEmpty) {
                //                             amountinXAF = (double.parse(
                //                                     _transactionController
                //                                         .amount.value) *
                //                                 (_formController
                //                                         .isRechargeBottomSheet
                //                                         .value
                //                                     ? 667
                //                                     : 600));
                //                             transactionFees = (amountinXAF *
                //                                     (_formController
                //                                             .isRechargeBottomSheet
                //                                             .value
                //                                         ? 2
                //                                         : 3)) /
                //                                 100;
                //                           }
                //                           if (_formController
                //                               .isRechargeBottomSheet.value) {
                //                             _transactionController.amountToPay(
                //                                 (_transactionController
                //                                         .formatAmount(
                //                                             amountinXAF +
                //                                                 transactionFees))
                //                                     .toString());
                //                           } else {
                //                             _transactionController.amountToPay(
                //                                 (_transactionController
                //                                         .formatAmount(
                //                                             amountinXAF -
                //                                                 transactionFees))
                //                                     .toString());
                //                           }
                //                           if (_formController
                //                               .isRechargeBottomSheet.value) {
                //                             _formController.fieldVerification(
                //                               field: value,
                //                               isName: true,
                //                               errorCallback: (String error) =>
                //                                   _formController
                //                                       .hasErrorOnRechargeAmount(
                //                                           error),
                //                             );
                //                           } else {
                //                             _formController.fieldVerification(
                //                               field: value,
                //                               isAmount: true,
                //                               errorCallback: (String error) =>
                //                                   _formController
                //                                       .hasErrorOnRechargeAmount(
                //                                           error),
                //                             );
                //                           }
                //                         },
                //                       ),
                //                     ),
                //                     _formController.hasErrorOnRechargeAmount
                //                             .value.isNotEmpty
                //                         ? InputLabel(
                //                             label: _formController
                //                                 .hasErrorOnRechargeAmount.value,
                //                             paddingTop: 8.0,
                //                             color: AppColors.red,
                //                           )
                //                         : const SizedBox(),
                //                     Padding(
                //                       padding: const EdgeInsets.only(top: 5.0),
                //                       child: Row(
                //                         // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //                         children: [
                //                           Text.rich(
                //                             TextSpan(
                //                               children: [
                //                                 TextSpan(
                //                                   text: 'Taux du dollars:  ',
                //                                   style: AppStyles.textStyle(
                //                                       color: AppColors.primaryText,
                //                                       size: 12.0,
                //                                       weight: FontWeight.w700),
                //                                 ),
                //                                 TextSpan(
                //                                   text: '1',
                //                                   style: AppStyles.textStyle(
                //                                       color: AppColors.primary,
                //                                       size: 12.0,
                //                                       weight: FontWeight.w700),
                //                                 ),
                //                                 TextSpan(
                //                                   text: _formController
                //                                           .isRechargeBottomSheet
                //                                           .value
                //                                       ? '\$ = 667 Fcfa'
                //                                       : '\$ = 600 Fcfa',
                //                                   style: AppStyles
                //                                       .textPoppinsStyle(
                //                                     color:
                //                                         const Color(0xFF18BC7A),
                //                                     size: 12,
                //                                     weight: FontWeight.w700,
                //                                     // height: 0.17,
                //                                   ),
                //                                 ),
                //                               ],
                //                             ),
                //                           ),
                //                           const SizedBox(width: 7.0),
                //                           Text.rich(
                //                             TextSpan(
                //                               children: [
                //                                 TextSpan(
                //                                   text: _formController
                //                                           .isRechargeBottomSheet
                //                                           .value
                //                                       ? 'Frais de recharge :'
                //                                       : 'Frais de retrait :',
                //                                   style: AppStyles.textStyle(
                //                                       color: AppColors.primaryText,
                //                                       size: 12.0,
                //                                       weight: FontWeight.w700),
                //                                 ),
                //                                 TextSpan(
                //                                   text: _formController
                //                                           .isRechargeBottomSheet
                //                                           .value
                //                                       ? ' 2'
                //                                       : ' 3',
                //                                   style: AppStyles.textStyle(
                //                                     color: AppColors.primary,
                //                                     size: 12,
                //                                     weight: FontWeight.w700,
                //                                     // height: 0.17,
                //                                   ),
                //                                 ),
                //                                 TextSpan(
                //                                   text: '%',
                //                                   style: AppStyles
                //                                       .textPoppinsStyle(
                //                                           color:
                //                                               AppColors.primary,
                //                                           size: 12.0,
                //                                           weight:
                //                                               FontWeight.w700),
                //                                 ),
                //                               ],
                //                             ),
                //                           )
                //                         ],
                //                       ),
                //                     ),
                //                     Text.rich(
                //                       TextSpan(
                //                         children: [
                //                           TextSpan(
                //                             text: _formController
                //                                     .isRechargeBottomSheet.value
                //                                 ? 'Vous allez payer :'
                //                                 : "Vous allez recevoir : ",
                //                             style: AppStyles.textStyle(
                //                               color: Colors.black,
                //                               size: 12,
                //                               weight: FontWeight.w700,
                //                               // height: 0.17,
                //                             ),
                //                           ),
                //                           TextSpan(
                //                             text:
                //                                 ' ${_transactionController.amountToPay} Fcfa',
                //                             style: AppStyles.textPoppinsStyle(
                //                               color: AppColors.primary,
                //                               size: 11,
                //                               weight: FontWeight.w700,
                //                               // height: 0.17,
                //                             ),
                //                           ),
                //                         ],
                //                       ),
                //                     ),
                //                     InputLabel(
                //                       label: "Compte créditeur",
                //                       paddingTop: 39.0,
                //                     ),
                //                     Padding(
                //                       padding: const EdgeInsets.only(top: 5.0),
                //                       child: InputField(
                //                         labelText: "65******2",
                //                         hasIcon: false,
                //                         isElevated: false,
                //                         hasShadow: false,
                //                         hasSuffix: true,
                //                         isPhoneNumber: true,
                //                         maxLine: 1,
                //                         hasMaxLine: true,
                //                         isNotRegularCaracter: true,
                //                         inputBg: AppColors.imputBg,
                //                         // contentPadding: 16.0,
                //                         suffixIcon: IntrinsicWidth(
                //                           child: Row(
                //                             mainAxisAlignment:
                //                                 MainAxisAlignment.end,
                //                             children: [
                //                               Image.asset(
                //                                   Assets.icons.cmrFlag.path),
                //                               // const SizedBox(width: 6.0),
                //                               // Image.asset(
                //                               //     Assets.icons.orange.path),
                //                             ],
                //                           ),
                //                         ),
                //                         icon: FontAwesomeIcons.a,
                //                         keyboardType: TextInputType.number,
                //                         iconColor: AppColors.primaryText,
                //                         value:
                //                             _transactionController.phone.value,
                //                         onChanged: (String value) {
                //                           _transactionController.phone(value);
                //                           _formController.fieldVerification(
                //                             field: value,
                //                             isPhoneNumber: true,
                //                             errorCallback: (String error) =>
                //                                 _formController
                //                                     .hasErrorOnRechargePhone(
                //                                         error),
                //                           );
                //                         },
                //                       ),
                //                     ),
                //                     _formController.hasErrorOnRechargePhone
                //                             .value.isNotEmpty
                //                         ? InputLabel(
                //                             label: _formController
                //                                 .hasErrorOnRechargePhone.value,
                //                             paddingTop: 8.0,
                //                             color: AppColors.red,
                //                           )
                //                         : const SizedBox(),
                //                     !_formController.isRechargeBottomSheet.value
                //                         ? InputLabel(
                //                             label: "Mot de passe",
                //                             paddingTop: 17.0,
                //                           )
                //                         : const SizedBox(),
                //                     !_formController.isRechargeBottomSheet.value
                //                         ? Obx(() {
                //                             return InputField(
                //                               labelText: "••••••••••••",
                //                               hasIcon: false,
                //                               isElevated: false,
                //                               hasShadow: false,
                //                               hasSuffix: true,
                //                               isNotRegularCaracter: true,
                //                               obscureText: _formController
                //                                   .isObscurePass.value,
                //                               hasMaxLine: true,
                //                               maxLine: 1,
                //                               contentPadding: 14.0,
                //                               suffixIcon: GestureDetector(
                //                                   onTap: () {
                //                                     _formController
                //                                             .isObscurePass
                //                                             .value =
                //                                         !_formController
                //                                             .isObscurePass
                //                                             .value;
                //                                   },
                //                                   child: _formController
                //                                           .isObscurePass.value
                //                                       ? const Icon(
                //                                           FontAwesomeIcons.eye,
                //                                           size: 18.0,
                //                                         )
                //                                       : const Icon(
                //                                           FontAwesomeIcons
                //                                               .eyeSlash,
                //                                           size: 18.0,
                //                                         )),
                //                               icon: FontAwesomeIcons.a,
                //                               keyboardType:
                //                                   TextInputType.visiblePassword,
                //                               iconColor: AppColors.primaryText,
                //                               value: _transactionController
                //                                   .password.value,
                //                               onChanged: (String value) {
                //                                 _transactionController
                //                                     .password(value);
                //                                 _formController
                //                                     .fieldVerification(
                //                                   field: _transactionController
                //                                       .password.value,
                //                                   isSamePass: true,
                //                                   pass:
                //                                       localUser.password != null
                //                                           ? localUser.password!
                //                                           : "",
                //                                   errorCallback: (String
                //                                           error) =>
                //                                       _formController
                //                                           .hasErrorOnSamePassword(
                //                                               error),
                //                                 );
                //                               },
                //                             );
                //                           })
                //                         : const SizedBox(),
                //                     !_formController
                //                                 .isRechargeBottomSheet.value &&
                //                             _formController
                //                                 .hasErrorOnSamePassword
                //                                 .value
                //                                 .isNotEmpty
                //                         ? InputLabel(
                //                             label: _formController
                //                                 .hasErrorOnSamePassword.value,
                //                             paddingTop: 8.0,
                //                             color: AppColors.red,
                //                           )
                //                         : const SizedBox(),
                //                     const SizedBox(height: 38.0),
                //                     !_formController.isKeyboardVisible.value
                //                         ? GestureDetector(
                //                             onTap: () {
                //                               if (_formController
                //                                   .isRechargeBottomSheet
                //                                   .value) {
                //                                 _formController
                //                                     .fieldVerification(
                //                                   field: _transactionController
                //                                       .amount.value,
                //                                   isName: true,
                //                                   errorCallback: (String
                //                                           error) =>
                //                                       _formController
                //                                           .hasErrorOnRechargeAmount(
                //                                               error),
                //                                 );
                //                               } else {
                //                                 _formController
                //                                     .fieldVerification(
                //                                   field: _transactionController
                //                                       .amount.value,
                //                                   isAmount: true,
                //                                   errorCallback: (String
                //                                           error) =>
                //                                       _formController
                //                                           .hasErrorOnRechargeAmount(
                //                                               error),
                //                                 );
                //                               }
                //                               _formController.fieldVerification(
                //                                 field: _transactionController
                //                                     .phone.value,
                //                                 isPhoneNumber: true,
                //                                 errorCallback: (String error) =>
                //                                     _formController
                //                                         .hasErrorOnRechargePhone(
                //                                             error),
                //                               );
                //                               if (!_formController
                //                                   .isRechargeBottomSheet
                //                                   .value) {
                //                                 _formController
                //                                     .fieldVerification(
                //                                   field: _transactionController
                //                                       .password.value,
                //                                   isSamePass: true,
                //                                   pass:
                //                                       localUser.password != null
                //                                           ? localUser.password!
                //                                           : "",
                //                                   errorCallback: (String
                //                                           error) =>
                //                                       _formController
                //                                           .hasErrorOnSamePassword(
                //                                               error),
                //                                 );
                //                               }
                //                               if ((_formController
                //                                           .hasErrorOnRechargeAmount
                //                                           .value
                //                                           .isEmpty &&
                //                                       _formController
                //                                           .hasErrorOnRechargePhone
                //                                           .isEmpty &&
                //                                       _formController
                //                                           .hasErrorOnSamePassword
                //                                           .isEmpty) ||
                //                                   _formController
                //                                           .hasErrorOnRechargeAmount
                //                                           .value
                //                                           .isEmpty &&
                //                                       _formController
                //                                           .hasErrorOnRechargePhone
                //                                           .isEmpty &&
                //                                       _formController
                //                                           .isRechargeBottomSheet
                //                                           .value) {
                //                                 _bottomNavBarController
                //                                     .loaderProvider(
                //                                         "card transaction");
                //                                 Get.off(() => LoaderScreen());
                //                                 _formController
                //                                     .isBottomSheetShow(false);
                //                                 _formController
                //                                     .isAccountTransactionBottomSheetShow(
                //                                         false);
                //                                 // Get.off(LoaderScreen());
                //                               }
                //                             },
                //                             child: Padding(
                //                               padding: EdgeInsets.only(
                //                                   bottom:
                //                                       Constants.screenHeight(
                //                                               context) /
                //                                           35),
                //                               // left: 22.0,
                //                               // right: 22.0),
                //                               child: AppButtonWidget(
                //                                 label: _formController
                //                                         .isRechargeBottomSheet
                //                                         .value
                //                                     ? "Recharger"
                //                                     : "Retirer",
                //                               ),
                //                             ),
                //                           )
                //                         : const SizedBox(),
                //                   ],
                //                 ),
                //               ),
                //             ),
                //           ),
                //         )
                //       : const SizedBox();
                // }),
                AppBarComponent(),
                BottomNavBar(),
                // true
                // !((_transactionController.transactions != null &&
                //             _transactionController.transactions!.isNotEmpty) ||
                //         (_transactionController.soldTransactions != null &&
                //             _transactionController
                //                 .soldTransactions!.isNotEmpty) ||
                //         (_transactionController.transfertTransactions != null &&
                //             _transactionController
                //                 .transfertTransactions!.isNotEmpty))
                //
                // Obx(() { //TODO: Fix it if we want to add loader on the page
                //   return
                //       //  !((_transactionController.transactions != null &&
                //       //             _transactionController
                //       //                 .transactions!.isNotEmpty) ||
                //       //         (_transactionController.soldTransactions != null &&
                //       //             _transactionController
                //       //                 .soldTransactions!.isNotEmpty) ||
                //       //         (_transactionController.transfertTransactions !=
                //       //                 null &&
                //       //             _transactionController
                //       //                 .transfertTransactions!.isNotEmpty))
                //       //     ?
                //       _transactionController.isLoading.value
                //           ? Center(
                //               child: Container(
                //                 height: Constants.screenHeight(context),
                //                 width: Constants.screenWidth(context),
                //                 color: Colors.black.withOpacity(0.5),
                //                 child: LoadingAnimationWidget.inkDrop(
                //                   color: AppColors.primary,
                //                   size: 50,
                //                 ),
                //               ),
                //             )
                //           : SizedBox();
                // })
                // : _bottomNavBarController.pageIndex.value == 0
                //     ? Container(child: Center(child: Text(_bottomNavBarController.pageIndex.value.toString()),),)
                //     : _bottomNavBarController.pageIndex.value == 0
                //         ? Container(
                //             child: Center(
                //               child: Text(_bottomNavBarController.pageIndex.value
                //                   .toString()),
                //             ),
                //           )
                //         : _bottomNavBarController.pageIndex.value == 0
                //             ? Container(
                //                 child: Center(
                //                   child: Text(_bottomNavBarController
                //                       .pageIndex.value
                //                       .toString()),
                //                 ),
                //               )
                //             : _bottomNavBarController.pageIndex.value == 0
                //                 ? Container(
                //                     child: Center(
                //                       child: Text(_bottomNavBarController
                //                           .pageIndex.value
                //                           .toString()),
                //                     ),
                //                   )
                //                 : Container())),
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}

// class HorizontalTabViewElement extends StatelessWidget {
//   final String label;
//   final bool isSelected;
//   final bool hasMargin;
//   final Color color;
//   const HorizontalTabViewElement(
//       {super.key,
//       required this.label,
//       this.isSelected = false,
//       this.hasMargin = false,
//       this.color = AppColors.horizontalTabUnselectedColor});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 10.0),
//       margin: hasMargin ? const EdgeInsets.only(left: 10.0) : null,
//       decoration: BoxDecoration(
//           color: !isSelected ? color : AppColors.primaryText,
//           borderRadius: BorderRadius.circular(50.0)),
//       child: Text(
//         label,
//         style: AppStyles.textStyle(
//           color: !isSelected ? AppColors.primaryText : AppColors.white,
//           size: 12,
//           weight: FontWeight.w500,
//         ),
//       ),
//     );
//   }
// }

// class HistoryItem extends StatelessWidget {
//   final bool isRecharge;
//   const HistoryItem({super.key, required this.isRecharge});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         margin: const EdgeInsets.only(bottom: 25.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Row(
//               children: [
//                 Container(
//                   padding: const EdgeInsets.all(16.0),
//                   decoration: BoxDecoration(
//                       color: isRecharge ? AppColors.primaryText : AppColors.primary,
//                       border: isRecharge ? null : Border.all(),
//                       borderRadius: BorderRadius.circular(12.0)),
//                   child: SvgPicture.asset(
//                       isRecharge ? Assets.icons.recharge : Assets.icons.remove),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 19.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Recharge",
//                         style: AppStyles.textStyle(
//                           color: AppColors.primaryText,
//                           size: 16,
//                           weight: FontWeight.w500,
//                         ),
//                       ),
//                       Text(
//                         "Aujourd hui",
//                         style: AppStyles.textStyle(
//                           color: AppColors.primaryText,
//                           size: 12,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 Text.rich(
//                   TextSpan(
//                     children: [
//                       const TextSpan(
//                         text: '- \$',
//                         style: TextStyle(
//                           color: Color(0xFF1E1E1E),
//                           fontSize: 16,
//                           fontFamily: 'Poppins',
//                           fontWeight: FontWeight.w500,
//                           height: 0,
//                         ),
//                       ),
//                       TextSpan(
//                         text: '13.00',
//                         style: AppStyles.textStyle(
//                           color: AppColors.primaryText,
//                           size: 16,
//                           weight: FontWeight.w500,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Text(
//                   "Reussi",
//                   style: AppStyles.textStyle(
//                     color: AppColors.primary,
//                     size: 13,
//                   ),
//                 ),
//               ],
//             )
//           ],
//         ));
//   }
// }
