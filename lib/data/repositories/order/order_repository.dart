import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
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

  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        throw 'User not authenticated.';
      }
      final userId = user.uid;

      if (userId.isEmpty) {
        throw 'Unable to find user information. Try again in a few minutes';
      }

      final result =
          await _db.collection('Users').doc(userId).collection('Orders').get();
      debugPrint('Fetched documents: ${result.docs.length}');
      return result.docs.map((documentSnapshot) {
        try {
          debugPrint('Document snapshot: ${documentSnapshot.data()}');
          return OrderModel.fromJson(documentSnapshot as Map<String, dynamic>);
        } catch (e) {
          debugPrint('Error parsing order document: $e');
          throw 'Error parsing order document: $e';
        }
      }).toList();
    } catch (e) {
      debugPrint('Error fetching user orders: $e');
      throw 'Something went wrong. Try again later.';
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
