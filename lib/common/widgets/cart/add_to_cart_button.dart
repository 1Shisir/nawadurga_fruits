import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../features/shop/controllers/cart_controller.dart';
import '../../../features/shop/models/product_model.dart';
import '../../../utils/consts/sizes.dart';

class ProductCartAddToCartButton extends StatelessWidget {
  const ProductCartAddToCartButton({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final cartController = Get.put(CartController());
    return InkWell(
      onTap: () {
        final cartItem = cartController.convertToCartItem(product, 1);
        cartController.addOneToCart(cartItem);
      },
      child: Obx(() {
        final productQuantityInCart =
            cartController.getProductQuantityInCart(product.id!);
        return Container(
          decoration: BoxDecoration(
              color: productQuantityInCart > 0 ? Colors.green : Colors.black38,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(CustomSizes.cardRadiusMd),
                bottomRight: Radius.circular(CustomSizes.productImageradius),
              )),
          child: SizedBox(
              width: CustomSizes.iconsLg * 1.2,
              height: CustomSizes.iconsLg * 1.2,
              child: Center(
                  child: productQuantityInCart > 0
                      ? Text(
                          productQuantityInCart.toString(),
                          style: const TextStyle(fontSize: 16),
                        )
                      : const Icon(Iconsax.add, color: Colors.white))),
        );
      }),
    );
  }
}
