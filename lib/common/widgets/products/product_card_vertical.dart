import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:navadurga_fruits/common/widgets/texts/product_description_text.dart';
import 'package:navadurga_fruits/features/shop/models/product_model.dart';
import 'package:navadurga_fruits/features/shop/screens/product_details/product_details.dart';
import '../../../utils/consts/sizes.dart';
import '../../styles/shadows_style.dart';
import '../cart/add_to_cart_button.dart';
import '../custom_shapes/containers/circular_container.dart';
import '../images/rounded_image.dart';
import '../texts/price_title_text.dart';
import '../texts/product_title_text.dart';

class CustomProductCardVertical extends StatelessWidget {
  const CustomProductCardVertical({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetail(
            product: product,
          )),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [CustomShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(CustomSizes.productImageradius),
          color: Colors.white,
        ),
        child: Column(children: [
          CustomCircularContainer(
            height: 180,
            width: 180,
            radius: 16,
            padding: const EdgeInsets.all(CustomSizes.sm),
            backgroundColor: const Color.fromARGB(255, 196, 232, 197),
            showBorder: false,
            child: Stack(
              children: [
                CustomRoundedImage(
                  imageUrl: product.image,
                  appplyImageRadius: true,
                  isNetworkImage: true,
                  borderRadius: CustomSizes.md,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),

          const SizedBox(
            height: CustomSizes.spaceBtwnItems / 2,
          ),

          //DEtails

          Padding(
            padding: const EdgeInsets.only(left: CustomSizes.sm),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductTitleText(
                    title: product.name,
                    smallSize: true,
                    maxlines: 1,
                  ),
                  const SizedBox(
                    height: CustomSizes.spaceBtwnItems / 2,
                  ),
                  ProductDescriptionText(
                      title: product.description ?? '', maxlines: 2),
                ],
              ),
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: CustomSizes.sm),
                child: ProductPriceText(
                  price: product.price.toString(),
                ),
              ),

              //add to cart
              ProductCartAddToCartButton(
                product: product,
              ),
            ],
          )
        ]),
      ),
    );
  }
}
