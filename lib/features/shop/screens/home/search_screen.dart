import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:navadurga_fruits/common/layouts/grid_layout.dart';
import 'package:navadurga_fruits/common/widgets/products/product_card_vertical.dart';
import 'package:navadurga_fruits/features/shop/controllers/search_controller.dart';
import 'package:navadurga_fruits/utils/consts/sizes.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = Get.put(CustomSearchController());
    return Scaffold(
        appBar: AppBar(
          title: CupertinoSearchTextField(
            backgroundColor: Colors.white,
            onChanged: (value) {
              searchController.searchProducts(value);
            },
          ),
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(CustomSizes.defaultSpace),
            child: Obx(() {
              if (searchController.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }
              if (searchController.products.isEmpty) {
                return const Center(child: Text('No products found'));
              }
              return CustomGridLayout(
                itemCount: searchController.products.length,
                itemBuilder: (_, index) => CustomProductCardVertical(
                    product: searchController.products[index]),
              );
            }),
          ),
        ));
  }
}
