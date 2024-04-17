import 'package:flutter/material.dart';
import '../../../utils/consts/sizes.dart';
import '../images/circular_image.dart';
import '../texts/product_title_text.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        ///image
        CustomCircularImage(
          image:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2HBdnzEwiLu9EZonMRGtc4PoRlKmXpU2QnA&s',
          height: 60,
          width: 60,
          backgroundColor: Colors.white,
          isNetworkImage: true,
        ),
        SizedBox(
          width: CustomSizes.spaceBtwnItems,
        ),

        ///title,price and Size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                  child: ProductTitleText(title: 'Great apples', maxlines: 1)),

              ///attributes
              Text.rich(TextSpan(children: [
                TextSpan(
                  text: 'Weight',
                  style: TextStyle(fontSize: 14),
                ),
                TextSpan(text: '1 kg', style: TextStyle(fontSize: 14)),
              ]))
            ],
          ),
        )
      ],
    );
  }
}
