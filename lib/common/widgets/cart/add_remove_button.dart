import 'package:flutter/material.dart';
import '../../../utils/consts/sizes.dart';
import '../icons/circular_icon.dart';

class AddAndRemoveButton extends StatelessWidget {
  const AddAndRemoveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const CircularIcon(
          iCon: Icons.remove_circle_outline,
          width: 32,
          height: 32,
          size: CustomSizes.md,
          color: Colors.black,
        ),
        const SizedBox(
          width: CustomSizes.spaceBtwnItems,
        ),
        Text(
          '2',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(
          width: CustomSizes.spaceBtwnItems,
        ),
        const CircularIcon(
          iCon: Icons.add_circle_outline_sharp,
          width: 32,
          height: 32,
          size: CustomSizes.md,
          color: Colors.black,
          backgroundColor: Colors.white,
        ),
      ],
    );
  }
}
