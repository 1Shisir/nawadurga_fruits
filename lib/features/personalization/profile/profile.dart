import 'package:flutter/material.dart';
import 'package:navadurga_fruits/common/widgets/appbar/appbar.dart';
import 'package:navadurga_fruits/common/widgets/images/circular_image.dart';
import 'package:navadurga_fruits/features/personalization/profile/widgets/profile_menu.dart';
import 'package:navadurga_fruits/utils/consts/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: const Text(
          'Profile',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        showbackArrow: true,
        actions: [
          IconButton(
              onPressed: () {},
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
                      const CustomCircularImage(
                        image:
                            'https://st3.depositphotos.com/15648834/17930/v/450/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg',
                        isNetworkImage: true,
                        height: 200,
                        width: 200,
                      ),
                      Positioned(
                        right: 16,
                        bottom: 16,
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.green,
                              size: 32,
                            )),
                      ),
                    ]),
                    const Text(
                      'Shisir Ghimire',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      '9866775698',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: CustomSizes.spaceBtwnSections,
              ),
              ProfileMenuWidget(
                  title: 'Shipping address',
                  icon: Icons.location_on_outlined,
                  onPress: () {}),
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
                  onPress: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
