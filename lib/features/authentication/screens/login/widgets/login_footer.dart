import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:navadurga_fruits/navigation_menu.dart';
import 'package:navadurga_fruits/utils/consts/sizes.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: CustomSizes.spaceBtwnSections,
        ),
        Row(
          children: [
            const Text(
              'Browse Instead?',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(
              width: 8,
            ),
            GestureDetector(
              onTap: () => Get.to(() => const NavigationMenu()),
              child: const Text(
                'Continue',
                style:
                    TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
              ),
            )
          ],
        )
      ],
    );
  }
}
