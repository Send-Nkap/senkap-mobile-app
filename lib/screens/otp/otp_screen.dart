import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import '../../gen/assets.gen.dart';
import '../../ressources/app_colors.dart';
import '../../ressources/app_styles.dart';
import '../../ressources/commons.dart';
import '../../ressources/constants.dart';
import '../main/main_screen.dart';
import '../register/register_screen.dart';
import '../../widgets/input_field_widget.dart';
import '../../widgets/primary_button_widget.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Constants.defaultHorizontalMargin,
                  vertical: Constants.defaultTopverticalMargin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "One time code",
                    style: AppStyles.textStyle(
                      color: AppColors.primaryText,
                      size: 32.0,
                      weight: FontWeight.w700,
                      height: 0.9,
                    ),
                  ),
                  Text(
                      "Check your inbox for a unique code. Enter it below to access your account securely.",
                      // "A code has been sent to your e-mail address, enter it to check yourself",
                      style: AppStyles.textStyle(
                        color: AppColors.primaryText,
                        size: 15.0,
                      )),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: Constants.screenHeight(context) / 20),
                    child: OTPTextField(
                      otpFieldStyle: OtpFieldStyle(
                          disabledBorderColor: AppColors.imputBg,
                          focusBorderColor: AppColors.imputBg,
                          enabledBorderColor: AppColors.imputBg,
                          borderColor: AppColors.imputBg,
                          backgroundColor: AppColors.imputBg),
                      outlineBorderRadius: Constants.defaultBorderRadius,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 18.0, horizontal: 0.0),
                      length: 6,
                      width: Constants.screenWidth(context),
                      fieldWidth: Constants.screenWidth(context) / 7,
                      style: AppStyles.textStyle(
                        color: AppColors.secondary,
                        size: 19.0,
                      ),
                      textFieldAlignment: MainAxisAlignment.spaceBetween,
                      fieldStyle: FieldStyle.box,
                      onChanged: (String value) {},
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "You could ask a new code in 20s",
                        style: AppStyles.textStyle(
                          color: AppColors.primaryText,
                          size: 16.0,
                        ),
                      ),
                      Text(
                        "Resend a code",
                        style: AppStyles.textStyle(
                          color: AppColors.primary,
                          size: 16.0,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: Constants.screenHeight(context) / 20),
                child: PrimaryButtonWidget(
                  title: "Login",
                  butttonColor: AppColors.primary,
                  textColor: AppColors.white,
                  onTap: () {
                    // Commons.snackBar(
                    //   bgColor: AppColors.success,
                    //   textColor: AppColors.white,
                    //   description: "You are logged in",
                    // );
                    Get.to(() => MainScreen(),
                        transition: Transition.cupertino,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.linear);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
