import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app_styles.dart';

class Commons {
  static void snackBar(
      {required Color bgColor,
      required Color textColor,
      bool hasSpecialCharacters = false,
      required String description}) {
    Get.rawSnackbar(
        backgroundColor: bgColor,
        borderRadius: 10.0,
        // colorText: AppColors.white,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.only(bottom: 40.0, left: 22.0, right: 22.0),
        messageText: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Center(
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: AppStyles.textStyle(
                color: textColor,
                size: 12,
              ),
            ),
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10.0));
  }

  static String formatAmount(String brutAmount) {
    // amount = double.parse(amount.toStringAsFixed(2));

    // String formattedAmount = brutAmount.toStringAsFixed(0);

    final separator = ' ';
    final List<String> parts = brutAmount.split('.');
    parts[0] = parts[0].replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match match) => '${match[1]}$separator',
    );
    brutAmount = parts.join('.');

    brutAmount = brutAmount;

    return brutAmount;
  }

  static String formatPhoneNumber(String phoneNumber) {
    // Remove all non-numeric characters from the phone number
    String cleanedPhoneNumber = phoneNumber.replaceAll(RegExp(r'\D'), '');
    // print(cleanedPhoneNumber);
    // Check the length of the number and format accordingly
    if (cleanedPhoneNumber.length == 9) {
      // If the length is 9 digits, add the country code and format
      return '+ (237) $cleanedPhoneNumber';
    } else if (cleanedPhoneNumber.length == 8 &&
        cleanedPhoneNumber.startsWith('9')) {
      // If the length is 8 digits and starts with "9", add the country code and format
      return '+ (237) $cleanedPhoneNumber';
    } else if (cleanedPhoneNumber.length == 12 &&
        cleanedPhoneNumber.startsWith('237')) {
      // If the length is 12 digits and starts with "237", format the number
      return '+ (237) ${cleanedPhoneNumber.substring(3)}';
    } else if (cleanedPhoneNumber.length == 9 &&
        cleanedPhoneNumber.startsWith('237')) {
      // If the length is 9 digits and starts with "237", format the number
      return '+ (237) $cleanedPhoneNumber';
    } else if (cleanedPhoneNumber.length == 11 &&
        cleanedPhoneNumber.startsWith('237')) {
      // If the length is 11 digits and starts with "237", format the number
      cleanedPhoneNumber = cleanedPhoneNumber.replaceAll(RegExp(r'237'), '6');
      return '+ (237) $cleanedPhoneNumber';
    } else if (cleanedPhoneNumber.length == 11 &&
        cleanedPhoneNumber.startsWith('6')) {
      // If the length is 11 digits and starts with "6", add the country code and format
      return '+ (237) $cleanedPhoneNumber';
    } else {
      // If the number doesn't match any expected format, return null or an error indication
      return 'Invalid phone number format';
    }
  }
}
