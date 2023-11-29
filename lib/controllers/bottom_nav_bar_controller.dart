import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'transaction_controller.dart';

class BottomNavBarController extends GetxController {
  RxInt pageIndex = 0.obs;
  RxBool isKeyboardVisible = false.obs;
  RxBool isBalanceVisible = true.obs;
  RxBool isBottomNavBarTransparent = false.obs;
  RxBool isAppBarElevated = false.obs;


  RxBool isOnTranfertMoneyScreen = false.obs;

  RxString loaderProvider = "".obs;

  RxInt selectedHistoryFilter = 0.obs;

  ScrollController scrollController = ScrollController();
  final TransactionController _transactionController = Get.put(TransactionController());

  void setPageIndex(int index) {
    pageIndex(index);
    scrollController.jumpTo(0);
    _transactionController.selectedTransaction(-1);
    print(pageIndex);
  }

  @override
  void onInit() {
    pageIndex(0);
    loaderProvider("");
    super.onInit();
  }
}
