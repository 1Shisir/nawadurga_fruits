import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:navadurga_fruits/data/repositories/authentication/authentication_repository.dart';
import 'package:navadurga_fruits/features/shop/models/cart_item_model.dart';
import 'package:navadurga_fruits/features/shop/models/product_model.dart';
import 'package:navadurga_fruits/utils/popups/loader.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  //variables
  RxInt noOfCartItems = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxInt productQuantityInCart = 0.obs;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;
  final _db = FirebaseFirestore.instance;

  // CartController() {
  //   loadCartItems();
  // }

  @override
  void onInit() {
    super.onInit();
    loadCartItems();
  }

  //add items in cart
  void addToCart(ProductModel product) {
    try {
      //Quantity check
      if (productQuantityInCart.value < 1) {
        Loader.customToast(message: 'Select Quantity');
        return;
      }
      //call the below function
      final selectedCartItem =
          convertToCartItem(product, productQuantityInCart.value);

      //check if already added in cart
      int index = cartItems.indexWhere(
          (cartItem) => cartItem.productId == selectedCartItem.productId);

      if (index >= 0) {
        //this quantity is already added or removed from the cart
        cartItems[index].quantity = selectedCartItem.quantity;
      } else {
        cartItems.add(selectedCartItem);
      }

      updateCart();

      Loader.customToast(message: 'Your product has been added to the cart');
    } catch (e) {
      Loader.errorSnackBar(title: 'Oh snap', message: e.toString());
    }
  }

  ///function to convert a product model to cartItemModel
  CartItemModel convertToCartItem(ProductModel product, int quantity) {
    final price = product.price;

    return CartItemModel(
      productId: product.id!,
      quantity: quantity,
      title: product.name,
      price: price,
      image: product.image,
    );
  }

  void addOneToCart(CartItemModel item) {
    int index = cartItems
        .indexWhere((cartItem) => cartItem.productId == item.productId);
    if (index >= 0) {
      cartItems[index].quantity += 1;
    } else {
      cartItems.add(item);
    }

    updateCart();
  }

  void removeOneFromCart(CartItemModel item) {
    int index = cartItems
        .indexWhere((cartItem) => cartItem.productId == item.productId);
    if (index >= 0) {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity -= 1;
      } else {
        //show dialog before completely removing
        cartItems[index].quantity == 1
            ? removeFromCartDialog(index)
            : cartItems.removeAt(index);
      }
      updateCart();
    }
  }

  void removeFromCartDialog(int index) {
    Get.defaultDialog(
      title: 'Remove Product',
      middleText: 'Are you sure want to remove this product?',
      onConfirm: () {
        //remove the item fro cart
        cartItems.removeAt(index);
        updateCart();
        Loader.customToast(message: 'Product removed from the cart.');
        Get.back();
      },
      onCancel: () => () => Get.back(),
    );
  }

  //update cart values
  void updateCart() {
    updateCartTotals();
    saveCartItemsToUserCollection();
    cartItems.refresh();
  }

  void updateCartTotals() {
    double calculatedTotalprice = 0.0;
    int calculateNoOfItems = 0;

    for (var item in cartItems) {
      calculatedTotalprice += (item.price) * item.quantity.toDouble();
      calculateNoOfItems += item.quantity;
    }

    totalCartPrice.value = calculatedTotalprice;
    noOfCartItems.value = calculateNoOfItems;
  }

  // Save cart items to Firestore
  Future<void> saveCartItemsToUserCollection() async {
    try {
      final userId = AuthenticationRepository.instance.authUser.uid;

      if (userId.isEmpty) {
        throw 'Unable to find user information. Try again in a few minutes.';
      }

      final userCartCollection =
          _db.collection('Users').doc(userId).collection('Carts');

      // Clear existing cart items in Firestore
      final existingCartItemsSnapshot = await userCartCollection.get();
      for (var doc in existingCartItemsSnapshot.docs) {
        await doc.reference.delete();
      }

      // Add updated cart items to Firestore
      for (var item in cartItems) {
        await userCartCollection.add(item.toJson());
      }

      Loader.customToast(message: 'Cart saved successfully');
    } catch (e) {
      Loader.errorSnackBar(title: 'Oh snap', message: e.toString());
    }
  }

  // Future<List<CartItemModel>> loadCartItems() async {
  //   try {
  //     final userId = AuthenticationRepository.instance.authUser.uid;

  //     if (userId.isEmpty) {
  //       throw 'Unable to find user information.Try again in few minutes';
  //     }
  //     final result =
  //         await _db.collection('Users').doc(userId).collection('Carts').get();
  //     // print('Result:$result');
  //     return result.docs
  //         .map((documentSnapshot) => CartItemModel.fromJson(documentSnapshot))
  //         .toList();
  //   } catch (e) {
  //     // print('Error:$e');
  //     throw 'Something went wrong .Try again later.';
  //   }
  // }
  Future<void> loadCartItems() async {
    try {
      final userId = AuthenticationRepository.instance.authUser.uid;

      if (userId.isEmpty) {
        throw 'Unable to find user information. Try again in few minutes';
      }

      final result =
          await _db.collection('Users').doc(userId).collection('Carts').get();

      // Clear the existing items
      cartItems.clear();

      // Add the fetched items to the cartItems list
      cartItems.addAll(
        result.docs
            .map((documentSnapshot) => CartItemModel.fromJson(
                documentSnapshot as Map<String, dynamic>))
            .toList(),
      );

      // Update cart totals
      updateCartTotals();

      // Refresh cart items observable list
      cartItems.refresh();
    } catch (e) {
      throw 'Something went wrong. Try again later.';
    }
  }

  int getProductQuantityInCart(String productId) {
    final foundItem = cartItems
        .where((item) => item.productId == productId)
        .fold(0, (previousValue, element) => previousValue + element.quantity);
    return foundItem;
  }

  int getVariationQuantityInCart(String productId) {
    final foundItem = cartItems.firstWhere(
      (item) => item.productId == productId,
      orElse: () => CartItemModel.empty(),
    );
    return foundItem.quantity;
  }

  //initialize already added items count in the cart
  void updateAlreadyAddedProductCount(ProductModel product) {
    productQuantityInCart.value = getProductQuantityInCart(product.id!);
  }

  void clearCart() {
    productQuantityInCart.value = 0;
    cartItems.clear();
    updateCart();
  }
}
