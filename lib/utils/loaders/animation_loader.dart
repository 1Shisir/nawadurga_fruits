import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../consts/sizes.dart';

class AnimationLoaderWidget extends StatelessWidget {
  ///parameters
  ///  -text: text to be displayed below the animation
  ///  -animation: The path to the lottie animation file
  ///  -showAction: Whether to show an action button below the text
  ///  - actonText: The text to be displayed on the action button
  ///  - onActionPressed: Call back Function to be executed when the action button is pressed
  const AnimationLoaderWidget(
      {super.key,
      required this.text,
      required this.animation,
      this.showAction = false,
      this.actionText,
      this.onActionPressed});

  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(animation,
              width: MediaQuery.of(context).size.width *
                  0.8), // display lottie animation
          const SizedBox(
            height: CustomSizes.defaultSpace,
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: CustomSizes.defaultSpace,
          ),
          showAction
              ? SizedBox(
                  width: 250,
                  child: OutlinedButton(
                      onPressed: onActionPressed,
                      style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.black38),
                      child: Text(
                        actionText!,
                        style: Theme.of(context).textTheme.bodyMedium!.apply(
                            color: const Color.fromARGB(255, 255, 255, 255)),
                      )),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
