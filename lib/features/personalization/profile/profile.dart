import 'package:flutter/material.dart';
import 'package:navadurga_fruits/common/widgets/appbar/appbar.dart';
import 'package:navadurga_fruits/common/widgets/images/circular_image.dart';
import 'package:navadurga_fruits/features/personalization/profile/widgets/profile_menu.dart';
import 'package:navadurga_fruits/utils/consts/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: CustomAppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
              color: Colors.green, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        showbackArrow: true,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.logout))],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CustomSizes.defaultSpace),
          child: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        const CustomCircularImage(
                          backgroundColor: Colors.green,
                          height: 160,
                          width: 160,
                          image:
                              'https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                          isNetworkImage: true,
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.add_a_photo_rounded,
                                color: Colors.green,
                              )),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: CustomSizes.spaceBtwnItems,
                    ),
                  ],
                ),
              ),
              ProfileMenuWidget(
                  title: 'View details', icon: Icons.info, onPress: () {}),
              ProfileMenuWidget(
                  title: 'Address', icon: Icons.location_city, onPress: () {}),
              ProfileMenuWidget(
                  title: 'My orders',
                  icon: Icons.shopping_bag_rounded,
                  onPress: () {}),
              const Divider(
                color: Colors.grey,
              ),
              const SizedBox(
                height: CustomSizes.spaceBtwnSections,
              ),
              SizedBox(
                child: OutlinedButton(
                    onPressed: () {},
                    child: const Text(
                      'Delete Account',
                      style: TextStyle(color: Colors.red),
                    )),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
