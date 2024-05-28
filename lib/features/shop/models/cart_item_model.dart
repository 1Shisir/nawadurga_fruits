class CartItemModel {
  String productId;
  String title;
  String? image;
  double price;
  int quantity;

  CartItemModel({
    required this.productId,
    required this.quantity,
    this.image,
    this.price = 0.0,
    this.title = '',
  });

  ///Empty model
  static CartItemModel empty() => CartItemModel(productId: '', quantity: 0);

  // toJson method excluding the image
  Map<String, dynamic> toJsonWithoutImage() {
    return {
      'productId': productId,
      'title': title,
      'quantity': quantity,
      'price': price,
    };
  }

  //convert a cartitem to JSON map
  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'title': title,
      'price': price,
      'image': image,
      'quantity': quantity,
    };
  }

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      productId: json['productId'],
      quantity: json['quantity'],
      price: json['price']?.toDouble(),
      image: json['image'] ?? '',
      title: json['title'],
    );
  }
}
