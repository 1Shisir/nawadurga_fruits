import 'package:flutter/material.dart';

class CustomShadowStyle {
  static final verticalProductShadow = BoxShadow(
    color: Colors.grey.withOpacity(0.2),
    blurRadius: 24,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );

  static final horizontalProductShadow = BoxShadow(
    color: Colors.grey.withOpacity(0.2),
    blurRadius: 24,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );
}
