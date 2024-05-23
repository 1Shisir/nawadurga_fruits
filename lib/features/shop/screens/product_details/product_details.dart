import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:navadurga_fruits/common/widgets/texts/price_title_text.dart';
import 'package:navadurga_fruits/common/widgets/texts/product_title_text.dart';
import 'package:navadurga_fruits/features/shop/models/product_model.dart';
import 'package:navadurga_fruits/features/shop/screens/checkout/checkout.dart';
import 'package:navadurga_fruits/features/shop/screens/product_details/widget/product_detail_image.dart';
import 'package:readmore/readmore.dart';

import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/consts/sizes.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //bottomNavigationBar: BottomAddToCart(
      //product: product,
      //),
      body: SingleChildScrollView(
        child: Column(children: [
          //image
          CustomProductImage(
            product: product,
          ),

          //Product Details

          Padding(
            padding: const EdgeInsets.only(
                left: CustomSizes.defaultSpace,
                right: CustomSizes.defaultSpace,
                bottom: CustomSizes.defaultSpace),
            child: Column(
              children: [
                const SizedBox(height: CustomSizes.spaceBtwnItems),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //title
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ProductTitleText(title: product.name, maxlines: 1),
                      ],
                    ),
                    const SizedBox(height: CustomSizes.spaceBtwnItems),
                    //price
                    ProductPriceText(price: product.price.toString()),
                  ],
                ),

                const SizedBox(height: CustomSizes.spaceBtwnItems),

                //Checkout button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => Get.to(() => const CheckoutScreen()),
                      child: const Text('Checkout')),
                ),
                const SizedBox(height: CustomSizes.spaceBtwnSections),

                //Description

                const CustomSectionHeading(
                    showActionButton: false, title: 'Description'),
                const SizedBox(height: CustomSizes.spaceBtwnItems),
                ReadMoreText(
                  product.description ?? '',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: '  Show more',
                  trimExpandedText: '  Less',
                  moreStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w800),
                  lessStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w800),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
