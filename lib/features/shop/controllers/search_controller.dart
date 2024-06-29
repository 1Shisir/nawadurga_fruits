// lib/controllers/search_controller.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:navadurga_fruits/utils/popups/loader.dart';
import '../models/product_model.dart';

class CustomSearchController extends GetxController {
  static CustomSearchController get instance => Get.find();
  var products = <ProductModel>[].obs;
  var isLoading = false.obs;

  void searchProducts(String query) async {
    if (query.isEmpty) {
      products.value = [];
      return;
    }
    isLoading.value = true;
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('Products')
          .where('Name', isGreaterThanOrEqualTo: query)
          .where('Name', isLessThanOrEqualTo: '$query\uf8ff')
          .get();

      products.value =
          snapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
    } catch (e) {
      Loader.errorSnackBar(title: 'Oh Snap', message: e.toString());
      products.value = [];
    } finally {
      isLoading.value = false;
    }
  }
}
