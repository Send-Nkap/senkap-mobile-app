import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../controllers/account_verification_controller.dart';
import '../../gen/assets.gen.dart';
import '../../ressources/app_colors.dart';
import '../../ressources/app_styles.dart';
import '../../ressources/constants.dart';
import '../../widgets/dropdown_widget.dart';
import '../../widgets/input_field_widget.dart';

class IdentityVerificationScreen extends StatelessWidget {
  IdentityVerificationScreen({super.key});

  List<String> documentsList = [
    "Notional ID",
    "Driver License",
    "Passport",
    "School ID",
  ];
  final AccountVerificationController _countVerificationController = Get.find();

  @override
  Widget build(BuildContext context) {
    List<Widget> chooseDocument = [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: DropdownWidget(
          hasIcon: false,
          fieldLabel: "Document",
          itemsList: documentsList,
          onChanged: (String? value) {
            _countVerificationController.selectedDocument(value);
          },
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: InputField(
          labelText: "Document number",
          hasIcon: false,
          isElevated: false,
          hasShadow: false,
          hasSuffix: false,
          contentPadding: 16.0,
          icon: Icons.abc,
          keyboardType: TextInputType.text,
          iconColor: AppColors.primaryText,
          value: "",
          onChanged: (String value) {
            // TODO: Faire une veriication sur le format de numero de chaque type de document
          },
        ),
      ),
    ];

    List<Widget> documentPicturesWidget = [
      Text(
          "Take the front side of your ${_countVerificationController.selectedDocument}",
          style: AppStyles.textStyle(
            color: AppColors.primaryText,
            size: 15.0,
          )),
      Container(
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.only(top: 10.0),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.imputBg),
          color: AppColors.imputBg.withOpacity(0.2),
        ),
        child: SvgPicture.asset(
          Assets.images.rectoDoc,
          width: Constants.screenWidth(context) / 1.5,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Text(
            "Take the back side of your ${_countVerificationController.selectedDocument}",
            style: AppStyles.textStyle(
              color: AppColors.primaryText,
              size: 15.0,
            )),
      ),
      Container(
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.only(top: 10.0),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.imputBg),
          color: AppColors.imputBg.withOpacity(0.2),
        ),
        child: SvgPicture.asset(
          Assets.images.versoDoc,
          width: Constants.screenWidth(context) / 1.5,
        ),
      )
    ];

    List<Widget> selfiePicturesWidget = [
      Text(
          "Take a selfie with your ${_countVerificationController.selectedDocument}",
          style: AppStyles.textStyle(
            color: AppColors.primaryText,
            size: 15.0,
          )),
      Container(
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.only(top: 10.0),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.imputBg),
          color: AppColors.imputBg.withOpacity(0.2),
        ),
        child: SvgPicture.asset(
          Assets.images.selfieWoman,
          width: Constants.screenWidth(context) / 1.5,
        ),
      ),
    ];
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Identity check",
                style: AppStyles.textStyle(
                  color: AppColors.primaryText,
                  size: 28.0,
                  weight: FontWeight.w700,
                  height: 0.9,
                ),
              ),
              Text(
                  "We need to ckeck all the provided information with a documents. Select and verify one of above.",
                  style: AppStyles.textStyle(
                    color: AppColors.primaryText,
                    size: 15.0,
                  )),
            ],
          ),
        ),
        Column(
          children: _countVerificationController.pageVerificationIndex.value ==
                  2
              ? chooseDocument
              : _countVerificationController.pageVerificationIndex.value == 3
                  ? documentPicturesWidget
                  : selfiePicturesWidget,
        )
      ],
    );
  }
}
