import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../controllers/contact_controller.dart';
import '../../../controllers/tab_bar_controller.dart';
import '../../../controllers/transaction_controller.dart';
import '../../../gen/assets.gen.dart';
import '../../../ressources/app_colors.dart';
import '../../../ressources/app_styles.dart';
import '../../../ressources/constants.dart';
import '../../../ressources/data.dart';
import 'history_page.dart';

class Slide {
  Slide({
    required this.child,
    required this.height,
    required this.color,
  });

  final Color color;
  final double height;
  final Widget child;
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  // final BottomNavBarController _bottomNavBarController = Get.find();

  final TabBarController _tabController = Get.put(TabBarController());
  final TransactionController _transactionController =
      Get.put(TransactionController());
  final ContactController _contactController = Get.put(ContactController());
  final List<String> tabListItem = [
    "Balance",
    "Rewards",
    "Shared",
    // "Transferts",
  ];

  final List<Map<String, dynamic>> mainActionsList = [
    {"title": "Recharge", "icon": Assets.icons.recharge},
    {"title": "Withdraw", "icon": Assets.icons.remove},
  ];
  // final List<Map<String, dynamic>> userList = [
  //   {"name": "Emon", "color": Colors.pinkAccent},
  //   {"name": "Angeli", "color": Colors.blueAccent},
  //   {"name": "Mark", "color": AppColors.primary},
  // ];
  List<Widget> carousselElements = [
    Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Your Balance is",
          style: AppStyles.textStyle(
            color: AppColors.secondaryText,
            weight: FontWeight.w600,
            size: 16,
          ),
        ),
        Text(
          "200 000 XAF",
          style: AppStyles.textStyle(
            color: AppColors.primaryText,
            weight: FontWeight.w700,
            size: 37,
          ),
        ),
        Text(
          "Today 14 Sept 2022",
          style: AppStyles.textStyle(
            color: AppColors.secondaryText,
            weight: FontWeight.w600,
            size: 16,
          ),
        ),
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Your Referral Balance is",
          style: AppStyles.textStyle(
            color: AppColors.white,
            weight: FontWeight.w600,
            size: 16,
          ),
        ),
        Text(
          "200 000 XAF",
          style: AppStyles.textStyle(
            color: AppColors.white,
            weight: FontWeight.w700,
            size: 37,
          ),
        ),
        Text(
          "Congratulations!!",
          style: AppStyles.textStyle(
            color: AppColors.white,
            weight: FontWeight.w600,
            size: 16,
          ),
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var slides = List.generate(
      2,
      (index) => Slide(
        child: carousselElements[index],
        height: 50.0 + index * 50, //100 + index * 50
        color: index > 0
            ? AppColors.secondary
            // ? Colors.primaries[index % Colors.primaries.length]
            : AppColors.white,
      ),
    );
    final List<Widget> sliders = slides
        .map(
          (item) => ClipRRect(
            borderRadius: BorderRadius.all(
                Radius.circular(Constants.defaultBorderRadius)),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              color: item.color,
              width: double.infinity,
              height: item.height,
              child: item.child,
              
            ),
          ),
        )
        .toList();
    return GestureDetector(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Constants.defaultHorizontalMargin),
              child: FlutterCarousel(
                items: sliders,
                options: CarouselOptions(
                  // autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 10),
                  aspectRatio: 2.8,
                  viewportFraction: 0.8,
                  enlargeCenterPage: true,
                  slideIndicator: CircularWaveSlideIndicator(
                    indicatorBackgroundColor:
                        AppColors.secondaryOpc.withOpacity(0.5),
                    currentIndicatorColor: AppColors.primary,
                  ),
                  floatingIndicator: false,
                ),
                // ),
              ),
              ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: Constants.defaultTopverticalMargin / 2,
              horizontal: Constants.defaultHorizontalMargin,
            ),
            child: Stack(
              children: [
                Container(
                  // margin: EdgeInsets.symmetric(
                  //     vertical: Constants.defaultTopverticalMargin / 2),
                  decoration: BoxDecoration(
                      color: AppColors.secondary,
                      borderRadius: BorderRadius.circular(
                          Constants.defaultBorderRadius * 3)),
                  child: Padding(
                    padding:
                        EdgeInsets.all(Constants.defaultHorizontalMargin * 1.5),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Send Money",
                                style: AppStyles.textStyle(
                                  color: AppColors.white,
                                  weight: FontWeight.w600,
                                  size: 16,
                                ),
                              ),
                              SvgPicture.asset(
                                Assets.icons.plusCircle,
                                width: 22.0,
                                color: AppColors.white,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 50.0,
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              padding: EdgeInsets.zero,
                              itemCount: userList.length,
                              itemBuilder: ((context, index) {
                                return GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        left: index != 0 ? 10.0 : 0.0),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 12.0),
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      gradient: index == userList.length - 1
                                          ? const LinearGradient(
                                              begin: Alignment.centerRight,
                                              end: Alignment.centerLeft,
                                              stops: [0, 0.7],
                                              colors: [
                                                AppColors.secondary,
                                                AppColors.white,
                                              ],
                                            )
                                          : null,
                                      borderRadius: BorderRadius.circular(
                                        Constants.defaultBorderRadius * 5, //*5
                                      ),
                                    ),
                                    child: Row(children: [
                                      Container(
                                        padding: const EdgeInsets.all(10.0),
                                        decoration: BoxDecoration(
                                          color: userList[index]['color'],
                                          shape: BoxShape.circle,
                                        ),
                                        child: SvgPicture.asset(
                                          Assets.icons.user,
                                          color: AppColors.white,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10.0),
                                        child: Text(
                                          userList[index]["name"],
                                          style: AppStyles.textStyle(
                                            color: AppColors.primaryText,
                                            weight: FontWeight.w600,
                                            size: 15.0,
                                          ),
                                        ),
                                      )
                                    ]),
                                  ),
                                );
                              })),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 47,
                  left: -7.5,
                  child: Container(
                    height: 50.0,
                    width: 15.0,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius:
                          BorderRadius.circular(Constants.defaultBorderRadius),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Material(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Constants.defaultBorderRadius * 3),
                topRight: Radius.circular(Constants.defaultBorderRadius * 3),
              ),
              elevation: 10.0,
              color: AppColors.white,
              child: Padding(
                padding: EdgeInsets.only(
                  top: Constants.defaultHorizontalMargin,
                  right: Constants.defaultHorizontalMargin,
                  left: Constants.defaultHorizontalMargin,
                ),
                child: HistoryPage(isSeeMoreVisibles: true),
              )),
        ],
      ),
    );
  }
}
