import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../controllers/onboard_controller.dart';
import '../../gen/assets.gen.dart';
import '../../ressources/app_colors.dart';
import '../../ressources/app_styles.dart';
import '../../ressources/constants.dart';
import '../login/login_screen.dart';
import '../register/register_screen.dart';
import '../../widgets/primary_button_widget.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/story_view.dart';

class OnBoardScreen extends StatelessWidget {
  OnBoardScreen({super.key});

  final OnBoardController _onBoardController = Get.put(OnBoardController());

  @override
  Widget build(context) {
    List<StoryItem> storyItems = [
      StoryItem.pageImage(
          imageFit: BoxFit.cover,
          url:
              "https://miro.medium.com/v2/resize:fit:720/format:webp/1*8BZkJ1D4QP2ddq9k8bBABA.jpeg",
          controller: _onBoardController.controller.value),
      StoryItem.pageImage(
          imageFit: BoxFit.cover,
          url:
              "https://miro.medium.com/v2/resize:fit:720/format:webp/1*8BZkJ1D4QP2ddq9k8bBABA.jpeg",
          controller: _onBoardController.controller.value),
      StoryItem.pageImage(
          imageFit: BoxFit.cover,
          url:
              "https://miro.medium.com/v2/resize:fit:720/format:webp/1*8BZkJ1D4QP2ddq9k8bBABA.jpeg",
          controller: _onBoardController.controller.value),
      StoryItem.pageImage(
          imageFit: BoxFit.cover,
          url:
              "https://miro.medium.com/v2/resize:fit:720/format:webp/1*8BZkJ1D4QP2ddq9k8bBABA.jpeg",
          controller: _onBoardController.controller.value),
    ];
    return Scaffold(
      body: Stack(
        children: [
          StoryView(
            storyItems: storyItems,
            controller:
                _onBoardController.controller.value, // pass controller here too
            // repeat: true, // should the stories be slid forever
            onStoryShow: (s) async {
              _onBoardController.controller.value.playbackNotifier.first
                  .then((playbackState) {
                if (playbackState == PlaybackState.pause) {
                  _onBoardController.pageIndex(0);
                } else {
                  if (playbackState != PlaybackState.next &&
                      playbackState != PlaybackState.previous) {
                    _onBoardController.increment();
                  }
                }
              });
            },
            onComplete: () {
              //TODO: implement this
            },
          ),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: Constants.screenHeight(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: 60.0, left: Constants.defaultHorizontalMargin),
                    child: Row(
                      children: [
                        Text(
                          "Welcome on Send Nkap",
                          textAlign: TextAlign.center,
                          style:
                              AppStyles.textStyle(color: AppColors.secondary),
                        ),
                      ],
                    ),
                  ),
                  Obx(() {
                    return SizedBox(
                      width: Constants.screenWidth(context) / 1.2,
                      child: Column(
                        children: [
                          Text(
                            _onBoardController.pageIndex.value == 1
                                ? "Welcome to the Future of Financial Transactions"
                                : _onBoardController.pageIndex.value == 2
                                    ? "Power and Control in Your Pocket"
                                    : _onBoardController.pageIndex.value == 3
                                        ? "Ready to Redefine Your Financial Experience?"
                                        : "Your Security, Our Utmost Priority",
                            textAlign: TextAlign.center,
                            style: AppStyles.textStyle(color: AppColors.white),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Text(
                              _onBoardController.pageIndex.value == 1
                                  ? "Explore a new era of simplicity and security with our app. Discover revolutionary features designed to make managing your money as easy as possible."
                                  : _onBoardController.pageIndex.value == 2
                                      ? "Experience a comprehensive set of financial management features. From instant payments to expense tracking tools, you're in control of your financial future."
                                      : _onBoardController.pageIndex.value == 3
                                          ? "It's time to take control. Sign up now and discover how our app revolutionizes the way you manage your money. A new financial era begins here."
                                          : "We have implemented advanced security measures to protect your financial information. From robust encryption to continuous monitoring, your peace of mind is our commitment.",
                              textAlign: TextAlign.center,
                              style:
                                  AppStyles.textStyle(color: AppColors.white),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                  Obx(() {
                    return Column(
                      children: [
                        PrimaryButtonWidget(
                          title: _onBoardController.pageIndex.value == 3
                              ? "Get Started"
                              : "Next",
                          butttonColor: AppColors.primary,
                          textColor: AppColors.white,
                          onTap: () {
                            if (_onBoardController.pageIndex.value == 3) {
                              Get.to(() => const RegisterScreen(),
                                  transition: Transition.cupertino,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.linear);
                            } else {
                              _onBoardController.controller.value.next();
                              _onBoardController.increment();
                            }
                          },
                        ),
                        _onBoardController.pageIndex.value != 3
                            ? Padding(
                                padding: const EdgeInsets.only(
                                    top: 20.0, bottom: 50.0),
                                child: Text(
                                  "Skip",
                                  textAlign: TextAlign.center,
                                  style: AppStyles.textStyle(
                                      color: AppColors.white),
                                ),
                              )
                            : Container(
                                padding: const EdgeInsets.only(
                                    top: 20.0, bottom: 71.0),
                              )
                      ],
                    );
                  }),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    _onBoardController.controller.value.previous();
                    _onBoardController.decrement();
                  },
                  child: SizedBox(
                    height: Constants.screenHeight(context),
                    width: Constants.screenWidth(context) / 2.5,
                  ),
                ),
                InkWell(
                  onTap: () {
                    _onBoardController.controller.value.next();
                    _onBoardController.increment();
                  },
                  child: SizedBox(
                    height: Constants.screenHeight(context),
                    width: Constants.screenWidth(context) / 2.5,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
