import 'package:get/get.dart';
import 'package:navadurga_fruits/features/shop/models/product_model.dart';

import '../../../data/repositories/product/product_repository.dart';
import '../../../utils/popups/loader.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;
  final isLoading = false.obs;
  final productRepository = Get.put(ProductRepository());

  @override
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();
  }

  void fetchFeaturedProducts() async {
    try {
      //show loader while loading products
      isLoading.value = true;

      //fetch products
      final products = await productRepository.getFeaturedProducts();

      //assign products
      featuredProducts.assignAll(products);
    } catch (e) {
      Loader.errorSnackBar(title: 'Oh snap', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  //get all featured products
  Future<List<ProductModel>> fetchAllFeaturedProducts() async {
    try {
      //fetch products
      final products = await productRepository.getAllFeaturedProducts();
      return products;
    } catch (e) {
      Loader.errorSnackBar(title: 'Oh snap', message: e.toString());
      return [];
    }
  }
}
