import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../controllers/transaction_controller.dart';
import '../gen/assets.gen.dart';
import '../ressources/app_colors.dart';
import '../ressources/app_styles.dart';
import '../ressources/constants.dart';
import 'icon_button_widget.dart';

class HistoryItemComponent extends StatelessWidget {
  final bool isTransactionDetailsActivated;
  final void Function() onTap;
  HistoryItemComponent({
    super.key,
    required this.isTransactionDetailsActivated,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 7.0), //7.0
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 18.0),
              // padding: const EdgeInsets.all(16.0),
              decoration: ShapeDecoration(
                // color: AppColors.secondary,
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(Constants.defaultBorderRadius),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      // _transactionController.isLoading.value
                      //     ? Shimmer.fromColors(
                      //         enabled: true,
                      //         baseColor: Colors.grey.shade300,
                      //         highlightColor: Colors.grey.shade100,
                      //         child: Container(
                      //           padding: const EdgeInsets.all(24.0),
                      //           decoration: BoxDecoration(
                      //               color: AppColors.grey300,
                      //               borderRadius: BorderRadius.circular(12.0)),
                      //         ),
                      //       )
                      //     :
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: AppColors.bgColor,
                          // border: Border.all(),
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(
                          Assets.icons.recharge,
                          color: AppColors.primaryText,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 19.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // _transactionController.isLoading.value
                            //     ? Shimmer.fromColors(
                            //         enabled: true,
                            //         baseColor: Colors.grey.shade300,
                            //         highlightColor: Colors.grey.shade100,
                            //         child: Container(
                            //           height: 15.0,
                            //           width: 80.0,
                            //           color: AppColors.grey300,
                            //         ),
                            //       )
                            //     :
                            Text(
                              "Recharge",
                              style: AppStyles.textStyle(
                                color: AppColors.primaryText,
                                size: 16,
                                weight: FontWeight.w500,
                              ),
                            ),
                            // _transactionController.isLoading.value
                            //     ? Padding(
                            //         padding: const EdgeInsets.only(top: 8.0),
                            //         child: Shimmer.fromColors(
                            //           enabled: true,
                            //           baseColor: Colors.grey.shade300,
                            //           highlightColor: Colors.grey.shade100,
                            //           child: Container(
                            //             height: 15.0,
                            //             width: 100.0,
                            //             color: AppColors.grey300,
                            //           ),
                            //         ),
                            //       )
                            //     :
                            Text(
                              "27-20-2023 13: 50", //Today, 7:50 PM
                              // _transactionController
                              //     .parseDate(transaction.createdAt!),
                              style: AppStyles.textStyle(
                                color: AppColors.primaryText,
                                size: 11,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // _transactionController.isLoading.value
                      //     ? Shimmer.fromColors(
                      //         enabled: true,
                      //         baseColor: Colors.grey.shade300,
                      //         highlightColor: Colors.grey.shade100,
                      //         child: Container(
                      //           height: 15.0,
                      //           width: 80.0,
                      //           color: AppColors.grey300,
                      //         ),
                      //       )
                      //     :
                      Text.rich(
                        TextSpan(
                          children: [
                            const TextSpan(
                              text: "+",
                              style: TextStyle(
                                color: AppColors.primaryText,
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                            TextSpan(
                              text: '${500} XAF',
                              style: AppStyles.textStyle(
                                color: AppColors.primaryText,
                                size: 15,
                                weight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // _transactionController.isLoading.value
                      //     ? Padding(
                      //         padding: const EdgeInsets.only(top: 8.0),
                      //         child: Shimmer.fromColors(
                      //           enabled: true,
                      //           baseColor: Colors.grey.shade300,
                      //           highlightColor: Colors.grey.shade100,
                      //           child: Container(
                      //             height: 15.0,
                      //             width: 50.0,
                      //             color: AppColors.grey300,
                      //           ),
                      //         ),
                      //       )
                      //     :
                      Text(
                        "Réussi",
                        style: AppStyles.textStyle(
                          color:
                              // transaction.status!.toLowerCase() == "pending"
                              //     ? AppColors.yellowLight
                              //     :
                              AppColors.success,
                          size: 13,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            AnimatedSize(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              child: isTransactionDetailsActivated
                  ? Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        // color: AppColors.secondary,
                        borderRadius: BorderRadius.only(
                          bottomLeft:
                              Radius.circular(Constants.defaultBorderRadius),
                          bottomRight:
                              Radius.circular(Constants.defaultBorderRadius),
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Name",
                                style: AppStyles.textStyle(
                                  color: AppColors.primaryText,
                                  size: 13.0,
                                ),
                              ),
                              Text(
                                "Malondo Jean Peaul",
                                style: AppStyles.textStyle(
                                  color: AppColors.primaryText,
                                  size: 13.0,
                                ),
                              ),
                            ],
                          ),
                          const Divider(
                            thickness: 0.5,
                            indent: 80.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Phone",
                                style: AppStyles.textStyle(
                                  color: AppColors.primaryText,
                                  size: 13.0,
                                ),
                              ),
                              Text(
                                "655221144",
                                style: AppStyles.textStyle(
                                  color: AppColors.primaryText,
                                  size: 13.0,
                                ),
                              ),
                            ],
                          ),
                          const Divider(
                            thickness: 0.5,
                            indent: 80.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Fees",
                                style: AppStyles.textStyle(
                                  color: AppColors.primaryText,
                                  size: 13.0,
                                ),
                              ),
                              Text(
                                "/",
                                style: AppStyles.textStyle(
                                  color: AppColors.primaryText,
                                  size: 13.0,
                                ),
                              ),
                            ],
                          ),
                          const Divider(
                            thickness: 0.5,
                            indent: 80.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const SizedBox(),
                                IconButtonWidget(
                                  icon: Assets.icons.reload,
                                  iconWidth: 20.0,
                                  text: "Repeat",
                                  onTap: () {},
                                ),
                                // GestureDetector(
                                //   onTap: () {},
                                //   child: Container(
                                //     // margin: EdgeInsets.only(
                                //     //     left: index != 0 ? 10.0 : 0.0),
                                //     padding: const EdgeInsets.symmetric(
                                //         vertical: 8.0, horizontal: 12.0),
                                //     decoration: BoxDecoration(
                                //       color: AppColors.primary.withOpacity(0.5),
                                //       borderRadius: BorderRadius.circular(
                                //           Constants.defaultBorderRadius),
                                //     ),
                                //     child: Row(
                                //       children: [
                                //         SvgPicture.asset(
                                //           Assets.icons.reload,
                                //           color: AppColors.primaryText,
                                //           width: 20.0,
                                //         ),
                                //         // Container(
                                //         //   padding: EdgeInsets.all(10.0),
                                //         //   decoration: BoxDecoration(
                                //         //       color: AppColors.white,
                                //         //       shape: BoxShape.circle),
                                //         //   child: SvgPicture.asset(
                                //         //     mainActionsList[index]["icon"],
                                //         //     color: AppColors.primaryText,
                                //         //   ),
                                //         // ),
                                //         Padding(
                                //           padding:
                                //               const EdgeInsets.only(left: 10.0),
                                //           child: Text(
                                //             "Repeat",
                                //             style: AppStyles.textStyle(
                                //               color: AppColors.primaryText,
                                //               size: 15.0,
                                //             ),
                                //           ),
                                //         ),
                                //       ],
                                //     ),
                                //   ),
                                // )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  : const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
