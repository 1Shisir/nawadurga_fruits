import 'package:flutter/material.dart';

import 'custom_theme/appbar_theme.dart';
import 'custom_theme/elevatedbutton_theme.dart';
import 'custom_theme/outlinedbutton_theme.dart';
import 'custom_theme/textfield_theme.dart';

class CustomAppTheme {
  CustomAppTheme._();

  static ThemeData theme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: const Color.fromARGB(255, 68, 155, 21),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: CustomAppBarTheme.appBarTheme,
    elevatedButtonTheme: CustomElevatedButtonTheme.elevatedButtonTheme,
    outlinedButtonTheme: CustomOutlinedButtonTheme.outlinedButtonTheme,
    inputDecorationTheme: CustomTextFormFieldTheme.inputDecorationTheme,
  );
}
