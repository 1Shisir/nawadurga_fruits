import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:navadurga_fruits/features/shop/controllers/cart_controller.dart';
import 'package:navadurga_fruits/features/shop/screens/checkout/checkout.dart';
import 'package:navadurga_fruits/utils/consts/lottie.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../navigation_menu.dart';
import '../../../../utils/consts/sizes.dart';
import '../../../../utils/loaders/animation_loader.dart';
import 'widgets/custom_cart_items.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key, this.showAddAndRemoveButton = true});

  final bool showAddAndRemoveButton;

  @override
  Widget build(BuildContext context) {
    final cartController = Get.put(CartController());
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text('Cart',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        showbackArrow: true,
      ),
      body: Obx(() {
        final emptyWidget = AnimationLoaderWidget(
          text: 'Cart is Empty',
          animation: CustomLottie.lottie,
          actionText: 'Let\'s fill it',
          showAction: true,
          onActionPressed: () => Get.offAll(() => const NavigationMenu()),
        );

        if (cartController.cartItems.isEmpty) {
          return emptyWidget;
        } else {
          return const SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(CustomSizes.defaultSpace),
              child: CustomCartItems(),
            ),
          );
        }
      }),
      bottomNavigationBar: (cartController.cartItems.isEmpty)
          ? const SizedBox()
          : Padding(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
                  onPressed: () => Get.to(() => const CheckoutScreen()),
                  child: Obx(() => Text(
                      'Checkout Rs.${cartController.totalCartPrice.value}'))),
            ),
    );
  }
}
