import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../controllers/account_verification_controller.dart';
import '../../ressources/app_colors.dart';
import '../../ressources/app_styles.dart';
import '../../widgets/dropdown_widget.dart';
import '../../widgets/input_field_widget.dart';

class AddressVerificationScreen extends StatelessWidget {
  AddressVerificationScreen({super.key});

  List<String> addressList = [
    "Female",
    "Male",
    "Male",
    "Male",
    "Male",
    "Male",
  ];
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
                "Home Address",
                style: AppStyles.textStyle(
                  color: AppColors.primaryText,
                  size: 28.0,
                  weight: FontWeight.w700,
                  height: 0.9,
                ),
              ),
              Text("Help us know where you live. Write your address.",
                  style: AppStyles.textStyle(
                    color: AppColors.primaryText,
                    size: 15.0,
                  )),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: DropdownWidget(
            hasIcon: false,
            fieldLabel: "Region",
            itemsList: addressList,
            onChanged: (String? value) {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: InputField(
            labelText: "City",
            hasIcon: false,
            isElevated: false,
            hasShadow: false,
            hasSuffix: false,
            hasEg: true,
            egText: "Douala or Bafoussam",
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
            labelText: "Quater",
            hasIcon: false,
            isElevated: false,
            hasShadow: false,
            hasSuffix: false,
            hasEg: true,
            egText: "Kotto or Mvan",
            contentPadding: 16.0,
            icon: Icons.abc,
            keyboardType: TextInputType.text,
            iconColor: AppColors.primaryText,
            value: "",
            onChanged: (String value) {},
          ),
        ),
      ],
    );
  }
}
