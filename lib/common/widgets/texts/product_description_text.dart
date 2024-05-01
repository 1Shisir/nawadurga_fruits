import 'package:flutter/material.dart';

class ProductDescriptionText extends StatelessWidget {
  const ProductDescriptionText({
    super.key,
    required this.title,
    this.smallSize = false,
    required this.maxlines,
    this.textAlign = TextAlign.left,
  });

  final String title;
  final bool smallSize;
  final int maxlines;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 8),
      overflow: TextOverflow.ellipsis,
      maxLines: maxlines,
      textAlign: textAlign,
    );
  }
}
