import 'package:flutter/material.dart';
import 'package:senkap/ressources/app_colors.dart';
import 'package:senkap/ressources/constants.dart';

import '../ressources/app_styles.dart';

class DialogWidget extends StatelessWidget {
  final String title;
  final String body;
  final bool isError;
  final bool isDoubleClick;
  final VoidCallback? methodCancel;
  final VoidCallback? methodAccept;
  final String textButtonCancel;
  final String? textButtonAccept;
  const DialogWidget(
      {super.key,
      required this.title,
      required this.body,
      this.isError = false,
      this.isDoubleClick = false,
      this.methodCancel,
      this.methodAccept,
      required this.textButtonCancel,
      this.textButtonAccept});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0))),
      contentPadding: EdgeInsets.all(0),
      content: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 24, left: 24, right: 24, bottom: 8),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: AppStyles.textStyle(
                  color: isError ? AppColors.accent : AppColors.primaryText,
                  weight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Text(
                body,
                // maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: AppColors.primaryText,
                    fontFamily: 'SignikaNegative',
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    inherit: false),
              ),
            ),
            SizedBox(
              height: 28,
            ),
            Divider(
              height: 1,
              color: AppColors.primaryText.withOpacity(0.5),
            ),
            isDoubleClick
                ? IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              methodCancel;
                            },
                            child: Center(
                              child: Text(
                                textButtonCancel,
                                // style: buttonStyle(ColorApp.disabledText),
                              ),
                            )),
                        Container(
                            height: 50,
                            width: 1,
                            color: AppColors.primaryText.withOpacity(0.5)),
                        TextButton(
                            onPressed: methodAccept,
                            child: Center(
                              child: Text(
                                textButtonAccept!,
                                // style: buttonStyle(primaryMain),
                              ),
                            )),
                      ],
                    ),
                  )
                : Center(
                    child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          methodCancel;
                        },
                        child: Text(
                          textButtonCancel,
                          // style: buttonStyle(primaryMain),
                        )),
                  ),
          ],
        ),
      ),
    );
    ;
  }
}
