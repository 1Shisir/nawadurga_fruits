import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:navadurga_fruits/common/widgets/products/product_card_vertical.dart';
import '../../../../features/shop/controllers/all_product_controller.dart';
import '../../../../features/shop/models/product_model.dart';
import '../../../../utils/consts/sizes.dart';
import '../../../layouts/grid_layout.dart';

class CustomSortableProducts extends StatelessWidget {
  const CustomSortableProducts({
    super.key,
    required this.products,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    final controller = AllProductsController.instance;
    controller.assignProducts(products);
    return Column(
      children: [
        //DropDown
        DropdownButtonFormField(
            decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
            value: controller.selectedSortOption.value,
            items: [
              'Name',
              'Higher Price',
              'Lower Price',
            ]
                .map((option) =>
                    DropdownMenuItem(value: option, child: Text(option)))
                .toList(),
            onChanged: (value) {
              //sort products based on selected value
              controller.sortProducts(value!);
            }),
        const SizedBox(
          height: CustomSizes.spaceBtwnSections,
        ),

        //products

        Obx(
          () => CustomGridLayout(
              itemCount: controller.products.length,
              itemBuilder: (_, index) => CustomProductCardVertical(
                  product: controller.products[index])),
        )
      ],
    );
  }
}
