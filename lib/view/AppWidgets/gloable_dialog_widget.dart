import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:histopathological/utils/app_const.dart';
import 'package:histopathological/utils/app_media.dart';
import 'package:histopathological/view/AppWidgets/custom_text.dart';

import '../../utils/app_colors.dart';

class GlobalDialogWidget extends StatelessWidget {
  const GlobalDialogWidget(
      {Key? key,
      this.title,
      this.subTitle,
      this.isTwoBtn = true,
      this.isLoading = false,
      this.onOkBtnClick,
      this.onCancelBtnClick})
      : super(key: key);
  final String? title, subTitle;
  final bool? isTwoBtn, isLoading;
  final Function()? onOkBtnClick, onCancelBtnClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConst.appScreenHight / 2,
      decoration: BoxDecoration(
          color: AppColor.whiteColor,
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.symmetric(horizontal: 40),
      child: Scaffold(
        backgroundColor: AppColor.whiteColor,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 28),
                  Column(
                    children: [
                      Image.asset(
                        AppMedia.resultPageImage,
                        fit: BoxFit.cover,
                        width: AppConst.appScreenWidth / 2,
                        height: AppConst.appScreenHight / 7,
                      ),
                      SizedBox(
                        width: AppConst.appScreenWidth / 2,
                        child: LinearProgressIndicator(
                          color: AppColor.greenColor,
                          value: 1,
                          minHeight: 3,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppConst.appScreenWidth / 12),
                  CustomText(
                    text: "The Result is:",
                    textAlign: TextAlign.center,
                    fontSize: 12,
                    textColor: AppColor.seconderyColor,
                    textDirection: TextDirection.ltr,
                    fontWeight: FontWeight.normal,
                  ),
                  SizedBox(height: AppConst.appScreenWidth / 45),
                  CustomText(
                    text: "Bengin",
                    textAlign: TextAlign.center,
                    fontSize: 30,
                    textColor: AppColor.greenColor,
                    textDirection: TextDirection.ltr,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),
            Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: onCancelBtnClick ?? () {},
                      child: CustomText(
                        text: "Cancel",
                        textColor: AppColor.primaryColor,
                        textAlign: TextAlign.right,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),
            ),
            SizedBox(height: AppConst.appScreenWidth / 12),
          ],
        ),
      ),
    );
  }
}
