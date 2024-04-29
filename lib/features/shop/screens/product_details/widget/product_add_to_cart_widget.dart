import 'package:flutter/material.dart';
import '../../../../../common/widgets/icons/circular_icon.dart';
import '../../../../../utils/consts/sizes.dart';

class BottomAddToCart extends StatelessWidget {
  const BottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: CustomSizes.defaultSpace,
          vertical: CustomSizes.defaultSpace / 2),
      decoration: const BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(CustomSizes.cardRadiusLg),
          topRight: Radius.circular(CustomSizes.cardRadiusLg),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CircularIcon(
                  iCon: Icons.remove,
                  backgroundColor: Colors.grey,
                  width: 40,
                  height: 40,
                  color: Colors.white),
              const SizedBox(
                width: CustomSizes.spaceBtwnItems,
              ),
              Text('2', style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(width: CustomSizes.spaceBtwnItems),
              const CircularIcon(
                  iCon: Icons.add,
                  backgroundColor: Colors.green,
                  width: 40,
                  height: 40,
                  color: Colors.white),
            ],
          ),
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(CustomSizes.md),
                  backgroundColor: const Color(0xFF00A368),
                  side: const BorderSide(
                    color: Color(0xFF00A368),
                  )),
              child: const Text('Add to cart')),
        ],
      ),
    );
  }
}
