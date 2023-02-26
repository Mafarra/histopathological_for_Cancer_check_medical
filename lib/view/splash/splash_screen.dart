import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:histopathological/utils/app_colors.dart';
import 'package:histopathological/utils/app_const.dart';
import 'package:histopathological/utils/app_media.dart';

import '../Home/home_screen_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? animation;
  @override
  void initState() {
    super.initState();
     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // initListener();
    Timer(const Duration(seconds: 1), () {
      Get.offAll(const UploaPage());
    });
     });
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animation =
        CurvedAnimation(parent: animationController!, curve: Curves.easeOut);
    animation?.addListener(() => setState(() {}));
    animationController?.forward();
  }

  Widget get splashLogo => FittedBox(
        child: SizedBox(
          width: AppConst.appScreenWidth / 1.9,
          height: AppConst.appScreenHight / 3,
          child: Center(
            child: SvgPicture.asset(
              AppMedia.splashLogo,
              fit: BoxFit.contain,
            ),
          ),
        ),
      );
  Widget get iconsRow => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              AppMedia.splashLeftIcon,
              fit: BoxFit.cover,
              width: 60,
              height: 60,
            ),
            Image.asset(
              AppMedia.splashRightIcon,
              fit: BoxFit.cover,
              width: 60,
              height: 60,
            ),
          ],
        ),
      );
  @override
  Widget build(BuildContext context) {
    AppConst.appScreenHight = MediaQuery.of(context).size.height;
    AppConst.appScreenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          iconsRow,
          SizedBox(
            height: AppConst.appScreenHight / 25,
          ),
          splashLogo,
        ],
      ),
    );
  }
}
