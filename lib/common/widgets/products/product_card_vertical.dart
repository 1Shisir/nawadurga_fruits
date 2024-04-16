import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:navadurga_fruits/features/shop/product_details/product_details.dart';
import '../../../utils/consts/sizes.dart';
import '../../styles/shadows_style.dart';
import '../custom_shapes/containers/circular_container.dart';
import '../images/rounded_image.dart';
import '../texts/price_title_text.dart';
import '../texts/product_title_text.dart';

class CustomProductCardVertical extends StatelessWidget {
  const CustomProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => const ProductDetail()),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [CustomShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(CustomSizes.productImageradius),
          color: Colors.white,
        ),
        child: Column(children: [
          const CustomCircularContainer(
            height: 180,
            radius: 16,
            padding: EdgeInsets.all(CustomSizes.sm),
            backgroundColor: Color.fromARGB(255, 179, 239, 182),
            showBorder: false,
            child: Stack(
              children: [
                CustomRoundedImage(
                  imageUrl:
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2HBdnzEwiLu9EZonMRGtc4PoRlKmXpU2QnA&s',
                  appplyImageRadius: true,
                  isNetworkImage: true,
                  borderRadius: CustomSizes.md,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),

          const SizedBox(
            height: CustomSizes.spaceBtwnItems / 2,
          ),

          //DEtails

          const Padding(
            padding: EdgeInsets.only(left: CustomSizes.sm),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductTitleText(
                    title: 'Grocery',
                    smallSize: true,
                    maxlines: 2,
                  ),
                  SizedBox(
                    height: CustomSizes.spaceBtwnItems / 2,
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: CustomSizes.sm),
                child: ProductPriceText(
                  price: '35.5',
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                    color: Color(0xFF00A368),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(CustomSizes.cardRadiusMd),
                      bottomRight:
                          Radius.circular(CustomSizes.productImageradius),
                    )),
                child: const SizedBox(
                    width: CustomSizes.iconsLg * 1.2,
                    height: CustomSizes.iconsLg * 1.2,
                    child: Center(child: Icon(Icons.add, color: Colors.white))),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
