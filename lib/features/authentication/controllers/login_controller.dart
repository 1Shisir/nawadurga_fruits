import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:navadurga_fruits/data/repositories/authentication/authentication_repository.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final phoneNo = TextEditingController();
  final username = TextEditingController();

  void phoneAuthentication(String phoneNo) {
    AuthenticationRepository.instance.phoneAuthentication(phoneNo);
  }
}
