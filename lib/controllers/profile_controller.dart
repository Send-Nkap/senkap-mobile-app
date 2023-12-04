import 'package:get/get.dart';

class ProfileController extends GetxController {
  RxBool isLogOutBottomSheetShow = false.obs;
  RxBool isLanguageBottomSheetShow = false.obs;
  RxBool isDarkModelActivated = false.obs;
  RxBool isBiometricActivated = false.obs;
  RxString selectedLanguage = "Anglais".obs;
}
