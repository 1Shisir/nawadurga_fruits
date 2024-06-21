import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../features/shop/controllers/cart_controller.dart';
import '../../../features/shop/models/product_model.dart';
import '../../../utils/consts/sizes.dart';
import '../icons/circular_icon.dart';

class BottomAddToCart extends StatelessWidget {
  const BottomAddToCart({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    cartController.updateAlreadyAddedProductCount(product);

    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: CustomSizes.defaultSpace,
          vertical: CustomSizes.defaultSpace / 2),
      decoration: const BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(CustomSizes.cardRadiusLg),
          topRight: Radius.circular(CustomSizes.cardRadiusLg),
        ),
      ),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircularIcon(
                  iCon: Iconsax.minus,
                  backgroundColor: const Color.fromARGB(255, 245, 243, 243),
                  width: 40,
                  height: 40,
                  color: Colors.white,
                  onPressed: () =>
                      cartController.productQuantityInCart.value < 1
                          ? null
                          : cartController.productQuantityInCart.value -= 1,
                ),
                const SizedBox(
                  width: CustomSizes.spaceBtwnItems,
                ),
                Text(cartController.productQuantityInCart.value.toString(),
                    style: Theme.of(context).textTheme.titleSmall),
                const SizedBox(width: CustomSizes.spaceBtwnItems),
                CircularIcon(
                    iCon: Iconsax.add,
                    backgroundColor: Colors.black,
                    width: 40,
                    height: 40,
                    onPressed: () =>
                        cartController.productQuantityInCart.value += 1,
                    color: Colors.white),
              ],
            ),
            ElevatedButton(
                onPressed: cartController.productQuantityInCart.value < 1
                    ? null
                    : () => cartController.addToCart(product),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(CustomSizes.md),
                  backgroundColor: Colors.black,
                  side: const BorderSide(color: Colors.black),
                ),
                child: const Text(
                  'Add to cart',
                  style: TextStyle(color: Colors.white),
                )),
          ],
        ),
      ),
    );
  }
}
