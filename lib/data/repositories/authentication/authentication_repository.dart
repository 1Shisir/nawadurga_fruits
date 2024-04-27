import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:navadurga_fruits/features/authentication/screens/login/login.dart';
import 'package:navadurga_fruits/navigation_menu.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //variables
  final _auth = FirebaseAuth.instance;
  var verificationId = ''.obs;
  late final Rx<User?> firebaseUser;

  //get authorized user data
  User? get authUser => _auth.currentUser;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  //screen redirect
  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(() => const NavigationMenu());
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

  //sign out
  Future<void> signOut() async {
    await _auth.signOut();
    Get.offAll(() => const LoginScreen());
  }
}
