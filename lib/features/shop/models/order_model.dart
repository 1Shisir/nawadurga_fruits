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
    this.paymentMethod = 'E-sewa',
    this.address,
    this.deliveryDate,
    required this.items,
  });

  String get orderStatusText => status == OrderStatus.delivered
      ? 'Delivered'
      : status == OrderStatus.pending
          ? 'Pending'
          : 'Processing';

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'status': status.toString(),
      'totalAmount': totalAmount,
      'orderDate': orderDate,
      'paymentMethod': paymentMethod,
      'address': address?.toJson(),
      'deliveryDate': deliveryDate,
      'items': items.map((item) => item.toJson()).toList(),
    };
  }

  factory OrderModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    print(data);
    return OrderModel(
      id: data['id'].toString(),
      status:
          OrderStatus.values.firstWhere((e) => e.toString() == data['status']),
      totalAmount: data['totalAmount'] as double,
      orderDate: (data['orderDate'] as Timestamp).toDate(),
      paymentMethod: data['paymentMethod'] as String,
      userId: data['userId'] as String,
      address: AddressModel.fromMap(data['address'] as Map<String, dynamic>),
      deliveryDate: data['deliveryDate'] == null
          ? null
          : (data['deliveryDate'] as Timestamp).toDate(),
      items: (data['items'] as List<dynamic>)
          .map((itemData) =>
              CartItemModel.fromJson(itemData as Map<String, dynamic>))
          .toList(),
    );
  }

}
