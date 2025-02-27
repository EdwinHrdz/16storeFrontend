import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store16/common/widgets/loaders/animation_loader.dart';
import 'package:store16/utils/constants/colors.dart';
import 'package:store16/utils/helpers/helper_functions.dart';

class TFullScreenLoader {
  static void openLoadingDialog(String text, String animation) {

    final dark = THelperFunctions.isDarkMode(Get.context!);

    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false, 
      builder: (_) => PopScope(
        canPop: false,
        child: Container(
          color: dark ? TColors.dark : TColors.light,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 250,),
              TAnimationLoaderWidget(text: text, animation: animation)
            ],
          ),
        ),
      ));
  }

  static void closeLoadingDialog() {
    if (Get.isDialogOpen ?? false) {
      Get.back();
    }
  }
}