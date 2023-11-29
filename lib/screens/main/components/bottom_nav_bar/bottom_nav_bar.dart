import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../../controllers/bottom_nav_bar_controller.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../ressources/app_colors.dart';
import 'components/bottom_nav_item.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});
  final BottomNavBarController _bottomNavBarController =
      Get.put(BottomNavBarController());

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 0.0), //30.0
        child: Obx(() {
          return Material(
            elevation: _bottomNavBarController.isBottomNavBarTransparent.value
                ? 0.0
                : 10.0,
            color: _bottomNavBarController.isBottomNavBarTransparent.value
                ? AppColors.secondaryText.withOpacity(0.5)
                : null,
            // borderRadius: BorderRadius.circular(30.0),
            child: Container(
              // margin: const EdgeInsets.only(bottom: 55.0),
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(30.0)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    onTap: () async {
                      _bottomNavBarController.setPageIndex(0);
                    },
                    child: Obx(() {
                      return BottomNavItem(
                        title: "Accueil",
                        icon: Assets.icons.home,
                        isActive: _bottomNavBarController.pageIndex.value == 0,
                      );
                    }),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    onTap: () async {
                      _bottomNavBarController.setPageIndex(1);
                    },
                    child: Obx(() {
                      return BottomNavItem(
                        title: "Analytics",
                        icon: Assets.icons.chart,
                        isActive: _bottomNavBarController.pageIndex.value == 1,
                      );
                    }),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    onTap: () {
                      _bottomNavBarController.setPageIndex(2);
                    },
                    child: Obx(() {
                      return BottomNavItem(
                        title: "Transfer",
                        icon: Assets.icons.transfert,
                        isActive: _bottomNavBarController.pageIndex.value == 2,
                      );
                    }),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    onTap: () {
                      _bottomNavBarController.setPageIndex(3);
                    },
                    child: Obx(() {
                      return BottomNavItem(
                        title: "History",
                        icon: Assets.icons.wallet,
                        isActive: _bottomNavBarController.pageIndex.value == 3,
                      );
                    }),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    onTap: () async {
                      _bottomNavBarController.setPageIndex(4);
                    },
                    child: Obx(() {
                      return BottomNavItem(
                        title: "Parametres",
                        icon: Assets.icons.cog,
                        isActive: _bottomNavBarController.pageIndex.value == 4,
                      );
                    }),
                  ),
                  // InkWell(
                  //   splashColor: Colors.transparent,
                  //   focusColor: Colors.transparent,
                  //   highlightColor: Colors.transparent,
                  //   hoverColor: Colors.transparent,
                  //   onTap: () {
                  //     _bottomNavBarController.setPageIndex(4);
                  //   },
                  //   child: Obx(() {
                  //     return BottomNavItem(
                  //       title: "Support",
                  //       icon: Assets.icons.service,
                  //       isActive: _bottomNavBarController.pageIndex.value == 4,
                  //     );
                  //   }),
                  // ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
