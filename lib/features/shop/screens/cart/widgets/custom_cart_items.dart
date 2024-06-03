import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:navadurga_fruits/common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../../common/widgets/cart/add_remove_button.dart';
import '../../../../../common/widgets/cart/cart_item.dart';
import '../../../../../common/widgets/texts/price_title_text.dart';
import '../../../../../utils/consts/sizes.dart';
import '../../../controllers/cart_controller.dart';

class CustomCartItems extends StatelessWidget {
  const CustomCartItems({
    super.key,
    this.showAddRemoveButtons = true,
    this.isOrder = false,
  });

  final bool showAddRemoveButtons;
  final bool isOrder;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;

    return Obx(
      () => ListView.separated(
        separatorBuilder: (_, __) => const SizedBox(
          height: CustomSizes.spaceBtwnItems,
        ),
        itemCount: cartController.cartItems.length,
        shrinkWrap: true,
        itemBuilder: (_, index) => Obx(() {
          final item = cartController.cartItems[index];

          return CustomCircularContainer(
            padding: const EdgeInsets.all(CustomSizes.defaultSpace / 2),
            backgroundColor: const Color.fromARGB(255, 196, 232, 197),
            showBorder: false,
            child: Column(
              children: [
                //cart item
                CartItem(
                  cartItem: item,
                ),

                if (showAddRemoveButtons)
                  const SizedBox(
                    height: CustomSizes.spaceBtwnItems,
                  ),
                if (showAddRemoveButtons)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const SizedBox(
                            width: 64,
                          ),

                          ///Add and remove buttons
                          AddAndRemoveButton(
                            quantity: item.quantity,
                            add: () => cartController.addOneToCart(item),
                            remove: () =>
                                cartController.removeOneFromCart(item),
                          ),
                        ],
                      ),
                      ProductPriceText(
                          price:
                              (item.price * item.quantity).toStringAsFixed(1)),
                    ],
                  ),
                if (isOrder)
                  Text(
                    '${item.quantity} kg',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  )
              ],
            ),
          );
        }),
      ),
    );
  }
}
