// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:navadurga_fruits/utils/consts/sizes.dart';
// import '../../../../../utils/validators/validators.dart';
// import '../../../controllers/login_controller.dart';

// class LoginForm extends StatelessWidget {
//   const LoginForm({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.find<LoginController>();
//     return Form(
//         key: controller.loginFormKey,
//         child: Column(
//           children: [
//             SizedBox(
//               width: double.infinity,
//               child: TextFormField(
//                 validator: (value) => Validators.validateEmpty(value),
//                 controller: controller.username,
//                 decoration: const InputDecoration(
//                   labelText: 'Full name',
//                   prefixIcon: Icon(
//                     Icons.account_box_sharp,
//                     size: 24,
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: CustomSizes.spaceBtwninputField,
//             ),
//             SizedBox(
//               width: double.infinity,
//               child: TextFormField(
//                 validator: (value) => Validators.validatePhoneNumber(value),
//                 controller: controller.phoneNo,
//                 decoration: const InputDecoration(
//                   labelText: 'Phone number',
//                   prefixIcon: Icon(
//                     Icons.phone,
//                     size: 24,
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: CustomSizes.spaceBtwnSections,
//             ),
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                   onPressed: () => controller.signup(),
//                   child: const Text('LOGIN')),
//             ),
//           ],
//         ));
//   }
// }
