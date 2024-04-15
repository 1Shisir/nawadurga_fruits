import 'package:flutter/material.dart';
import 'package:navadurga_fruits/utils/consts/sizes.dart';

import 'widgets/login_footer.dart';
import 'widgets/login_form.dart';
import 'widgets/login_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(CustomSizes.defaultSpace),
            child: Column(
              children: [
                //header
                LoginHeader(),

                //login form
                LoginForm(),

                //footer
                SizedBox(
                  height: CustomSizes.spaceBtwnSections,
                ),
                LoginFooter()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
