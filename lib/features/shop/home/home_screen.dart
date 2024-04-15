import 'package:flutter/material.dart';
import 'package:navadurga_fruits/common/widgets/texts/section_heading.dart';
import '../../../common/layouts/grid_layout.dart';
import '../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../common/widgets/products/product_card_vertical.dart';
import '../../../utils/consts/sizes.dart';
import 'widgets/home_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            CustomGridLayout(
                itemCount: 6,
                itemBuilder: (_, index) => const CustomProductCardVertical()),
          ],
        ),
      )
    ])));
  }
}
