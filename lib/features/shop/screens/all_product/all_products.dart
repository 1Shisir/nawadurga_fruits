import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/products/sortable_product/sortable_products.dart';
import '../../../../common/widgets/shimmer/vertical_product_shimmer.dart';
import '../../../../utils/consts/sizes.dart';
import '../../../../utils/helpers/cloud_helper_functions.dart';
import '../../controllers/all_product_controller.dart';
import '../../models/product_model.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen(
      {super.key, required this.title, this.query, this.futureMethod});

  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(title),
        showbackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CustomSizes.defaultSpace),
          child: FutureBuilder(
              future: futureMethod ?? controller.fetchProductByQuery(query),
              builder: (context, snapshot) {
                const loader = VerticalProductShimmer();
                final widget = CloudHelperFunctions.checkMultiplerecordState(
                    snapshot: snapshot, loader: loader);

                //return appropriate widget based on snapshot state
                if (widget != null) return widget;

                //products found!
                final products = snapshot.data!;

                return CustomSortableProducts(
                  products: products,
                );
              }),
        ),
      ),
    );
  }
}
