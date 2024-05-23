class PaymentMethodModel {
  String name;
  String? image;

  PaymentMethodModel({
    this.image,
    required this.name,
  });

  static PaymentMethodModel empty() => PaymentMethodModel(name: '');
}
