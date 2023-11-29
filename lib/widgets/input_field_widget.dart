import 'package:flutter/material.dart';
import '../ressources/app_colors.dart';
import '../ressources/app_styles.dart';
import '../ressources/constants.dart';

class InputField extends StatelessWidget {
  InputField({
    required this.labelText,
    required this.icon,
    this.obscureText,
    required this.keyboardType,
    required this.value,
    this.suffixIcon,
    this.hasSuffix = false,
    this.hasIcon = true,
    required this.iconColor,
    this.hasMaxLine = false,
    this.hasShadow = true,
    this.isElevated = true,
    this.hasBorder = false,
    this.hasErrorOnField = false,
    this.isPhoneNumber = false,
    this.isDoubleOnLine = false,
    this.isNotRegularCaracter = false,
    this.hasEg = false,
    this.hasMarginRight = true,
    this.inputBg = AppColors.imputBg,
    this.textColor = AppColors.primaryText,
    this.maxLine = 7,
    this.contentPadding = 18.0,
    this.egText = "",
    required this.onChanged,
  }) : super();

  final String labelText;
  final IconData? icon;
  final bool? obscureText;
  final bool hasSuffix;
  final bool hasIcon;
  final bool isNotRegularCaracter;
  final bool isPhoneNumber;
  final bool hasEg;
  final bool hasMarginRight;
  final Color iconColor;
  final bool hasMaxLine;
  final bool hasShadow;
  final bool hasBorder;
  final bool isElevated;
  final bool hasErrorOnField;
  final Color inputBg;
  final Color textColor;
  final void Function(String) onChanged;
  final bool isDoubleOnLine;
  TextInputType keyboardType;
  Widget? suffixIcon;
  String value;
  String egText;
  int maxLine;
  double contentPadding;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: isDoubleOnLine ? Constants.screenWidth(context) / 2.6 : null,
          child: Material(
            elevation: isElevated ? 15.0 : 0.0,
            shadowColor: hasShadow ? Colors.grey[300] : null,
            shape: hasBorder
                ? RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    side: BorderSide(
                        color: hasErrorOnField
                            ? AppColors.primary
                            : AppColors.secondary,
                        width: 1),
                  )
                : null,
            borderRadius: !hasBorder ? BorderRadius.circular(8.0) : null,
            color: inputBg,
            child: Padding(
              padding: EdgeInsets.only(
                  right: hasMarginRight ? 20.0 : 0.0, left: 15.0),
              child: Row(
                children: [
                  isPhoneNumber
                      ? Material(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(
                                  Constants.defaultBorderRadius),
                              bottomLeft: Radius.circular(
                                  Constants.defaultBorderRadius)),
                          color: inputBg,
                          child: Padding(
                            padding: const EdgeInsets.all(11.5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  child: Text(
                                    "237",
                                    style: AppStyles.textStyle(
                                        color: AppColors.secondaryText,
                                        weight: FontWeight.w700,
                                        size: 12.0),
                                  ),
                                ),
                                const SizedBox(width: 2.0),
                                // Container(
                                //   width: 1.0,
                                //   color: AppColors.secondaryText,
                                // )
                                // const Icon(
                                //   FontAwesomeIcons.chevronDown,
                                //   size: 12.0,
                                //   color: AppColors.chatFieldHint,
                                // )
                              ],
                            ),
                          ),
                        )
                      : const SizedBox(),
                  Expanded(
                    child: TextFormField(
                      // focusNode:  _focusNode,
                      cursorColor: AppColors.primary,
                      initialValue: value,
                      style: AppStyles.textStyle(
                        color: textColor,
                        size: 13,
                        weight: FontWeight.w400,
                        height: null,
                      ),
                      onChanged: onChanged,
                      obscureText: obscureText ?? false,
                      autofocus: false,
                      maxLines: hasMaxLine ? maxLine : null,
                      keyboardType: keyboardType,
                      decoration: InputDecoration(
                        suffixIcon: hasSuffix ? suffixIcon : null,
                        contentPadding: hasMaxLine
                            ? EdgeInsets.only(
                                bottom: hasSuffix ? contentPadding : 30.0,
                                top: 19.0)
                            : EdgeInsets.symmetric(vertical: contentPadding),
                        icon: hasIcon
                            ? Icon(
                                icon,
                                color: iconColor,
                                size: 16.67,
                              )
                            : null,
                        hintText: labelText,
                        hintStyle: AppStyles.textStyle(
                          color: AppColors.secondaryText,
                          size: 12,
                        ),
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        hasEg
            ? Text("eg $egText",
                style: AppStyles.textStyle(
                  color: AppColors.secondaryText,
                  size: 13.0,
                ))
            : SizedBox()
      ],
    );
  }
}
