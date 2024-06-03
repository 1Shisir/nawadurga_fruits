import 'package:cloud_firestore/cloud_firestore.dart';
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
    this.userId = '',
    required this.status,
    required this.totalAmount,
    required this.orderDate,
    this.paymentMethod = 'Cash on Delivery',
    this.address,
    DateTime? deliveryDate,
    required this.items,
  }) : deliveryDate = deliveryDate ?? orderDate.add(const Duration(days: 2));

  // String get orderStatusText => status == OrderStatus.delivered
  //     ? 'Delivered'
  //     : status == OrderStatus.pending
  //         ? 'Pending'
  //         : 'Processing';

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
      'status': status.toString().split('.').last,
      'totalAmount': totalAmount,
      'orderDate': orderDate,
      'paymentMethod': paymentMethod,
      'address': address?.toJson(),
      'deliveryDate': deliveryDate,
      'items': items.map((item) => item.toJson()).toList(),
    };
  }

  // factory OrderModel.fromSnapshot(DocumentSnapshot snapshot) {
  //   final data = snapshot.data() as Map<String, dynamic>;
  //   return OrderModel(
  //     id: data['id'] as String,
  //     userId: data['userId'] as String,
  //     status: OrderStatus.values.firstWhere(
  //       (e) => e.toString().split('.').last == data['status'],
  //       orElse: () =>
  //           OrderStatus.pending, // Provide a default value if not found
  //     ),
  //     totalAmount: data['totalAmount'] as double,
  //     orderDate: (data['orderDate'] as Timestamp).toDate(),
  //     paymentMethod: data['paymentMethod'] as String,
  //     address: AddressModel.fromMap(data['address'] as Map<String, dynamic>),
  //     deliveryDate: data['deliveryDate'] != null
  //         ? (data['deliveryDate'] as Timestamp).toDate()
  //         : null,
  //     items: (data['items'] as List<dynamic>)
  //         .map((itemData) => CartItemModel.fromJson(itemData))
  //         .toList(),
  //   );
  // }

  factory OrderModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>?;

    if (data == null) {
      throw 'DocumentSnapshot data is null';
    }

    return OrderModel(
      id: data['id'] as String? ?? '',
      userId: data['userId'] as String? ?? '',
      status: OrderStatus.values.firstWhere(
        (e) => e.toString().split('.').last == data['status'],
        orElse: () =>
            OrderStatus.pending, // Provide a default value if not found
      ),
      totalAmount: (data['totalAmount'] as num?)?.toDouble() ?? 0.0,
      orderDate: (data['orderDate'] as Timestamp?)?.toDate() ?? DateTime.now(),
      paymentMethod: data['paymentMethod'] as String? ?? 'Cash on Delivery',
      address: data['address'] != null
          ? AddressModel.fromMap(data['address'] as Map<String, dynamic>)
          : AddressModel.empty(),
      deliveryDate: (data['deliveryDate'] as Timestamp).toDate(),
      items: (data['items'] as List<dynamic>?)
              ?.map((itemData) => CartItemModel.fromJson(itemData))
              .toList() ??
          [],
    );
  }
}
