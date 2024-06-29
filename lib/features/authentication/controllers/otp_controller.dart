// import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';
// import 'package:navadurga_fruits/data/repositories/authentication/authentication_repository.dart';
// import 'package:navadurga_fruits/features/authentication/controllers/login_controller.dart';
// import 'package:navadurga_fruits/features/authentication/screens/login/login.dart';
// import 'package:navadurga_fruits/navigation_menu.dart';
// import 'package:navadurga_fruits/utils/consts/lottie.dart';
// import 'package:navadurga_fruits/utils/popups/full_screen_loader.dart';
// import 'package:navadurga_fruits/utils/popups/loader.dart';
// import '../../../data/repositories/user/user_repository.dart';
// import '../../personalization/models/user_model.dart';

// class OTPController extends GetxController {
//   static OTPController get instance => Get.find();

//   final authRepository = Get.put(AuthenticationRepository());
//   final userRepository = Get.put(UserRepository());
//   final controller = LoginController.instance;

//   void verifyOTP(String otp) async {
//     try {
//       //show loaders
//       FullScreenLoader.openLoadingDialog('Processing', CustomLottie.lottie);

//       var isVerified = await AuthenticationRepository.instance.verifyOTP(otp);
//       //isVerified ? Get.offAll(const NavigationMenu()) : const LoginScreen();

//       if (isVerified) {
//         final newUser = UserModel(
//           id: authRepository.authUser.uid,
//           name: controller.username.text.trim(),
//           phoneNo: controller.phoneNo.text.trim(),
//           profilePicture: '',
//         );
//         //Save Authenticated user data in the direbase firestore
//         await userRepository.saveUserRecord(newUser);

//         Get.to(() => const NavigationMenu());
//         Navigator.of(Get.context!).pop();
//       } else {
//         Get.to(() => const LoginScreen());
//         Navigator.of(Get.context!).pop();
//       }
//     } catch (e) {
//       FullScreenLoader.stopLoading();
//       Loader.errorSnackBar(title: 'Oh snap!', message: e.toString());
//     }
//   }
// }
