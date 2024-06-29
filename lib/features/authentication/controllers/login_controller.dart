import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:navadurga_fruits/data/repositories/authentication/authentication_repository.dart';
import 'package:navadurga_fruits/utils/consts/lottie.dart';
import 'package:navadurga_fruits/utils/http/network_manager.dart';
import '../../../data/repositories/user/user_repository.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../../../utils/popups/loader.dart';
import '../../personalization/models/user_model.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final phoneNo = TextEditingController();
  final username = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final authRepository = AuthenticationRepository.instance;
  final userRepo = Get.put(UserRepository());

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
      await authRepository.phoneAuthentication(phoneNo.text.trim());

      //remove loader
      FullScreenLoader.stopLoading();

      ///show success message

      Loader.successSnackBar(
          title: 'Congratulation',
          message: 'Your account has been created, verify OTP to continue.');

      ///move to verify otp
      authRepository.screenRedirect();

      // Navigator.of(Get.context!).pop();
    } catch (e) {
      ///remove loader
      FullScreenLoader.stopLoading();

      ///show some generic error to the user
      Loader.errorSnackBar(title: 'oh snap!', message: e.toString());
    }
  }

  void verifyOTP(String otp) async {
    try {
      //show loaders
      FullScreenLoader.openLoadingDialog('Processing', CustomLottie.lottie);

      var isVerified = await AuthenticationRepository.instance.verifyOTP(otp);
      //isVerified ? Get.offAll(const NavigationMenu()) : const LoginScreen();

      if (isVerified) {
        final newUser = UserModel(
          id: authRepository.authUser.uid,
          name: username.text.trim(),
          phoneNo: phoneNo.text.trim(),
          profilePicture: '',
        );
        //Save Authenticated user data in the direbase firestore
        await userRepo.saveUserRecord(newUser);

        authRepository.screenRedirect();
      } else {
        authRepository.screenRedirect();
      }
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loader.errorSnackBar(title: 'Oh snap!', message: e.toString());
    }
  }
}
