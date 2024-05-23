import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../data/repositories/product/product_repository.dart';
import '../../../utils/popups/loader.dart';
import '../models/product_model.dart';

class AllProductsController extends GetxController {
  static AllProductsController get instance => Get.find();

  final repository = ProductRepository.instance;
  final RxString selectedSortOption = 'Name'.obs;
  final RxList<ProductModel> products = <ProductModel>[].obs;

  //fetch products by query
  Future<List<ProductModel>> fetchProductByQuery(Query? query) async {
    try {
      if (query == null) {
        return [];
      }

      final products = await repository.fetchProductByQuery(query);

      return products;
    } catch (e) {
      Loader.errorSnackBar(title: 'Oh snap!', message: e.toString());
      return [];
    }
  }

  void sortProducts(String sortOption) {
    selectedSortOption.value = sortOption;

    switch (sortOption) {
      case 'Name':
        products.sort(((a, b) => a.name.compareTo(b.name)));
        break;
      case 'Higher Price':
        products.sort(((a, b) => b.price.compareTo(a.price)));
        break;
      case 'Lower Price':
        products.sort(((a, b) => a.price.compareTo(b.price)));
        break;
      case 'By time':
        products.sort(((a, b) => a.date!.compareTo(b.date!)));
        break;

      default:
        products.sort(((a, b) => a.name.compareTo(b.name)));
    }
  }

  void assignProducts(List<ProductModel> products) {
    //assign products to the "products" list
    this.products.assignAll(products);
    sortProducts('Name');
  }
}
