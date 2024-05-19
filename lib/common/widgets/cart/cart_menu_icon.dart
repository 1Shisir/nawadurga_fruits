import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:navadurga_fruits/features/shop/screens/cart/cart_screen.dart';

import '../../../features/shop/controllers/cart_controller.dart';

class CustomCartCounterIcon extends StatelessWidget {
  const CustomCartCounterIcon({
    super.key,
    this.iconColor,
    this.counterTextColor,
    this.counterBgColor,
  });
  final Color? iconColor, counterTextColor, counterBgColor;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartController());
    return Stack(
      children: [
        IconButton(
          onPressed: () => Get.to(() => const CartScreen()),
          icon: const Icon(Icons.shopping_bag_outlined),
          color: iconColor,
        ),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Obx(
                () => Text(
                  controller.noOfCartItems.value.toString(),
                  style: const TextStyle(
                    fontSize: 8,
                  ).apply(color: Colors.white),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
