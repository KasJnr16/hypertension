import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hypertension_app/common/widgets/loaders/animation_loader.dart';
import 'package:hypertension_app/utils/constants/colors.dart';
import 'package:hypertension_app/utils/helpers/helper_functions.dart';

class UniFullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child: Container(
          color: HelperFunctions.isDarkMode(Get.context!)
              ? UniColors.dark
              : UniColors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UniAnimationLoaderWidget(text: text, animation: animation),
            ],
          ),
        ),
      ),
    );
  }

  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
