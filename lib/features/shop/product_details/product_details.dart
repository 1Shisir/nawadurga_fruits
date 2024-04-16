import 'package:flutter/material.dart';
import 'package:navadurga_fruits/common/widgets/texts/price_title_text.dart';
import 'package:navadurga_fruits/common/widgets/texts/product_title_text.dart';
import 'package:navadurga_fruits/features/shop/product_details/widget/product_detail_image.dart';
import 'package:readmore/readmore.dart';

import '../../../common/widgets/texts/section_heading.dart';
import '../../../utils/consts/sizes.dart';
import 'widget/product_add_to_cart_widget.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(children: [
          //image
          const CustomProductImage(),

          //Product Details

          Padding(
            padding: const EdgeInsets.only(
                left: CustomSizes.defaultSpace,
                right: CustomSizes.defaultSpace,
                bottom: CustomSizes.defaultSpace),
            child: Column(
              children: [
                const SizedBox(height: CustomSizes.spaceBtwnItems),

                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //title
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ProductTitleText(title: 'Fresh apples ', maxlines: 1),
                      ],
                    ),
                    SizedBox(height: CustomSizes.spaceBtwnItems),
                    //price
                    ProductPriceText(price: '35'),
                  ],
                ),

                const SizedBox(height: CustomSizes.spaceBtwnItems),

                //Checkout button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {}, child: const Text('Checkout')),
                ),
                const SizedBox(height: CustomSizes.spaceBtwnSections),

                //Description

                const CustomSectionHeading(
                    showActionButton: false, title: 'Description'),
                const SizedBox(height: CustomSizes.spaceBtwnItems),
                const ReadMoreText(
                  'This is the description of the product.This contains show more and show less properties which is very useful if the description is too lengthy!',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: '  Show more',
                  trimExpandedText: '  Less',
                  moreStyle:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                  lessStyle:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
