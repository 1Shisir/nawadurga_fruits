import 'package:flutter/material.dart';
import 'package:navadurga_fruits/features/shop/screens/orders/widgets/order_list.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/consts/sizes.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showbackArrow: true,
        title: Text(
          'My orders',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(CustomSizes.defaultSpace),

        ///orders
        child: CustomOrderListItems(),
      ),
    );
  }
}
