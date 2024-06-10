import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:navadurga_fruits/utils/consts/lottie.dart';

import '../../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../../navigation_menu.dart';
import '../../../../../utils/consts/sizes.dart';
import '../../../../../utils/helpers/cloud_helper_functions.dart';
import '../../../../../utils/loaders/animation_loader.dart';
import '../../../controllers/order_controller.dart';

class CustomOrderListItems extends StatelessWidget {
  const CustomOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final orderController = Get.put(OrderController());
    return FutureBuilder(
        future: orderController.fetchUserOrders(),
        builder: (_, snapshot) {
          //nothing found widget
          final emptyWidget = AnimationLoaderWidget(
            text: 'No orders Yet!',
            animation: CustomLottie.lottie,
            showAction: true,
            actionText: 'Let\'s fill it',
            onActionPressed: () => Get.off(() => const NavigationMenu()),
          );

          //helper function to handle loader,no record,or erreor
          final response = CloudHelperFunctions.checkMultiplerecordState(
              snapshot: snapshot, nothingFound: emptyWidget);
          if (response != null) return response;

          //record found
          final orders = snapshot.data!;

          return  ListView.separated(
                shrinkWrap: true,
                itemCount: orders.length,
                separatorBuilder: (_, index) => const SizedBox(
                      height: CustomSizes.spaceBtwnItems,
                    ),
                itemBuilder: (_, index) {
                  final order = orders[index];

                  return CustomCircularContainer(
                    padding: const EdgeInsets.all(CustomSizes.md),
                    showBorder: true,
                    backgroundColor: Colors.white,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        //row 1
                        Row(
                          children: [
                            //icon
                            const Icon(Iconsax.ship),
                            const SizedBox(
                              width: CustomSizes.spaceBtwnItems / 2,
                            ),

                            ///status and date
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    '',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .apply(
                                            color: Colors.green,
                                            fontWeightDelta: 1),
                                  ),
                                  Text(
                                    order.orderDate.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall,
                                  )
                                ],
                              ),
                            ),

                            //icon
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Iconsax.arrow_right_34,
                                  size: CustomSizes.iconsSm,
                                ))
                          ],
                        ),
                        const SizedBox(
                          height: CustomSizes.spaceBtwnItems,
                        ),

                        //row 2
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  //icon
                                  const Icon(Iconsax.tag),
                                  const SizedBox(
                                    width: CustomSizes.spaceBtwnItems / 2,
                                  ),

                                  ///status and date
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text('Order',
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelMedium),
                                        Text(
                                          order.id,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  //icon
                                  const Icon(Iconsax.calendar),
                                  const SizedBox(
                                    width: CustomSizes.spaceBtwnItems / 2,
                                  ),

                                  ///status and date
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text('Shipping date',
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelMedium),
                                        Text(
                                          order.deliveryDate.toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }
          );
        });
  }
}
