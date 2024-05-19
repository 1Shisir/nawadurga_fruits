import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:navadurga_fruits/common/widgets/appbar/appbar.dart';
import 'package:navadurga_fruits/common/widgets/images/circular_image.dart';
import 'package:navadurga_fruits/common/widgets/shimmer/shimmer.dart';
import 'package:navadurga_fruits/data/repositories/authentication/authentication_repository.dart';
import 'package:navadurga_fruits/features/personalization/profile/widgets/profile_menu.dart';
import 'package:navadurga_fruits/features/shop/screens/address/addresses.dart';
import 'package:navadurga_fruits/utils/consts/sizes.dart';

import '../controllers/user_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return Scaffold(
      appBar: CustomAppBar(
        title: const Text(
          'Profile',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        showbackArrow: true,
        actions: [
          IconButton(
              onPressed: () => AuthenticationRepository.instance.signOut(),
              icon: const Icon(
                Icons.login_outlined,
                size: 32,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CustomSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    Stack(children: [
                      Obx(() {
                        final networkImage =
                            controller.user.value.profilePicture;
                        return controller.imageUploading.value
                            ? const CustomShimmerEffect(
                                width: 160, height: 160, radius: 160)
                            : CustomCircularImage(
                                image: networkImage,
                                width: 160,
                                height: 160,
                                isNetworkImage: true,
                              );
                      }),
                      Positioned(
                        right: 16,
                        bottom: 16,
                        child: IconButton(
                            onPressed: () =>
                                controller.uploadUserProfilePicture(),
                            icon: const Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.green,
                              size: 32,
                            )),
                      ),
                    ]),
                    Obx(() {
                      if (controller.profileLoading.value) {
                        return const CustomShimmerEffect(
                          width: 80,
                          height: 15,
                          radius: 15,
                        );
                      } else {
                        return Text(
                          controller.user.value.name,
                          style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)
                              .apply(color: Colors.black),
                        );
                      }
                    }),
                  ],
                ),
              ),
              const SizedBox(
                height: CustomSizes.spaceBtwnSections,
              ),
              ProfileMenuWidget(
                  title: 'Shipping address',
                  icon: Icons.location_on_outlined,
                  onPress: () => Get.to(() => const UserAddressScreen())),
              ProfileMenuWidget(
                  title: 'Order history',
                  icon: Icons.timer_outlined,
                  onPress: () {}),
              ProfileMenuWidget(
                  title: 'Personal Information',
                  icon: Icons.info_outline_rounded,
                  onPress: () {}),
              const Divider(),
              ProfileMenuWidget(
                  title: 'Delete account',
                  textColor: Colors.red,
                  endIcon: false,
                  icon: Icons.delete_outline_outlined,
                  onPress: () => controller.deleteAccountWarningPopup()),
            ],
          ),
        ),
      ),
    );
  }
}
