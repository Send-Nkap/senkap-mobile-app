import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:send_nkap/controllers/faq_controller.dart';
import 'package:send_nkap/ressources/app_colors.dart';
import 'package:send_nkap/ressources/constants.dart';
import 'package:send_nkap/screens/faq/components/question_component.dart';

class FAQScreen extends StatelessWidget {
  FAQScreen({super.key});
  final List faqList = [
    {
      "question": "C’est quoi une carte Virtuelle ?",
      "response":
          "Lorem ipsum dolor sit amet consectetur. Auctor risus morbi morbi at neque leo turpis. Consectetur lectus pretium lorem tristique ornare. Condimentum a ac amet egestas suspendisse quisque nisl. Amet pellentesque venenatis vulputate facilisi id facilisis sit fringilla.",
    },
    {
      "question": "Comment recharger ma carte",
      "response":
          "Lorem ipsum dolor sit amet consectetur. Auctor risus morbi morbi at neque leo turpis. Consectetur lectus pretium lorem tristique ornare. Condimentum a ac amet egestas suspendisse quisque nisl. Amet pellentesque venenatis vulputate facilisi id facilisis sit fringilla.",
    },
    {
      "question": "Dans quels pays est ce que la carte est dipsonible ?",
      "response":
          "Lorem ipsum dolor sit amet consectetur. Auctor risus morbi morbi at neque leo turpis. Consectetur lectus pretium lorem tristique ornare. Condimentum a ac amet egestas suspendisse quisque nisl. Amet pellentesque venenatis vulputate facilisi id facilisis sit fringilla.",
    },
    {
      "question": "C’est quoi une carte Virtuelle ?",
      "response":
          "Lorem ipsum dolor sit amet consectetur. Auctor risus morbi morbi at neque leo turpis. Consectetur lectus pretium lorem tristique ornare. Condimentum a ac amet egestas suspendisse quisque nisl. Amet pellentesque venenatis vulputate facilisi id facilisis sit fringilla.",
    },
    {
      "question": "Comment recharger ma carte",
      "response":
          "Lorem ipsum dolor sit amet consectetur. Auctor risus morbi morbi at neque leo turpis. Consectetur lectus pretium lorem tristique ornare. Condimentum a ac amet egestas suspendisse quisque nisl. Amet pellentesque venenatis vulputate facilisi id facilisis sit fringilla.",
    },
    {
      "question": "Dans quels pays est ce que la carte est dipsonible ?",
      "response":
          "Lorem ipsum dolor sit amet consectetur. Auctor risus morbi morbi at neque leo turpis. Consectetur lectus pretium lorem tristique ornare. Condimentum a ac amet egestas suspendisse quisque nisl. Amet pellentesque venenatis vulputate facilisi id facilisis sit fringilla.",
    },
    {
      "question": "C’est quoi une carte Virtuelle ?",
      "response":
          "Lorem ipsum dolor sit amet consectetur. Auctor risus morbi morbi at neque leo turpis. Consectetur lectus pretium lorem tristique ornare. Condimentum a ac amet egestas suspendisse quisque nisl. Amet pellentesque venenatis vulputate facilisi id facilisis sit fringilla.",
    },
    {
      "question": "Comment recharger ma carte",
      "response":
          "Lorem ipsum dolor sit amet consectetur. Auctor risus morbi morbi at neque leo turpis. Consectetur lectus pretium lorem tristique ornare. Condimentum a ac amet egestas suspendisse quisque nisl. Amet pellentesque venenatis vulputate facilisi id facilisis sit fringilla.",
    },
    {
      "question": "Dans quels pays est ce que la carte est dipsonible ?",
      "response":
          "Lorem ipsum dolor sit amet consectetur. Auctor risus morbi morbi at neque leo turpis. Consectetur lectus pretium lorem tristique ornare. Condimentum a ac amet egestas suspendisse quisque nisl. Amet pellentesque venenatis vulputate facilisi id facilisis sit fringilla.",
    },
  ];
  FAQController _faqController = Get.put(FAQController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.imputBg,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Constants.defaultHorizontalMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(
                    FontAwesomeIcons.arrowLeft,
                    color: AppColors.primaryText,
                    // size: 25.0,
                  ),
                ),
              ),
              ListView.builder(
                  itemCount: faqList.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Obx(() {
                      return GestureDetector(
                        onTap: () {
                          if (_faqController.selectedQuestion.value == index) {
                            _faqController.selectedQuestion.value = -1;
                          } else {
                            _faqController.selectedQuestion.value = index;
                          }
                        },
                        child: QuestionComponent(
                          question: faqList[index]["question"],
                          response: faqList[index]["response"],
                          isResponseVisible:
                              _faqController.selectedQuestion.value == index,
                        ),
                      );
                    });
                  })
            ],
          ),
        ),
      ),
    );
  }
}
