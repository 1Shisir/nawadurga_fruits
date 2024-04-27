import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:navadurga_fruits/data/repositories/authentication/authentication_repository.dart';
import 'package:navadurga_fruits/data/repositories/user/user_repository.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final phoneNo = TextEditingController();
  final username = TextEditingController();
  final userRepository = Get.put(UserRepository());

//get number from user and pass it to authentication
  void phoneAuthentication(String phoneNo) {
    AuthenticationRepository.instance.phoneAuthentication(phoneNo);
  }
}
