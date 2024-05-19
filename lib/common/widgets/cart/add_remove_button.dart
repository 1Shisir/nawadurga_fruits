import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/consts/sizes.dart';
import '../icons/circular_icon.dart';

class AddAndRemoveButton extends StatelessWidget {
  const AddAndRemoveButton({
    super.key,
    required this.quantity,
    this.add,
    this.remove,
  });

  final int quantity;
  final VoidCallback? add, remove;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircularIcon(
          iCon: Iconsax.minus,
          width: 32,
          height: 32,
          size: CustomSizes.md,
          color: Colors.black,
          backgroundColor: Colors.grey,
          onPressed: remove,
        ),
        const SizedBox(
          width: CustomSizes.spaceBtwnItems,
        ),
        Text(
          quantity.toString(),
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(
          width: CustomSizes.spaceBtwnItems,
        ),
        CircularIcon(
          iCon: Iconsax.add,
          width: 32,
          height: 32,
          size: CustomSizes.md,
          color: Colors.black,
          backgroundColor: Colors.green,
          onPressed: add,
        ),
      ],
    );
  }
}
