import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:navadurga_fruits/common/widgets/cart/cart_menu_icon.dart';
import 'package:navadurga_fruits/features/shop/controllers/images_controller.dart';
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
    final controller = Get.put(ImageController());
    final images = controller.getAllProductImage(product);
    return CustomCurvedEdgesWidget(
      child: Container(
          color: const Color.fromARGB(
              255, 196, 232, 197), //Color.fromARGB(179, 97, 96, 96),
          child: Stack(
            children: [
              SizedBox(
                  height: 400,
                  child: Padding(
                    padding: const EdgeInsets.all(
                        CustomSizes.productImageradius * 2),
                    child: Center(child: Obx(() {
                      final image = controller.selectedProductImage.value;
                      return GestureDetector(
                        onTap: () => controller.showEnlargedImage(image),
                        child: CachedNetworkImage(
                          imageUrl: image,
                          progressIndicatorBuilder: (_, __, downloadProgress) =>
                              CircularProgressIndicator(
                            value: downloadProgress.progress,
                            color: Colors.green,
                          ),
                        ),
                      );
                    })),
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
                    itemCount: images.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (_, index) => Obx(() {
                      final imageSelected =
                          controller.selectedProductImage.value ==
                              images[index];
                      return CustomRoundedImage(
                        backgroundColor: Colors.white,
                        border: Border.all(
                            color: imageSelected
                                ? Colors.green
                                : Colors.transparent),
                        padding: const EdgeInsets.all(CustomSizes.sm),
                        imageUrl: images[index],
                        appplyImageRadius: true,
                        isNetworkImage: true,
                        borderRadius: CustomSizes.md,
                        width: 80,
                        onPressed: () => controller.selectedProductImage.value =
                            images[index],
                      );
                    }),
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
