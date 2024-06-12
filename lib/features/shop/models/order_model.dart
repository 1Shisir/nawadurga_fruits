import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

import '../../../utils/consts/enums.dart';
import '../../personalization/models/address_model.dart';
import 'cart_item_model.dart';

class OrderModel {
  final String id;
  final String userId;
  final OrderStatus status;
  final double totalAmount;
  final DateTime orderDate;
  final String paymentMethod;
  final AddressModel? address;
  final DateTime? deliveryDate;
  final List<CartItemModel> items;

  OrderModel({
    required this.id,
    required this.userId,
    required this.status,
    required this.totalAmount,
    required this.orderDate,
    this.paymentMethod = 'Cash on Delivery',
    this.address,
    required this.items,
    required this.deliveryDate,
  });

  String get orderStatusText {
    switch (status) {
      case OrderStatus.delivered:
        return 'Delivered';
      case OrderStatus.pending:
        return 'Pending';
      case OrderStatus.processing:
        return 'Processing';
      default:
        return 'Unknown';
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'status': status.toString(),
      'totalAmount': totalAmount,
      'orderDate': DateTime.now(),
      'paymentMethod': paymentMethod,
      'address': address?.toJson(),
      'deliveryDate': orderDate.add(const Duration(days: 2)),
      'items': items.map((item) => item.toJson()).toList(),
    };
  }

  // factory OrderModel.fromJson(Map<String, dynamic> json) {
  //   return OrderModel(
  //     totalAmount: double.parse(json['totalAmount'].toString()),
  //     address: AddressModel.fromMap(json['address']),
  //     paymentMethod: json['paymentMethod'],
  //     id: json['id'],
  //     deliveryDate: DateTime.parse(json['deliveryDate']),
  //     orderDate: DateTime.parse(json['orderDate']),
  //     items: (json['items'] as List)
  //         .map((item) => CartItemModel.fromJson(item))
  //         .toList(),
  //     userId: json['userId'],
  //     status: json['status'],
  //   );
  // }

  factory OrderModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return OrderModel(
      id: data['id'] as String,
      userId: data['userId'] as String,
      status: OrderStatus.pending,
      totalAmount: double.parse(data['totalAmount'].toString()),
      orderDate: (data['orderDate'] as Timestamp).toDate(),
      paymentMethod: data['paymentMethod'] as String,
      address: AddressModel.fromMap(data['address'] as Map<String, dynamic>),
      deliveryDate: (data['deliveryDate'] as Timestamp).toDate(),
      items: (data['items'] as List)
          .map((itemData) =>
              CartItemModel.fromJson(itemData as Map<String, dynamic>))
          .toList(),
    );
  }

  String get formattedOrderDate {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(orderDate);
  }

  String get formattedDeliveryDate {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(deliveryDate!);
  }
}
