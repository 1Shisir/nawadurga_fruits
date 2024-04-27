import 'package:get/get.dart';
import 'package:navadurga_fruits/data/repositories/authentication/authentication_repository.dart';
import 'package:navadurga_fruits/features/authentication/screens/login/login.dart';
import 'package:navadurga_fruits/navigation_menu.dart';

class OTPController extends GetxController {
  static OTPController get instance => Get.find();

  void verifyOTP(String otp) async {
    var isVerified = await AuthenticationRepository.instance.verifyOTP(otp);
    isVerified ? Get.offAll(const NavigationMenu()) : const LoginScreen();
  }
}
