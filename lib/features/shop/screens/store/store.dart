import 'package:flutter/material.dart';
import 'package:navadurga_fruits/common/widgets/appbar/appbar.dart';
import 'package:navadurga_fruits/common/widgets/cart/cart_menu_icon.dart';
import 'package:navadurga_fruits/features/shop/controllers/product_controller.dart';
import 'package:navadurga_fruits/utils/consts/sizes.dart';

import '../../../../common/layouts/grid_layout.dart';
import '../../../../common/widgets/products/product_card_vertical.dart';
import '../../../../common/widgets/texts/section_heading.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    return SafeArea(
        child: Scaffold(
      appBar: const CustomAppBar(
        title: Text(
          'Store',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        showbackArrow: false,
        actions: [CustomCartCounterIcon()],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CustomSizes.defaultSpace),
          child: Column(
            children: [
              const CustomSectionHeading(
                showActionButton: false,
                title: 'Featured Products',
              ),
              const SizedBox(height: CustomSizes.spaceBtwnSections),

              //products
              CustomGridLayout(
                  itemCount: controller.featuredProducts.length,
                  itemBuilder: (_, index) => CustomProductCardVertical(
                        product: controller.featuredProducts[index],
                      )),
            ],
          ),
        ),
      ),
    ));
  }
}
