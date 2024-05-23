import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/widgets/texts/section_heading.dart';
import '../../../utils/consts/sizes.dart';
import '../models/payment_method_model.dart';

class CheckoutController extends GetxController {
  static CheckoutController get instance => Get.find();

  final Rx<PaymentMethodModel> selectedpaymentMethod =
      PaymentMethodModel.empty().obs;

  @override
  void onInit() {
    selectedpaymentMethod.value = PaymentMethodModel(name: 'Cash on Delivery');
    super.onInit();
  }

  Future<dynamic> selectPaymentMethod(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (_) => SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(CustomSizes.lg),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomSectionHeading(
                        showActionButton: false,
                        title: 'Select Payment method'),
                    SizedBox(
                      height: CustomSizes.spaceBtwnSections,
                    ),
                  ],
                ),
              ),
            ));
  }
}
