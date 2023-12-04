import 'package:get/get.dart';

class TransactionController extends GetxController {
  RxBool isLastTransactionDetailsActivated = false.obs;
  RxInt selectedTransaction = (-1).obs;

  // RxBool isContactAcessGranted = false.obs;
  // List<Contact> contacts = (List<Contact>.of([])).obs;

  // TODO: review if it is necessary to create a controller for transfers
  RxString amount = "0".obs;

  void updateAmount(String newValue) {
    if (amount.value == "0") {
      amount(newValue);
      return;
    }
    if (amount.value.length < 7) {
      amount(amount + newValue);
    }
  }

  void clearAmount() {
    amount("0");
  }

  void deleteAmount() {
    if (amount.value.length > 1) {
      amount(amount.value.substring(0, amount.value.length - 1));
    } else {
      clearAmount();
    }
  }

  @override
  void onInit() {
    clearAmount();
    super.onInit();
  }

  @override
  void onClose() {
    clearAmount();
    super.onClose();
  }
}
