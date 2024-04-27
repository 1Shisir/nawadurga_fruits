import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:navadurga_fruits/bindings/bindings.dart';
import 'package:navadurga_fruits/features/authentication/screens/login/login.dart';
import 'package:navadurga_fruits/utils/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomAppTheme.theme,
      initialBinding: GeneralBindings(),
      home: const LoginScreen(),
    );
  }
}
