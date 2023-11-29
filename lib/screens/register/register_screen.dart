import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../gen/assets.gen.dart';
import '../../ressources/app_colors.dart';
import '../../ressources/app_styles.dart';
import '../../ressources/constants.dart';
import '../account_verification/account_verification_stepper_screen.dart';
import '../login/login_screen.dart';
import '../../widgets/input_field_widget.dart';
import '../../widgets/primary_button_widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
                    "Let's get started!",
                    style: AppStyles.textStyle(
                      color: AppColors.primaryText,
                      size: 32.0,
                      weight: FontWeight.w700,
                      height: 0.9,
                    ),
                  ),
                  Text(
                      "Enter your phone number. We will send you a confirmation code there",
                      style: AppStyles.textStyle(
                        color: AppColors.primaryText,
                        size: 15.0,
                      )),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: Constants.screenHeight(context) / 20),
                    child: InputField(
                      labelText: "",
                      hasIcon: false,
                      isElevated: false,
                      hasShadow: false,
                      hasSuffix: true,
                      isPhoneNumber: true,
                      contentPadding: 16.0,
                      suffixIcon: Image.asset(Assets.icons.cmrFlag.path),
                      icon: Icons.abc,
                      keyboardType: TextInputType.number,
                      iconColor: AppColors.primaryText,
                      value: "",
                      onChanged: (String value) {},
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.offAll(() => const LoginScreen(),
                          transition: Transition.cupertino,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.linear);
                    },
                    child: Row(
                      children: [
                        Text(
                          "Do you have an account?",
                          style: AppStyles.textStyle(
                            color: AppColors.primaryText,
                            size: 16.0,
                          ),
                        ),
                        Text(
                          " Login",
                          style: AppStyles.textStyle(
                            color: AppColors.primary,
                            isUnderlined: true,
                            size: 16.0,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: Constants.screenHeight(context) / 20),
                child: PrimaryButtonWidget(
                  title: "Register",
                  butttonColor: AppColors.primary,
                  textColor: AppColors.white,
                  onTap: () {
                    Get.to(() => AccountVerificationStepperScreen(),
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
