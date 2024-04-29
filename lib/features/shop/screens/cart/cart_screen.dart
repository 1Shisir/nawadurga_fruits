import 'package:flutter/material.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/cart/add_remove_button.dart';
import '../../../../common/widgets/cart/cart_item.dart';
import '../../../../common/widgets/texts/price_title_text.dart';
import '../../../../utils/consts/sizes.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text('Cart',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        showbackArrow: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(CustomSizes.defaultSpace),
        child: ListView.separated(
          separatorBuilder: (_, __) => const SizedBox(
            height: CustomSizes.spaceBtwnItems,
          ),
          itemCount: 6,
          shrinkWrap: true,
          itemBuilder: (_, index) => const Column(
            children: [
              CartItem(),
              SizedBox(
                height: CustomSizes.spaceBtwnItems,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 64,
                      ),

                      ///Add and remove buttons
                      AddAndRemoveButton(),
                    ],
                  ),
                  ProductPriceText(price: '1500')
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
            onPressed: () {}, child: const Text('Checkout Rs.1500')),
      ),
    );
  }
}
