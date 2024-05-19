import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

import '../features/shop/controllers/cart_controller.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(CartController());
  }
}
