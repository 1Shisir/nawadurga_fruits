import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../../../features/shop/models/order_model.dart';
import '../authentication/authentication_repository.dart';

class OrderRepository extends GetxController {
  static OrderRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  //Get all order related to current user
  Future<List<OrderV2>> fetchUserOrders() async {
    try {
      final userId = AuthenticationRepository.instance.authUser.uid;
      if (userId.isEmpty) {
        throw 'Unable to find user information.Try again in few minutes';
      }
      final result =
          await _db.collection('Users').doc(userId).collection('Orders').get();
      print(result.docs.first.data());
      final res = result.docs
          .map((documentSnapshot) => OrderV2.fromJson(documentSnapshot.data()))
          .toList();
      print('==========PARSED================');
      print(res.first.address);
      return res;
    } catch (e) {
      print(e);
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




class OrderV2 {
  final double totalAmount;
  final AddressV2 address;
  final String paymentMethod;
  final String id;
  final DateTime deliveryDate;
  final DateTime orderDate;
  final List<ItemV2> items;
  final String userId;
  final OrderStatusV2 status;

  OrderV2({
    required this.totalAmount,
    required this.address,
    required this.paymentMethod,
    required this.id,
    required this.deliveryDate,
    required this.orderDate,
    required this.items,
    required this.userId,
    required this.status,
  });

  factory OrderV2.fromJson(Map<String, dynamic> json) {
    return OrderV2(
      totalAmount: double.parse(json['totalAmount'].toString()),
      address: AddressV2.fromJson(json['address']),
      paymentMethod: json['paymentMethod'],
      id: json['id'],
      deliveryDate: DateTime.fromMillisecondsSinceEpoch( json['deliveryDate']),
      orderDate: DateTime.fromMillisecondsSinceEpoch(json['orderDate']),
      items: (json['items'] as List).map((item) => ItemV2.fromJson(item)).toList(),
      userId: json['userId'],
      status: OrderStatusV2.pending,
    );
  }
  toJson() {
    return {
      'totalAmount': totalAmount,
      'address': address.toJson(),
      'paymentMethod': paymentMethod,
      'id': id,
      'deliveryDate': deliveryDate.millisecondsSinceEpoch,
      'orderDate': orderDate.millisecondsSinceEpoch,
      'items': items.map((item) => item.toJson()).toList(),
      'userId': userId,
      'status': status.value,
    };
  }
}

class AddressV2 {
  final String tole;
  final int state;
  final bool selectedAddress;
  final String phoneNumber;
  final String country;
  final String city;
  final int wardNo;
  final DateTime dateTime;
  final String name;

  AddressV2({
    required this.tole,
    required this.state,
    required this.selectedAddress,
    required this.phoneNumber,
    required this.country,
    required this.city,
    required this.wardNo,
    required this.dateTime,
    required this.name,
  });

  factory AddressV2.fromJson(Map<String, dynamic> json) {
    return AddressV2(
      tole: json['Tole'],
      state: int.parse(json['State'].toString()),
      selectedAddress: json['SelectedAddress'],
      phoneNumber: json['PhoneNumber'] as String,
      country: json['Country'],
      city: json['City'],
      wardNo: (int.parse(json['WardNo'].toString()) as num).toInt(),
      dateTime: DateTime.fromMillisecondsSinceEpoch(json['DateTime']),
      name: json['Name'],
    );
  }
  // toJson()

  toJson() {
    return {
      'Tole': tole,
      'State': state,
      'SelectedAddress': selectedAddress,
      'PhoneNumber': phoneNumber,
      'Country': country,
      'City': city,
      'WardNo': wardNo,
      'DateTime': dateTime.millisecondsSinceEpoch,
      'Name': name,
    };
  }
}

class ItemV2 {
  final String image;
  final int quantity;
  final String productId;
  final double price;
  final String title;

  ItemV2({
    required this.image,
    required this.quantity,
    required this.productId,
    required this.price,
    required this.title,
  });

  factory ItemV2.fromJson(Map<String, dynamic> json) {
    return ItemV2(
      image: json['image'],
      quantity: int.parse(json['quantity'].toString()),
      productId: json['productId'],
      price: double.parse(json['price'].toString()) ,
      title: json['title'],
    );
  }

  toJson() {
    return {
      'image': image,
      'quantity': quantity,
      'productId': productId,
      'price': price,
      'title': title,
    };
  }
}

enum OrderStatusV2 {
  pending,
  completed,
  cancelled,
}

extension OrderStatusV2Extension on OrderStatusV2 {
  String get value {
    switch (this) {
      case OrderStatusV2.pending:
        return 'pending';
      case OrderStatusV2.completed:
        return 'completed';
      case OrderStatusV2.cancelled:
        return 'cancelled';
    }
  }
  static OrderStatusV2 fromString(String status) {
    switch (status) {
      case 'pending':
        return OrderStatusV2.pending;
      case 'completed':
        return OrderStatusV2.completed;
      case 'cancelled':
        return OrderStatusV2.cancelled;
      default:
        throw Exception('Unknown order status: $status');
    }
  }


}

