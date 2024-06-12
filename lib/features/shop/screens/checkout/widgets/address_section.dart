import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/consts/sizes.dart';
import '../../../../personalization/controllers/address_controller.dart';

class CustomBillingAddressSection extends StatelessWidget {
  const CustomBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      CustomSectionHeading(
        showActionButton: true,
        title: 'Shipping Address',
        buttonTitle: 'Change',
        onPressed: () => controller.selectNewAddressPopup(context),
      ),
      controller.selectedAddress.value.id.isNotEmpty
          ? Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.selectedAddress.value.name,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(
                    height: CustomSizes.spaceBtwnItems / 2,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.phone,
                        color: Colors.grey,
                        size: 16,
                      ),
                      const SizedBox(
                        width: CustomSizes.spaceBtwnItems,
                      ),
                      Text(
                        controller.selectedAddress.value.phoneNumber,
                        style: const TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: CustomSizes.spaceBtwnItems / 2,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_history,
                        color: Colors.grey,
                        size: 16,
                      ),
                      const SizedBox(
                        width: CustomSizes.spaceBtwnItems,
                      ),
                      Expanded(
                          child: Text(
                        controller.selectedAddress.value.toString(),
                        style: const TextStyle(fontSize: 16),
                      ))
                    ],
                  )
                ],
              ),
            )
          : Text(
              'Select Address',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
    ]);
  }
}
