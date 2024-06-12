import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:navadurga_fruits/data/repositories/authentication/authentication_repository.dart';
import '../../../features/shop/models/order_model.dart';

class OrderRepository extends GetxController {
  static OrderRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  //Get all order related to current user
  // Future<List<OrderModel>> fetchUserOrders() async {
  //   try {
  //     final user = FirebaseAuth.instance.currentUser;
  //     if (user == null) {
  //       throw 'User not authenticated.';
  //     }
  //     final userId = user.uid;

  //     if (userId.isEmpty) {
  //       throw 'Unable to find user information. Try again in few minutes';
  //     }
  //     final result =
  //         await _db.collection('Users').doc(userId).collection('Orders').get();
  //     return result.docs
  //         .map((documentSnapshot) => OrderModel.fromSnapshot(documentSnapshot))
  //         .toList();
  //   } catch (e) {
  //     // print('Error:$e');
  //     //throw 'Something went wrong .Try again later.';
  //     throw '$e';
  //   }
  // }

  // Future<List<OrderModel>> fetchUserOrders() async {
  //   try {
  //     final user = FirebaseAuth.instance.currentUser;
  //     if (user == null) {
  //       throw 'User not authenticated.';
  //     }
  //     final userId = user.uid;

  //     if (userId.isEmpty) {
  //       throw 'Unable to find user information. Try again in a few minutes';
  //     }

  //     final result = await _db
  //         .collection('Orders')
  //         .where('userId', isEqualTo: userId)
  //         .get();
  //     debugPrint('Fetched documents: ${result.docs.length}');
  //     return result.docs.map((documentSnapshot) {
  //       try {
  //         debugPrint('Document snapshot: ${documentSnapshot.data()}');
  //         return OrderModel.fromSnapshot(documentSnapshot);
  //       } catch (e) {
  //         debugPrint('Error parsing order document: $e');
  //         throw 'Error parsing order document: $e';
  //       }
  //     }).toList();
  //   } catch (e) {
  //     debugPrint('Error fetching user orders: $e');
  //     throw '$e';
  //   }
  // }

  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final userId = AuthenticationRepository.instance.authUser.uid;
      if (userId.isEmpty) {
        throw 'Unable to find the user Information.Try again later';
      }
      final result = await _db
          .collection('Orders')
          .where('userId', isEqualTo: userId)
          .get();
      return result.docs
          .map((snapshot) => OrderModel.fromSnapshot(snapshot))
          .toList();
    } catch (e) {
      throw '$e';
    }
  }

  //store new user order
  Future<void> saveOrder(OrderModel order) async {
    try {
      await _db.collection('Orders').add(order.toJson());
    } catch (e) {
      throw 'Something went wrong.Please try again later';
    }
  }
}
