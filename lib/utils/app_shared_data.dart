import 'package:flutter/material.dart';
import 'package:get/get.dart';

showAnimatedDialog(dialog) {
  showGeneralDialog(
      barrierDismissible: true,
      barrierLabel: '',
      barrierColor: Colors.black.withOpacity(0.3),
      transitionDuration: const Duration(milliseconds: 700),
      context: Get.context!,
      pageBuilder: (context, anim1, anim2) {
        return WillPopScope(
          onWillPop: () {
            return Future.value(false);
          },
          child: Align(
            alignment: Alignment.center,
            child: dialog,
          ),
        );
      });
}
