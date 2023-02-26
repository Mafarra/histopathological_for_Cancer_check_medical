import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gif_view/gif_view.dart';
import 'package:histopathological/utils/app_colors.dart';
import 'package:histopathological/utils/app_const.dart';
import 'package:histopathological/utils/app_media.dart';
import 'package:histopathological/view/AppWidgets/custom_button_with_icon.dart';
import 'package:histopathological/view/AppWidgets/custom_text.dart';
import '../../utils/app_shared_data.dart';
import '../AppWidgets/gloable_dialog_widget.dart';

class UploaPage extends StatefulWidget {
  const UploaPage({super.key});

  @override
  State<UploaPage> createState() => _UploaPageState();
}

class _UploaPageState extends State<UploaPage> {
  GifController? gifController;
  @override
  void initState() {
    super.initState();
    gifController = GifController();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: AppConst.appScreenHight / 4,
                ),
                Center(
                  child: Image.asset(
                    AppMedia.uploadPageImage,
                    fit: BoxFit.cover,
                    width: AppConst.appScreenWidth / 1.5,
                    height: AppConst.appScreenHight / 5,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                FittedBox(
                  child: CustomText(
                    text: '''Upload\nHistopathological image''',
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    textColor: AppColor.seconderyColor,
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.ltr,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                FittedBox(
                  child: CustomText(
                    text:
                        '''You can upload the\n Histopathological Image on this\n page to see if there is a breast \ncancer or not.''',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    textColor: AppColor.seconderyColor.withOpacity(.60),
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.ltr,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: AppConst.appScreenHight / 8,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: CustomTextButonWithIcon(
                    text: 'Upload',
                    isLeftIcon: true,
                    textColor: Colors.white,
                    backGroundColor: AppColor.primaryColor,
                    icon: Icons.cloud_upload,
                    iconColor: Colors.white,
                    width: AppConst.appScreenWidth / 2,
                    onClick: () {
                      showGifDialog();
                      showCustomDialog();
                      gifController!.status = GifStatus.paused;
                      // if (gifController!.status == GifStatus.playing) {
                      //   gifController!.pause();
                      // } else {
                      //   gifController!.play();
                      // }
                    },
                  ),
                ),
                SizedBox(
                  height: AppConst.appScreenHight / 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showCustomDialog() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      const Duration(seconds: 3);

      // Get.back();
      setState(() {});
      Future.delayed(const Duration(seconds: 4), () {
        gifController!.stop;
        showAnimatedDialog(GlobalDialogWidget(
            isLoading: false,
            onCancelBtnClick: () {
              gifController!.stop();
              Get.back();
              Get.back();
            }));
      });
    });
  }

  void showGifDialog() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      const Duration(seconds: 2);
      setState(() {
        gifController!.play();
      });
      showAnimatedDialog(showGifProcessing());
      Future.delayed(const Duration(milliseconds: 1300), () {
        gifController!.status = GifStatus.paused;
      });
    });
  }

  Widget? showGifProcessing() {
    return Scaffold(
      backgroundColor: AppColor.seconderyColor.withOpacity(.75),
      body: Stack(
        children: [
          Center(
            child: GifView.asset(
              AppMedia.processingGif,
              controller: gifController,
              fit: BoxFit.cover,
              alignment: Alignment.center,
              fadeDuration: const Duration(milliseconds: 200),
              width: 150,
              height: 150,
              frameRate: 30,
              repeat: ImageRepeat.noRepeat,
              onError: (value) => Get.back(),
              withOpacityAnimation: true,
            ),
          ),
        ],
      ),
    );
  }
}
