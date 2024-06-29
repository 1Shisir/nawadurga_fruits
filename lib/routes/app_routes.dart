import 'package:get/get.dart';
import 'package:navadurga_fruits/features/authentication/screens/otp_verification/otp_verification_screen.dart';
import 'package:navadurga_fruits/features/personalization/profile/profile.dart';
import 'package:navadurga_fruits/routes/routes.dart';

import '../features/authentication/screens/login/login.dart';
import '../features/shop/screens/cart/cart_screen.dart';
import '../features/shop/screens/home/home_screen.dart';
import '../features/shop/screens/store/store.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: CustomRoutes.home, page: () => const HomeScreen()),
    GetPage(name: CustomRoutes.store, page: () => const StoreScreen()),
    GetPage(name: CustomRoutes.userProfile, page: () => const ProfileScreen()),
    GetPage(name: CustomRoutes.cart, page: () => const CartScreen()),
    GetPage(name: CustomRoutes.signIn, page: () => const LoginScreen()),
    GetPage(
        name: CustomRoutes.verifyOtp,
        page: () => const OtpVerificationScreen()),
  ];
}
