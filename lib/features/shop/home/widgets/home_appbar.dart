import 'package:flutter/material.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/cart/cart_menu_icon.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome to',
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .apply(color: Colors.white),
          ),
          Text(
            'Nawadurga Fruits',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24)
                .apply(color: Colors.white),
          )
        ],
      ),
      actions: [
        CustomCartCounterIcon(
          onPressed: () {},
          iconColor: Colors.white,
        ),
      ],
    );
  }
}
