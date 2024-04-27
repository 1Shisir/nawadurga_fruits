import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:navadurga_fruits/utils/consts/lottie.dart';

import '../loaders/animation_loader.dart';

class FullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
        barrierDismissible: false,
        context: Get.overlayContext!,
        builder: (_) => PopScope(
              canPop: false,
              child: Container(
                color: Colors.white,
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  children: [
                    const SizedBox(height: 250),
                    AnimationLoaderWidget(
                        text: text, animation: CustomLottie.lottie)
                  ],
                ),
              ),
            ));
  }

  //stop current loading window

  static void stopLoading() {
    Navigator.of(Get.overlayContext!).pop(); //close the dialog using navigator
  }
}
