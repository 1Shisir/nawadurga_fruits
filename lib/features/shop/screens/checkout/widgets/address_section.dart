import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/consts/sizes.dart';
import '../../../../../utils/helpers/cloud_helper_functions.dart';
import '../../../../personalization/controllers/address_controller.dart';
import '../../address/widgets/single_address.dart';

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
          ? SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(CustomSizes.defaultSpace),
                child: Obx(
                  () => FutureBuilder(
                      key: Key(controller.refreshData.value.toString()),
                      future: controller.getAllUserAddresses(),
                      builder: (context, snapshot) {
                        //helper function
                        final response =
                            CloudHelperFunctions.checkMultiplerecordState(
                                snapshot: snapshot);
                        if (response != null) return response;

                        final addresses = snapshot.data!;
                        return ListView.builder(
                            shrinkWrap: true,
                            itemCount: addresses.length,
                            itemBuilder: (_, index) => SingleAddress(
                                  address: addresses[index],
                                  onTap: () => controller
                                      .selectAddress(addresses[index]),
                                ));
                      }),
                ),
              ),
            )
          : Text(
              'Select Address',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
    ]);
  }
}
