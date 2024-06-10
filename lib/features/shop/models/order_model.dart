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
  final DateTime deliveryDate;
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

  // String get orderStatusText {
  //   switch (status) {
  //     case OrderStatus.delivered:
  //       return 'Delivered';
  //     case OrderStatus.pending:
  //       return 'Pending';
  //     case OrderStatus.processing:
  //       return 'Processing';
  //     default:
  //       return 'Unknown';
  //   }
  // }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'status': status.value,
      'totalAmount': totalAmount,
      'orderDate': orderDate,
      'paymentMethod': paymentMethod,
      'address': address?.toJson(),
      'deliveryDate': deliveryDate.millisecondsSinceEpoch,
      'items': items.map((item) => item.toJson()).toList(),
    };
  }

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      totalAmount: double.parse(json['totalAmount'].toString()),
      address: AddressModel.fromMap(json['address']),
      paymentMethod: json['paymentMethod'],
      id: json['id'],
      deliveryDate: DateTime.fromMillisecondsSinceEpoch(json['deliveryDate']),
      orderDate: DateTime.fromMillisecondsSinceEpoch(json['orderDate']),
      items: (json['items'] as List)
          .map((item) => CartItemModel.fromJson(item))
          .toList(),
      userId: json['userId'],
      status: json['status'],
    );
  }

  // factory OrderModel.fromSnapshot(DocumentSnapshot snapshot) {
  //   final data = snapshot.data() as Map<String, dynamic>;
  //   return OrderModel(
  //     id: data['id'] as String? ?? '1234',
  //     userId: data['userId'] as String? ?? 'abcd',
  //     status: data['status'] != null
  //         ? OrderStatus.values.firstWhere(
  //             (e) => e.toString().split('.').last == data['status'],
  //             orElse: () => OrderStatus.pending,
  //           )
  //         : OrderStatus.pending,
  //     totalAmount: (data['totalAmount'] != null && data['totalAmount'] is num)
  //         ? (data['totalAmount'] as num).toDouble()
  //         : 0.0,
  //     orderDate: data['orderDate'] != null
  //         ? (data['orderDate'] as Timestamp).toDate()
  //         : DateTime.now(),
  //     paymentMethod: data['paymentMethod'] as String? ?? 'Unknown',
  //     address: data['address'] != null
  //         ? AddressModel.fromMap(data['address'] as Map<String, dynamic>)
  //         : AddressModel.empty(), // Provide a default AddressModel if null
  //     deliveryDate: data['deliveryDate'] != null
  //         ? (data['deliveryDate'] as Timestamp).toDate()
  //         : null,
  //     items: data['items'] != null
  //         ? (data['items'] as List<dynamic>)
  //             .map((itemData) => CartItemModel.fromJson(itemData))
  //             .toList()
  //         : [], // Provide an empty list if null
  //   );
  // }

  String get formattedOrderDate {
    final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
    return formatter.format(orderDate);
  }

  String get formattedDeliveryDate {
    final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
    return formatter.format(deliveryDate);
  }
}
