import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:navadurga_fruits/features/shop/controllers/order_controller.dart';
import 'package:navadurga_fruits/utils/consts/lottie.dart';

import '../../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../../navigation_menu.dart';
import '../../../../../utils/consts/sizes.dart';
import '../../../../../utils/loaders/animation_loader.dart';

class CustomOrderListItems extends StatelessWidget {
  const CustomOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final orderController = Get.put(OrderController());
    return FutureBuilder(
        future: orderController.fetchuserOrders(),
        builder: (_, snapshot) {
          // nothing found widget
          final emptyWidget = AnimationLoaderWidget(
            text: 'No orders Yet!',
            animation: CustomLottie.lottie,
            showAction: true,
            actionText: 'Let\'s fill it',
            onActionPressed: () => Get.off(() => const NavigationMenu()),
          );

          //helper function to handle loader,no record,or erreor
          //final response = CloudHelperFunctions.checkMultiplerecordState(
          //   snapshot: snapshot, nothingFound: emptyWidget);

          // if (response != null) return response;
          if (!snapshot.hasData) {
            return emptyWidget;
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text('Error!'),
            );
          }

          //record found
          if (snapshot.hasData) {
            final orders = snapshot.data!;

            return ListView.separated(
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
                                    order.status.toString(),
                                    style: const TextStyle(fontSize: 14).apply(
                                        color: Colors.green,
                                        fontWeightDelta: 1),
                                  ),
                                  Text(
                                    order.formattedOrderDate,
                                    style: const TextStyle(fontSize: 16),
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
                                        const Text('Order',
                                            style: TextStyle(fontSize: 16)),
                                        Text(
                                          order.id,
                                          style: const TextStyle(fontSize: 16),
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
                                        const Text('Shipping date',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold)),
                                        Text(
                                          order.formattedDeliveryDate,
                                          style: const TextStyle(fontSize: 16),
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
                });
          } else {
            return Container(
              color: Colors.amber,
            );
          }
        });
  }
}
