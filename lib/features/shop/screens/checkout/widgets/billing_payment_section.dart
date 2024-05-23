import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/consts/sizes.dart';
import '../../../controllers/checkout_controller.dart';

class CustomBillingPaymentSection extends StatelessWidget {
  const CustomBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CheckoutController());
    return Column(
      children: [
        const CustomSectionHeading(
          showActionButton: false,
          title: 'Payment Method',
        ),
        const SizedBox(
          height: CustomSizes.spaceBtwnItems / 2,
        ),
        Obx(
          () => Row(
            children: [
              const SizedBox(
                width: CustomSizes.spaceBtwnItems / 2,
              ),
              Text(
                controller.selectedpaymentMethod.value.name,
                style: Theme.of(context).textTheme.bodyLarge,
              )
            ],
          ),
        )
      ],
    );
  }
}
