import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:navadurga_fruits/bindings/general_bindings.dart';
import 'package:navadurga_fruits/routes/app_routes.dart';
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
      getPages: AppRoutes.pages,
      home: Scaffold(
        backgroundColor: Colors.green[700],
        body: const Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      ),
      //const LoginScreen(),
    );
  }
}
