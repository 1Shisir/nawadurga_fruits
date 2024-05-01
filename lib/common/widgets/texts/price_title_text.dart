import 'package:flutter/material.dart';

class ProductPriceText extends StatelessWidget {
  const ProductPriceText({
    super.key,
    this.currencySign = 'Rs.',
    required this.price,
    this.maxlines = 1,
  });

  final String currencySign, price;
  final int maxlines;

  @override
  Widget build(BuildContext context) {
    return Text(currencySign + price,
        maxLines: maxlines,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold));
  }
}
