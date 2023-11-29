import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:story_view/controller/story_controller.dart';

class OnBoardController extends GetxController {
  RxInt pageIndex = 0.obs;
  final Rx<StoryController> controller = StoryController().obs;

  void increment() {
    if (pageIndex < 3) {
      pageIndex++;
    }
    if (kDebugMode) {
      print(pageIndex);
    }
  }

  void decrement() {
    if (pageIndex > 0) {
      print("pageIndex");
      pageIndex--;
    }
    if (kDebugMode) {
      print(pageIndex);
    }
  }

  @override
  void onInit() {
    super.onInit();
    controller.value.playbackNotifier.value = PlaybackState.pause;
    pageIndex = 0.obs;
  }
}
