import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:navadurga_fruits/utils/consts/lottie.dart';
import '../../../../navigation_menu.dart';
import '../../../data/repositories/authentication/authentication_repository.dart';
import '../../../data/repositories/order/order_repository.dart';
import '../../../utils/consts/enums.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../../../utils/popups/loader.dart';
import '../../personalization/controllers/address_controller.dart';
import '../models/order_model.dart';
import 'cart_controller.dart';
import 'checkout_controller.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  //variables
  final cartController = CartController.instance;
  final addressController = Get.put(AddressController());
  final checkoutController = Get.put(CheckoutController());
  final orderRepository = Get.put(OrderRepository());

  //fetch user's order history
  Future<List<OrderModel>> fetchuserOrders() async {
    try {
      final userOrders = await orderRepository.fetchUserOrders();
      return userOrders;
    } catch (e) {
      Loader.warningSnackBar(title: 'Oh snap', message: e.toString());
      return [];
    }
  }

  //add method for order processing
  void processOrder(double totalAmount) async {
    try {
      //start loader
      FullScreenLoader.openLoadingDialog(
          'Processing your order', CustomLottie.lottie);

      //Get use authentication id
      final userId = AuthenticationRepository.instance.authUser.uid;
      if (userId.isEmpty) return;

      //Add datails
      final order = OrderModel(
        id: FirebaseFirestore.instance.collection('Products').doc().id,
        userId: userId,
        status: OrderStatus.pending,
        totalAmount: totalAmount,
        orderDate: DateTime.now(),
        items: cartController.cartItems.toList(),
        paymentMethod: checkoutController.selectedpaymentMethod.value.name,
        address: addressController.selectedAddress.value,
        deliveryDate: DateTime.now(),
      );

      //save the order to firestore
      await orderRepository.saveOrder(order);

      //update cart status
      cartController.clearCart();

      FullScreenLoader.stopLoading();

      //success message
      Loader.successSnackBar(
          title: 'Congratulation', message: 'Your order has been placed');

      //show success screen
      Get.to(() => const NavigationMenu());

      Navigator.of(Get.context!).pop();
    } catch (e) {
      Loader.errorSnackBar(title: 'Oh snap!', message: e.toString());
    } finally {
      FullScreenLoader.stopLoading();
    }
  }
}
