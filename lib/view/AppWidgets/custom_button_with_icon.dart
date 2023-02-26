import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gif_view/gif_view.dart';
import 'package:histopathological/utils/app_colors.dart';
import 'package:histopathological/view/AppWidgets/custom_text.dart';

import '../../utils/app_media.dart';
import '../../utils/app_shared_data.dart';
import 'gloable_dialog_widget.dart';

// ignore: must_be_immutable
class CustomTextButonWithIcon extends StatelessWidget {
  late double? width;
  late IconData? icon;
  late String? text;
  late Color? backGroundColor;
  late Color? iconColor;
  late Color? textColor;
  late bool? isLeftIcon = true;
  late Function? onClick;

  CustomTextButonWithIcon(
      {Key? key,
      this.text,
      this.width,
      this.icon,
      this.backGroundColor,
      this.iconColor,
      this.textColor,
      this.onClick,
      required this.isLeftIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        height: 44,
        child: TextButton(
          style: ButtonStyle(
              alignment: Alignment.bottomCenter,
              backgroundColor:
                  MaterialStateProperty.all(backGroundColor),
              // padding: MaterialStateProperty.all(
              //     const EdgeInsets.symmetric(horizontal: 10)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ))),
          onPressed: () {
            onClick!() ?? () {};
          },
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon!,
                  color: iconColor,
                  size: 15,
                ),
                const SizedBox(
                  width: 5,
                ),
                CustomText(
                  text: text,
                  textColor: textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ));
  }
}

Widget? showGifProcessing() {
  return Stack(
    children: [
      Center(
        child: GifView.asset(
          AppMedia.processingGif,
          fit: BoxFit.cover,
          fadeDuration: const Duration(seconds: 2),
          width: 200,
          height: 200,
          frameRate: 30,
        ),
      ),
    ],
  );
}

void showCustomDialog() {
  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    const Duration(seconds: 3);
    showAnimatedDialog(GlobalDialogWidget(
      onCancelBtnClick: () => Get.back(),
    ));
  });
}

void showGifDialog() {
  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    const Duration(seconds: 3);
    showAnimatedDialog(showGifProcessing());
  });
}
