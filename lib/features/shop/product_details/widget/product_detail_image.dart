import 'package:flutter/material.dart';
import 'package:navadurga_fruits/common/widgets/cart/cart_menu_icon.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import '../../../../utils/consts/sizes.dart';

class CustomProductImage extends StatelessWidget {
  const CustomProductImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCurvedEdgesWidget(
      child: Container(
          color: const Color.fromARGB(255, 118, 182, 120),
          child: const Stack(
            children: [
              SizedBox(
                  height: 400,
                  child: Padding(
                    padding: EdgeInsets.all(CustomSizes.productImageradius * 2),
                    child: Center(
                        child: Image(
                            image: NetworkImage(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2HBdnzEwiLu9EZonMRGtc4PoRlKmXpU2QnA&s'))),
                  )),

              //appbar icons
              CustomAppBar(
                  showbackArrow: true, actions: [CustomCartCounterIcon()])
            ],
          )),
    );
  }
}
