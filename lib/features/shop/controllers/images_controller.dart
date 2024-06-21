import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:navadurga_fruits/features/shop/models/product_model.dart';

import '../../../utils/consts/sizes.dart';

class ImageController extends GetxController {
  static ImageController get instance => Get.find();

  //variables
  RxString selectedProductImage = ''.obs;

  //get all images from product and variation
  List<String> getAllProductImage(ProductModel product) {
    //use set to add unique images only
    Set<String> images = {};

    //load thumnail as selected image
    images.add(product.image);

    //assign thumbnail as selected image
    selectedProductImage.value = product.image;

    //Get all images from the product model if not null
    if (product.images != null) {
      images.addAll(product.images!);
    }

    return images.toList();
  }

  //show image popup
  void showEnlargedImage(String image) {
    Get.to(
        fullscreenDialog: true,
        () => Dialog.fullscreen(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: CustomSizes.defaultSpace * 2,
                          horizontal: CustomSizes.defaultSpace),
                      child: CachedNetworkImage(imageUrl: image),
                    ),
                    const SizedBox(
                      height: CustomSizes.spaceBtwnSections,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        width: 150,
                        child: OutlinedButton(
                            onPressed: () => Get.back(),
                            child: const Text('Close')),
                      ),
                    )
                  ],
                ),
              ),
            ));
  }
}
