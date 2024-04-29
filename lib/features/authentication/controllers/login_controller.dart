import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:navadurga_fruits/data/repositories/authentication/authentication_repository.dart';
import 'package:navadurga_fruits/data/repositories/user/user_repository.dart';
import 'package:navadurga_fruits/features/authentication/screens/otp_verification/otp_verification_screen.dart';
import 'package:navadurga_fruits/utils/consts/lottie.dart';
import 'package:navadurga_fruits/utils/http/network_manager.dart';

import '../../../utils/popups/full_screen_loader.dart';
import '../../../utils/popups/loader.dart';
import '../../personalization/models/user_model.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final phoneNo = TextEditingController();
  final username = TextEditingController();
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  Future<void> signup() async {
    try {
      ///start loading
      FullScreenLoader.openLoadingDialog('Processing....', CustomLottie.lottie);

      ///check internet connectivity
      final isConnected = await NetworkController.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      ///Form validation
      if (!loginFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      //get number from user and pass it to authentication

      await AuthenticationRepository.instance
          .phoneAuthentication(phoneNo.text.trim());
      // ///REgister user in the firebase & save user data in the firestore
      // final UserCredential = await AuthenticationRepository.instance
      //     .phoneAuthentication(phoneNo.text.trim());

      ///Save Authenticated user data in the direbase firestore
      final newUser = UserModel(
        id: PhoneAuthProvider().providerId,
        name: username.text.trim(),
        phoneNo: phoneNo.text.trim(),
        profilePicture: '',
      );

      await userRepository.saveUserRecord(newUser);

      //remove loader
      FullScreenLoader.stopLoading();

      ///show success message

      Loader.successSnackBar(
          title: 'Congratulation',
          message: 'Your account has been created, verify OTP to continue.');

      ///move to verify otp
      Get.to(() => const OtpVerificationScreen());
    } catch (e) {
      ///remove loader
      FullScreenLoader.stopLoading();

      ///show some generic error to the user
      Loader.errorSnackBar(title: 'oh snap!', message: e.toString());
    }
  }
}
