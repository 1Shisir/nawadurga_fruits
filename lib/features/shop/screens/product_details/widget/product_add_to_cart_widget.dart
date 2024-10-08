import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:navadurga_fruits/features/shop/models/product_model.dart';
import '../../../../../common/widgets/icons/circular_icon.dart';
import '../../../../../utils/consts/sizes.dart';
import '../../../controllers/cart_controller.dart';

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
                  iCon: Icons.remove,
                  backgroundColor: Colors.grey,
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
                  iCon: Icons.add,
                  backgroundColor: Colors.green,
                  width: 40,
                  height: 40,
                  color: Colors.white,
                  onPressed: () =>
                      cartController.productQuantityInCart.value += 1,
                ),
              ],
            ),
            ElevatedButton(
                onPressed: () => cartController.productQuantityInCart.value < 1
                    ? null
                    : () => cartController.addToCart(product),
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(CustomSizes.md),
                    backgroundColor: const Color(0xFF00A368),
                    side: const BorderSide(
                      color: Color(0xFF00A368),
                    )),
                child: const Text('Add to cart')),
          ],
        ),
      ),
    );
  }
}
