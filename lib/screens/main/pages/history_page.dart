import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/bottom_nav_bar_controller.dart';
import '../../../controllers/transaction_controller.dart';
import '../../../ressources/app_colors.dart';
import '../../../ressources/app_styles.dart';
import '../../../ressources/constants.dart';
import '../../../widgets/history_item_widget.dart';

class HistoryPage extends StatelessWidget {
  final bool isSeeMoreVisibles;
  HistoryPage({super.key, this.isSeeMoreVisibles = false});
  final BottomNavBarController _bottomNavBarController =
      Get.put(BottomNavBarController());

  final TransactionController _transactionController = Get.find();
  // final TransactionController _transactionController =
  //     Get.put(TransactionController());
  final List<String> tabListItem = [
    "All",
    "Recharges",
    "Withdraw",
    "Transferts",
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isSeeMoreVisibles
            ? Padding(
                padding: EdgeInsets.only(
                    top: isSeeMoreVisibles ? 0.0 : 0.0, bottom: 18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Transactions',
                      style: AppStyles.textStyle(
                        color: AppColors.primaryText,
                        size: 18,
                        weight: FontWeight.w700,
                      ),
                    ),
                    isSeeMoreVisibles
                        ? GestureDetector(
                            onTap: () {
                              _bottomNavBarController.setPageIndex(3);
                            },
                            child: Text(
                              'see more',
                              style: AppStyles.textStyle(
                                color: const Color(0xFF848484),
                                size: 16,
                                weight: FontWeight.w300,
                                // height: 0.14,
                                // letterSpacing: -0.08,
                              ),
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
              )
            : const SizedBox(),

        Center(
          child: SizedBox(
            height: 37.0,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.zero,
                itemCount: tabListItem.length,
                itemBuilder: ((context, index) {
                  return GestureDetector(
                    onTap: () {
                      _bottomNavBarController.selectedHistoryFilter(index);
                    },
                    child: Obx(() {
                      return Container(
                        margin: EdgeInsets.only(left: index != 0 ? 10.0 : 0.0),
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 12.0),
                        decoration: BoxDecoration(
                          color: _bottomNavBarController
                                      .selectedHistoryFilter.value ==
                                  index
                              ? AppColors.bgColor
                              : AppColors.white,
                          borderRadius: BorderRadius.circular(
                              Constants.defaultBorderRadius),
                        ),
                        child: Text(
                          tabListItem[index],
                          style: AppStyles.textStyle(
                            color: index ==
                                    _bottomNavBarController
                                        .selectedHistoryFilter.value
                                ? AppColors.primaryText
                                : AppColors.secondaryText,
                            weight: FontWeight.w600,
                            size: 15.0,
                          ),
                        ),
                      );
                    }),
                  );
                })),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 25.0, left: 4.0, right: 4.0),
          child: ListView.builder(
              shrinkWrap: true,
              // scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: isSeeMoreVisibles ? 7 : 10,
              itemBuilder: ((context, index) {
                return Obx(() {
                  return HistoryItemComponent(
                    onTap: () {
                      if (_transactionController.selectedTransaction.value ==
                          index) {
                        _transactionController.selectedTransaction(-1);
                      } else {
                        _transactionController.selectedTransaction(index);
                      }
                    },
                    isTransactionDetailsActivated:
                        _transactionController.selectedTransaction.value ==
                            index,
                  );
                });
              })),
        ),
        // SizedBox(
        //     height: Constants.screenHeight(context) / 2.5,
        //     width: Constants.screenWidth(context) / 1.5,
        //     child: Center(
        //         child: Text(
        //       "Aucune transaction pour l'instant",
        //       textAlign: TextAlign.center,
        //       style: AppStyles.textStyle(
        //         color: AppColors.primaryText,
        //         size: 18.0,
        //         weight: FontWeight.w500,
        //       ),
        //     )))
        // : const SizedBox()
      ],
    );
  }
}
