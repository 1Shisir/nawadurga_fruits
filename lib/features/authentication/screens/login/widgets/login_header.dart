import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:navadurga_fruits/common/widgets/images/circular_image.dart';
import 'package:navadurga_fruits/utils/consts/image_string.dart';

import '../../../../../utils/consts/sizes.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(alignment: Alignment.center, children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.36,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color.fromARGB(255, 181, 226, 156),
            ),
          ),
          const CustomCircularImage(
              width: 200, height: 200, image: MyImage.appLogo)
          // Container(
          //   width: 200,
          //   height: 200,
          //   decoration: const BoxDecoration(
          //     shape: BoxShape.circle,
          //   ),
          //   child: ClipOval(
          //     child: Image.network(
          //       'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2HBdnzEwiLu9EZonMRGtc4PoRlKmXpU2QnA&s',
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          // ),
        ]),
        const SizedBox(
          height: CustomSizes.spaceBtwnSections,
        ),
        const Text('Login',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
        const SizedBox(
          height: CustomSizes.spaceBtwnItems,
        ),
        const Text('Login your account and buy products',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
        const SizedBox(
          height: CustomSizes.spaceBtwnItems,
        ),
      ],
    );
  }
}
