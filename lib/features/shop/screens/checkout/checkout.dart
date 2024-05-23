import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:navadurga_fruits/features/shop/screens/checkout/widgets/address_section.dart';
import 'package:navadurga_fruits/features/shop/screens/checkout/widgets/custom_amount_section.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../utils/consts/sizes.dart';
import '../../../../utils/popups/loader.dart';
import '../../controllers/cart_controller.dart';
import '../../controllers/order_controller.dart';
import '../cart/widgets/custom_cart_items.dart';
import 'widgets/billing_payment_section.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final subTotal = cartController.totalCartPrice.value;
    final orderController = Get.put(OrderController());

    return Scaffold(
        appBar: CustomAppBar(
          title: Text('Order Review',
              style: Theme.of(context).textTheme.headlineSmall),
          showbackArrow: true,
        ),
        body: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(CustomSizes.defaultSpace),
            child: Column(
              children: [
                //items in cart

                CustomCartItems(
                  showAddRemoveButtons: false,
                  isOrder: true,
                ),
                SizedBox(
                  height: CustomSizes.spaceBtwnSections,
                ),

                //Billing section
                CustomCircularContainer(
                  padding: EdgeInsets.all(CustomSizes.md),
                  showBorder: true,
                  backgroundColor: Colors.white,
                  child: Column(
                    children: [
                      //amount
                      CustomAmountSection(),
                      Divider(),

                      ///Payment Methods
                      CustomBillingPaymentSection(),

                      Divider(),

                      ///Address
                      CustomBillingAddressSection(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),

        //checkout bitton
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16),
          child: ElevatedButton(
            onPressed: subTotal > 0
                ? () => orderController.processOrder(subTotal)
                : () => Loader.warningSnackBar(
                    title: 'Empty cart',
                    message: 'Add item in the cart in order to proceed.'),
            //() => Get.to(() => SuccessScreen(
            //       image: CustomImages.verifysuccess,
            //       title: 'Payment Successful',
            //       subtitle: 'Your item will be shipped soon',
            //       onPressed: () => Get.offAll(() => const NavigationMenu()),
            //     )),
            child: Text('Checkout Rs.$subTotal'),
          ),
        ));
  }
}
