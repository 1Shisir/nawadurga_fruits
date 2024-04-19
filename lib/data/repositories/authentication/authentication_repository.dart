import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //variables
  final _auth = FirebaseAuth.instance;
  var verificationId = ''.obs;

  //format phone number
  String formatPhoneNumber(String countryCode, String phoneNumber) {
    String cleanedPhoneNumber = phoneNumber.replaceAll(RegExp(r'\D+'), '');
    return '+$countryCode$cleanedPhoneNumber';
  }

  //phone verification

  Future<void> phoneAuthentication(String phoneNo) async {
    String countryCode = '977'; // Nepal country code
    String formattedPhoneNumber = formatPhoneNumber(countryCode, phoneNo);

    await _auth.verifyPhoneNumber(
      phoneNumber: formattedPhoneNumber,
      verificationCompleted: (credential) async {
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (e) {
        if (e.code == 'invalid-phone-number') {
          Get.snackbar('Error', 'The provided phone number is invalid');
        } else {
          Get.snackbar('Error', 'Something went wrong.Try again.');
        }
      },
      codeSent: (verificationId, resendToken) {
        this.verificationId.value = verificationId;
      },
      codeAutoRetrievalTimeout: (verificationId) {
        this.verificationId.value = verificationId;
      },
    );
  }

  //verify otp
  Future<bool> verifyOTP(String otp) async {
    var credentials = await _auth.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: verificationId.value, smsCode: otp));

    return credentials.user != null ? true : false;
  }
}
