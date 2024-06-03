import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:navadurga_fruits/features/authentication/screens/login/login.dart';
import 'package:navadurga_fruits/navigation_menu.dart';
import 'package:navadurga_fruits/utils/popups/loader.dart';

import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';
import '../user/user_repository.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //variables
  final _auth = FirebaseAuth.instance;
  var verificationId = ''.obs;
  late final Rx<User?> firebaseUser;

  //get authorized user data
  User get authUser => _auth.currentUser!;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
    // screenRedirect();
  }

  //screen redirect

  // screenRedirect() async {
  //   final user = _auth.currentUser;
  //   if (user != null) {
  //     //if the user is verified
  //     //initialize user specific bucket
  //     //await CustomLocalStorage.init(user.uid);

  //     //if the user is verified , nacigate to the main navigation menu
  //     Get.offAll(() => const NavigationMenu());
  //   } else {
  //     Get.to(() => const LoginScreen());
  //   }
  // }
  _setInitialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => const LoginScreen());
    } else {
      if (user.uid.isEmpty) {
        Loader.warningSnackBar(
            title: "Login Required", message: 'Please login first');
        return;
      }
      Get.offAll(() => const NavigationMenu());
    }
  }

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
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'session-expired') {
          ScaffoldMessenger.of(Get.context!).showSnackBar(
            const SnackBar(
                content:
                    Text('reCAPTCHA verification expired. Please try again.')),
          );
        } else if (e.code == 'invalid phone number') {
          Loader.errorSnackBar(
              title: 'Phone Number is Used', message: 'Use another number');
        } else {
          ScaffoldMessenger.of(Get.context!).showSnackBar(
            SnackBar(content: Text('Verification failed: ${e.message}')),
          );
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

  //sign out
  Future<void> signOut() async {
    await _auth.signOut();
    Get.offAll(() => const LoginScreen());
  }

  ///delete user account
  Future<void> deleteAccount() async {
    try {
      await UserRepository.instance.removeUserRecord(_auth.currentUser!.uid);
      await _auth.currentUser?.delete();
    } on FirebaseAuthException catch (e) {
      throw CustomFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const CustomFormatExceptions();
    } on PlatformException catch (e) {
      throw CustomPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
