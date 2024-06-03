import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../../features/shop/models/order_model.dart';

class OrderRepository extends GetxController {
  static OrderRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  //Get all order related to current user
  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        throw 'User not authenticated.';
      }
      final userId = user.uid;

      if (userId.isEmpty) {
        throw 'Unable to find user information. Try again in few minutes';
      }
      final result =
          await _db.collection('Users').doc(userId).collection('Orders').get();

      if (result.docs.isEmpty) {
        //print('No orders found for user: $userId');
      }
      // print('Result:$result');
      return result.docs
          .map((documentSnapshot) => OrderModel.fromSnapshot(documentSnapshot))
          .toList();
    } catch (e) {
      // print('Error:$e');
      throw 'Something went wrong .Try again later.';
    }
  }

  //store new user order
  Future<void> saveOrder(OrderModel order, String userId) async {
    try {
      await _db
          .collection('Users')
          .doc(userId)
          .collection('Orders')
          .add(order.toJson());
    } catch (e) {
      throw 'Something went wrong.Please try again later';
    }
  }
}
