import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:navadurga_fruits/features/authentication/screens/otp_verification/otp_verification_screen.dart';
import 'package:navadurga_fruits/utils/consts/sizes.dart';

import '../../../../../utils/validators/validators.dart';
import '../../../controllers/login_controller.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final controller = Get.put(LoginController());
    return Form(
        key: formKey,
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: TextFormField(
                validator: (value) => Validators.validatePhoneNumber(value),
                controller: controller.phoneNo,
                decoration: const InputDecoration(
                  labelText: 'Phone number',
                  prefixIcon: Icon(
                    Icons.phone,
                    size: 24,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: CustomSizes.spaceBtwnSections,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      LoginController.instance
                          .phoneAuthentication(controller.phoneNo.text.trim());
                      Get.to(() => const OtpVerificationScreen());
                    }
                  },
                  child: const Text('LOGIN')),
            ),
          ],
        ));
  }
}
