import 'package:flutter/material.dart';

import '../../../../../utils/consts/sizes.dart';
import '../../../controllers/cart_controller.dart';

class CustomAmountSection extends StatelessWidget {
  const CustomAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final subTotal = cartController.totalCartPrice.value;

    return Column(
      children: [
        //sub total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Total',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              'Rs.$subTotal',
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),
        const SizedBox(
          height: CustomSizes.spaceBtwnItems / 2,
        ),
      ],
    );
  }
}
