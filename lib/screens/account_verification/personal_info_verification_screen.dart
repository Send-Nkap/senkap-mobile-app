import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../controllers/account_verification_controller.dart';
import '../../ressources/app_colors.dart';
import '../../ressources/app_styles.dart';
import '../../ressources/constants.dart';
import '../../widgets/dropdown_widget.dart';
import '../../widgets/input_field_widget.dart';

class PersonalInfoVerificationScreen extends StatelessWidget {
  PersonalInfoVerificationScreen({super.key});

  List<String> genderList = ["Female", "Male"];
  final AccountVerificationController _countVerificationController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Personal informations",
                style: AppStyles.textStyle(
                  color: AppColors.primaryText,
                  size: 28.0,
                  weight: FontWeight.w700,
                  height: 0.9,
                ),
              ),
              Text(
                  "Help us make your identification. Write your informations as in ID.",
                  style: AppStyles.textStyle(
                    color: AppColors.primaryText,
                    size: 15.0,
                  )),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: InputField(
            labelText: "First name",
            hasIcon: false,
            isElevated: false,
            hasShadow: false,
            hasSuffix: false,
            hasEg: true,
            egText: "Daniel or Dan",
            contentPadding: 16.0,
            icon: Icons.abc,
            keyboardType: TextInputType.text,
            iconColor: AppColors.primaryText,
            value: "",
            onChanged: (String value) {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: InputField(
            labelText: "Last name",
            hasIcon: false,
            isElevated: false,
            hasShadow: false,
            hasSuffix: false,
            contentPadding: 16.0,
            icon: Icons.abc,
            keyboardType: TextInputType.text,
            iconColor: AppColors.primaryText,
            value: "",
            onChanged: (String value) {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: DropdownWidget(
            hasIcon: false,
            fieldLabel: "Gender",
            itemsList: genderList,
            onChanged: (String? value) {},
          ),
        ),
        GestureDetector(
            onTap: () async {
              final DateTime? picked = await showDatePicker(
                  fieldHintText: "Choissez une date",
                  locale: const Locale('fr'),
                  fieldLabelText: "Date",
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1920),
                  lastDate: DateTime.now());
              print(picked);
              if (picked != null &&
                  picked.toString() !=
                      _countVerificationController.birthday.value) {
                _countVerificationController
                    .birthday(DateFormat('yyyy-MM-dd').format(picked));
              }
            },
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 16.0),
              padding: const EdgeInsets.all(18.0),
              decoration: BoxDecoration(
                color: AppColors.imputBg,
                borderRadius:
                    BorderRadius.circular(Constants.defaultBorderRadius),
              ),
              child: Obx(() {
                return Text(
                  _countVerificationController.birthday.value.isEmpty
                      ? "Birthday date"
                      : _countVerificationController.birthday.value,
                  style: AppStyles.textStyle(
                      color: _countVerificationController.birthday.value.isEmpty
                          ? AppColors.secondaryText
                          : AppColors.primaryText,
                      size: 13.0),
                );
              }),
            )),
      ],
    );
  }
}
