import 'package:flutter/material.dart';
import '../../../utils/consts/sizes.dart';

class CircularIcon extends StatelessWidget {
  const CircularIcon({
    super.key,
    this.width,
    this.height,
    this.size = CustomSizes.lg,
    this.color,
    this.backgroundColor,
    this.onPressed,
    required this.iCon,
  });

  final IconData iCon;
  final double? width, height, size;
  final Color? color, backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.white.withOpacity(0.2),
      ),
      child: IconButton(
          onPressed: onPressed, icon: Icon(iCon, color: color, size: size)),
    );
  }
}
