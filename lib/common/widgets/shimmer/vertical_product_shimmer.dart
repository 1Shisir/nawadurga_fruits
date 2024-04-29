import 'package:flutter/material.dart';
import 'package:navadurga_fruits/common/layouts/grid_layout.dart';
import 'package:navadurga_fruits/common/widgets/shimmer/shimmer.dart';
import 'package:navadurga_fruits/utils/consts/sizes.dart';

class VerticalProductShimmer extends StatelessWidget {
  const VerticalProductShimmer({super.key, this.itemCount = 4});

  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return CustomGridLayout(
        itemCount: itemCount,
        itemBuilder: (_, __) => const SizedBox(
              width: 180,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Image
                  CustomShimmerEffect(width: 180, height: 180, radius: 15),
                  SizedBox(
                    height: CustomSizes.spaceBtwnItems,
                  ),

                  //text
                  CustomShimmerEffect(width: 160, height: 15, radius: 15),
                  SizedBox(
                    height: CustomSizes.spaceBtwnItems / 2,
                  ),
                  CustomShimmerEffect(width: 110, height: 15, radius: 15)
                ],
              ),
            ));
  }
}
