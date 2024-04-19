import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:navadurga_fruits/features/personalization/profile/profile.dart';
import 'package:navadurga_fruits/features/shop/cart/cart_screen.dart';
import 'package:navadurga_fruits/features/shop/home/home_screen.dart';
import 'package:navadurga_fruits/features/shop/store/store.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 72,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          backgroundColor: Colors.white,
          indicatorColor: Colors.green.withOpacity(0.3),
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.shop), label: 'Store'),
            NavigationDestination(
                icon: Icon(Icons.local_grocery_store), label: 'Cart'),
            NavigationDestination(
                icon: Icon(Icons.account_circle), label: 'Profile'),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    const StoreScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];
}
