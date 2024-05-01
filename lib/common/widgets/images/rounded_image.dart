import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:navadurga_fruits/common/widgets/shimmer/shimmer.dart';

class CustomRoundedImage extends StatelessWidget {
  const CustomRoundedImage({
    super.key,
    this.width,
    this.height,
    required this.imageUrl,
    required this.appplyImageRadius,
    this.border,
    this.backgroundColor,
    this.fit,
    this.padding,
    required this.isNetworkImage,
    this.onPressed,
    required this.borderRadius,
  });

  final double? width, height;
  final String imageUrl;
  final bool appplyImageRadius;
  final BoxBorder? border;
  final Color? backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          border: border,
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: ClipRRect(
          borderRadius: appplyImageRadius
              ? BorderRadius.circular(borderRadius)
              : BorderRadius.zero,
          child: isNetworkImage
              ? CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: fit,
                  progressIndicatorBuilder: (context, url, progress) =>
                      CustomShimmerEffect(
                          width: width ?? double.infinity,
                          height: height ?? 158,
                          radius: 15),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                )
              : Image(
                  image: AssetImage(imageUrl),
                  fit: fit,
                ),
        ),
      ),
    );
  }
}
