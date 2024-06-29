import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:navadurga_fruits/features/authentication/controllers/login_controller.dart';
import 'package:navadurga_fruits/features/personalization/controllers/address_controller.dart';
import 'package:navadurga_fruits/features/shop/controllers/cart_controller.dart';

import 'package:navadurga_fruits/features/shop/controllers/order_controller.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
    Get.put(CartController());
    Get.put(AddressController());
    Get.put(OrderController());
  }
}
