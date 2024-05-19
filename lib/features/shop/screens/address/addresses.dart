import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:navadurga_fruits/features/shop/screens/address/add_new_address.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/consts/sizes.dart';
import '../../../../utils/helpers/cloud_helper_functions.dart';
import '../../../personalization/controllers/address_controller.dart';
import 'widgets/single_address.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () => Get.to(() => const AddNewAddressScreen()),
        child: const Icon(
          Iconsax.add,
          color: Colors.white,
        ),
      ),
      appBar: CustomAppBar(
        showbackArrow: true,
        title: Text(
          'Address',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
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
                            onTap: () =>
                                controller.selectAddress(addresses[index]),
                          ));
                }),
          ),
        ),
      ),
    );
  }
}
