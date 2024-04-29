import 'package:flutter/material.dart';
import 'package:navadurga_fruits/common/widgets/cart/cart_menu_icon.dart';
import '../../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../../common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import '../../../../../common/widgets/images/rounded_image.dart';
import '../../../../../utils/consts/sizes.dart';
import '../../../models/product_model.dart';

class CustomProductImage extends StatelessWidget {
  const CustomProductImage({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return CustomCurvedEdgesWidget(
      child: Container(
          color: const Color.fromARGB(255, 118, 182, 120),
          child: Stack(
            children: [
              SizedBox(
                  height: 400,
                  child: Padding(
                    padding: const EdgeInsets.all(
                        CustomSizes.productImageradius * 2),
                    child: Center(
                        child: Image(image: NetworkImage(product.image))),
                  )),
              //image slider
              Positioned(
                right: 0,
                bottom: 30,
                left: CustomSizes.defaultSpace / 2,
                child: SizedBox(
                  height: 80,
                  child: ListView.separated(
                    separatorBuilder: (_, __) => const SizedBox(
                      width: CustomSizes.spaceBtwnItems,
                    ),
                    itemCount: 6,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (_, index) => CustomRoundedImage(
                      backgroundColor: Colors.white,
                      border: Border.all(color: Colors.green),
                      padding: const EdgeInsets.all(CustomSizes.sm),
                      imageUrl: product.image,
                      appplyImageRadius: true,
                      isNetworkImage: true,
                      borderRadius: CustomSizes.md,
                      width: 80,
                    ),
                  ),
                ),
              ),

              //appbar icons
              const CustomAppBar(
                  showbackArrow: true, actions: [CustomCartCounterIcon()])
            ],
          )),
    );
  }
}
