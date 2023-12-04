import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class AccountVerificationController extends GetxController {
  RxInt pageVerificationIndex = 0.obs;
  RxString birthday = "".obs;
  RxString selectedDocument = "".obs;

  void increment() {
    if (pageVerificationIndex < 5) {
      pageVerificationIndex++;
    }
    if (kDebugMode) {
      print(pageVerificationIndex);
    }
  }

  void decrement() {
    if (pageVerificationIndex > 0) {
      print("pageVerificationIndex");
      pageVerificationIndex--;
    }
    if (kDebugMode) {
      print(pageVerificationIndex);
    }
  }

  @override
  void onInit() {
    super.onInit();
    pageVerificationIndex = 0.obs;
  }
}
