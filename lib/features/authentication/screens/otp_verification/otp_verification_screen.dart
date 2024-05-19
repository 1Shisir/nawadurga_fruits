import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:navadurga_fruits/features/authentication/controllers/otp_controller.dart';
import 'package:navadurga_fruits/utils/consts/sizes.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var otp = "";
    final controller = Get.put(OTPController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Verify',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
        ),
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CustomSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Login',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
              const SizedBox(
                height: CustomSizes.spaceBtwnItems,
              ),
              const Text('Enter 6 digits code for verification.',
                  style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
              const SizedBox(
                height: CustomSizes.spaceBtwnItems,
              ),
              OtpTextField(
                showCursor: true,
                fillColor: Colors.black.withOpacity(0.1),
                filled: true,
                numberOfFields: 6,
                onSubmit: (code) {
                  otp = code;
                  controller.verifyOTP(otp);
                },
              ),
              const SizedBox(
                height: CustomSizes.spaceBtwnSections,
              ),

              //button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      controller.verifyOTP(otp);
                    },
                    child: const Text('Next')),
              ),

              const SizedBox(
                height: CustomSizes.spaceBtwnItems,
              ),

              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () {}, child: const Text('Resend OTP')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
