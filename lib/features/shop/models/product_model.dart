import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  final String? id;
  final String name;
  final String image;
  final bool? isFeatured;
  final double price;
  String? description;
  List<String>? images;

  ProductModel({
    this.id,
    required this.name,
    required this.image,
    this.isFeatured,
    required this.price,
    this.description,
    this.images,
  });

  //empty product model
  static ProductModel empty() => ProductModel(
        description: '',
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
      'Description': description,
      'MoreImages': images,
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
      price: double.parse((data['Price'] ?? 0.0).toString()),
      description: data['Description'] ?? '',
      images: data['MoreImages'] != null
          ? List<String>.from(data['MoreImages'])
          : [],
    );
  }
}
