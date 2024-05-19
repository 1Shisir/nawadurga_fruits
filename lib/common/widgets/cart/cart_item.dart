import 'package:flutter/material.dart';
import '../../../features/shop/models/cart_item_model.dart';
import '../../../utils/consts/sizes.dart';
import '../images/circular_image.dart';
import '../texts/product_title_text.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.cartItem,
  });

  final CartItemModel cartItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ///image
        CustomCircularImage(
          image: cartItem.image ?? '',
          height: 60,
          width: 60,
          isNetworkImage: true,
          backgroundColor: Colors.white,
        ),
        const SizedBox(
          width: CustomSizes.spaceBtwnItems,
        ),

        ///title,price and Size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                  child: ProductTitleText(title: cartItem.title, maxlines: 1)),
            ],
          ),
        )
      ],
    );
  }
}
