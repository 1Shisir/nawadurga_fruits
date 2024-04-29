import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:navadurga_fruits/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:navadurga_fruits/common/widgets/texts/section_heading.dart';
import 'package:navadurga_fruits/features/shop/controllers/product_controller.dart';
import '../../../../common/layouts/grid_layout.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/products/product_card_vertical.dart';
import '../../../../utils/consts/sizes.dart';
import 'widgets/home_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
      const PrimaryHeaderContainer(
          child: Column(children: [
        //appbar
        CustomHomeAppBar(),
        SizedBox(height: CustomSizes.spaceBtwnSections),

        //search bar
        CustomSearchContainer(
          showBackground: true,
          showBorder: true,
          text: 'Search',
          icon: Icons.search,
        ),
        SizedBox(height: CustomSizes.spaceBtwnSections),
      ])),
      Padding(
        padding: const EdgeInsets.all(CustomSizes.defaultSpace),
        child: Column(
          children: [
            const CustomSectionHeading(
              showActionButton: false,
              title: 'Featured Products',
            ),
            const SizedBox(height: CustomSizes.spaceBtwnSections),

            //products
            Obx(() {
              if (controller.isLoading.value) {
                return const VerticalProductShimmer();
              }

              if (controller.featuredProducts.isEmpty) {
                return Center(
                  child: Text(
                    'No Data Found',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                );
              }
              return CustomGridLayout(
                  itemCount: controller.featuredProducts.length,
                  itemBuilder: (_, index) => CustomProductCardVertical(
                      product: controller.featuredProducts[index]));
            }),
          ],
        ),
      )
    ])));
  }
}
