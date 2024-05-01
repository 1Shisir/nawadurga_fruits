import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:navadurga_fruits/common/widgets/shimmer/shimmer.dart';
import '../../../utils/consts/sizes.dart';

class CustomCircularImage extends StatelessWidget {
  const CustomCircularImage({
    super.key,
    this.fit = BoxFit.cover,
    this.width = 56,
    this.height = 56,
    this.isNetworkImage = false,
    required this.image,
    this.overlayColor,
    this.backgroundColor,
    this.padding = const EdgeInsets.all(CustomSizes.sm),
  });

  final BoxFit? fit;
  final double width, height;
  final bool isNetworkImage;
  final String image;
  final Color? overlayColor, backgroundColor;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(100),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Center(
          child: isNetworkImage
              ? CachedNetworkImage(
                  imageUrl: image,
                  fit: fit,
                  color: overlayColor,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      const CustomShimmerEffect(
                          width: 55, height: 55, radius: 55),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                )
              : Image(
                  image: isNetworkImage
                      ? NetworkImage(image)
                      : AssetImage(image) as ImageProvider,
                  color: overlayColor,
                  fit: fit,
                ),
        ),
      ),
    );
  }
}
