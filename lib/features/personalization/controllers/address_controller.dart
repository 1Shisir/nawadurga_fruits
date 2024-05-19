import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:navadurga_fruits/features/personalization/models/address_model.dart';
import 'package:navadurga_fruits/utils/consts/lottie.dart';
import 'package:navadurga_fruits/utils/helpers/cloud_helper_functions.dart';

import '../../../common/widgets/texts/section_heading.dart';
import '../../../data/repositories/address/address_repository.dart';
import '../../../utils/consts/sizes.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../../../utils/popups/loader.dart';
import '../../shop/screens/address/add_new_address.dart';
import '../../shop/screens/address/widgets/single_address.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  //variables
  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final tole = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final wardNo = TextEditingController();
  final country = TextEditingController();
  GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();

  RxBool refreshData = true.obs;
  final Rx<AddressModel> selectedAddress = AddressModel.empty().obs;
  final addressRepository = Get.put(AddressRepository());

  Future<List<AddressModel>> getAllUserAddresses() async {
    try {
      final addresses = await addressRepository.fetchUserAddress();
      selectedAddress.value = addresses.firstWhere(
          (element) => element.selectedAddress,
          orElse: () => AddressModel.empty());
      return addresses;
    } catch (e) {
      Loader.errorSnackBar(title: 'Addresses not found', message: e.toString());
      return [];
    }
  }

  Future selectAddress(AddressModel newSelectedAddress) async {
    try {
      Get.defaultDialog(
          title: '',
          onWillPop: () async {
            return false;
          },
          barrierDismissible: false,
          backgroundColor: Colors.transparent,
          content: const CircularProgressIndicator());
      //clear the selecter field
      if (selectedAddress.value.id.isNotEmpty) {
        await addressRepository.updateSelectedField(
            selectedAddress.value.id, false);
      }

      //Assign selected address
      newSelectedAddress.selectedAddress = true;
      selectedAddress.value = newSelectedAddress;

      //Set the 'Selected' field to true for any newly selected  address
      await addressRepository.updateSelectedField(
          selectedAddress.value.id, true);

      Get.back();
    } catch (e) {
      Loader.errorSnackBar(title: 'Error in selection', message: e.toString());
    }
  }

  ///add new address
  Future addNewAddress() async {
    try {
      //start loading
      FullScreenLoader.openLoadingDialog(
          'Storing address', CustomLottie.lottie);

      //form validate
      if (!addressFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      //save the data
      final address = AddressModel(
        id: '',
        name: name.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        tole: tole.text.trim(),
        city: city.text.trim(),
        state: state.text.trim(),
        country: country.text.trim(),
        wardNo: wardNo.text.trim(),
        selectedAddress: true,
      );

      final id = await addressRepository.addAddress(address);

      //update selected address status
      address.id = id;
      await selectAddress(address);

      //remove loader
      FullScreenLoader.stopLoading();

      //show success sccreen
      Loader.successSnackBar(
          title: 'Congratulation',
          message: 'Your address has been saved successfully!');

      //refresh address data
      refreshData.toggle();

      //reset fields
      resetFormField();

      //Redirect
      Navigator.of(Get.context!).pop();
    } catch (e) {
      //remove loader
      FullScreenLoader.stopLoading();
      Loader.errorSnackBar(title: 'Address not found', message: e.toString());
    }
  }

  //show address buttomsheet
  Future<dynamic> selectNewAddressPopup(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (_) => SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(CustomSizes.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomSectionHeading(
                        showActionButton: false, title: 'Select Address'),
                    FutureBuilder(
                        future: getAllUserAddresses(),
                        builder: (_, snapshot) {
                          //helper function to handle no record and other stuffs
                          final response =
                              CloudHelperFunctions.checkMultiplerecordState(
                                  snapshot: snapshot);
                          if (response != null) {
                            return response;
                          }

                          return ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (_, index) => SingleAddress(
                                  address: snapshot.data![index],
                                  onTap: () async {
                                    await selectAddress(snapshot.data![index]);
                                    Get.back();
                                  }));
                        }),
                    const SizedBox(
                      height: CustomSizes.defaultSpace * 2,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () =>
                              Get.to(() => const AddNewAddressScreen()),
                          child: const Text('Add new Address')),
                    )
                  ],
                ),
              ),
            ));
  }

  //function to reset formfield
  void resetFormField() {
    name.clear();
    phoneNumber.clear();
    tole.clear();
    state.clear();
    wardNo.clear();
    country.clear();
    addressFormKey.currentState?.reset();
  }
}
