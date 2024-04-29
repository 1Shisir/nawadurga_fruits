import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  final String? id;
  final String name;
  final String image;
  final bool? isFeatured;
  final double price;

  ProductModel({
    this.id,
    required this.name,
    required this.image,
    this.isFeatured,
    required this.price,
  });

  //empty product model
  static ProductModel empty() => ProductModel(
        name: '',
        price: 0,
        image: '',
      );

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Name': name,
      'Image': image,
      'IsFeatured': isFeatured,
      'Price': price,
    };
  }

  factory ProductModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) return ProductModel.empty();
    final data = document.data()!;
    return ProductModel(
        id: document.id,
        name: data['Name'] ?? '',
        image: data['Image'] ?? '',
        price: double.parse((data['Price'] ?? 0.0).toString()));
  }
}
