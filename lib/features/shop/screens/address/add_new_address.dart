import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/consts/sizes.dart';
import '../../../../utils/validators/validators.dart';
import '../../../personalization/controllers/address_controller.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text('Add New Address'),
        showbackArrow: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(CustomSizes.defaultSpace),
        child: Form(
          key: controller.addressFormKey,
          child: Column(
            children: [
              TextFormField(
                  controller: controller.name,
                  validator: (value) =>
                      Validators.validateEmptyText('Name', value),
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.user), labelText: 'Name')),
              const SizedBox(
                height: CustomSizes.spaceBtwninputField,
              ),
              TextFormField(
                  controller: controller.phoneNumber,
                  validator: Validators.validatePhoneNumber,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.mobile),
                      labelText: 'Phone Number')),
              const SizedBox(
                height: CustomSizes.spaceBtwninputField,
              ),
              Row(
                children: [
                  Expanded(
                      child: TextFormField(
                          controller: controller.tole,
                          validator: (value) =>
                              Validators.validateEmptyText('Tole', value),
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Iconsax.building_31),
                              labelText: 'Tole'))),
                  const SizedBox(
                    width: CustomSizes.spaceBtwnItems / 2,
                  ),
                  Expanded(
                      child: TextFormField(
                          controller: controller.wardNo,
                          validator: (value) =>
                              Validators.validateEmptyText('Ward No.', value),
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Iconsax.code),
                              labelText: 'Ward No'))),
                ],
              ),
              const SizedBox(height: CustomSizes.spaceBtwninputField),
              Row(
                children: [
                  Expanded(
                      child: TextFormField(
                          controller: controller.city,
                          validator: (value) =>
                              Validators.validateEmptyText('City', value),
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Iconsax.building),
                              labelText: 'City'))),
                  const SizedBox(
                    width: CustomSizes.spaceBtwnItems / 2,
                  ),
                  Expanded(
                      child: TextFormField(
                          controller: controller.state,
                          validator: (value) =>
                              Validators.validateEmptyText('State', value),
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Iconsax.activity),
                              labelText: 'State'))),
                ],
              ),
              const SizedBox(height: CustomSizes.spaceBtwninputField),
              TextFormField(
                controller: controller.country,
                validator: (value) =>
                    Validators.validateEmptyText('Country', value),
                decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.global), labelText: 'Country'),
              ),
              const SizedBox(height: CustomSizes.defaultSpace),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.addNewAddress(),
                    child: const Text('Save')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
