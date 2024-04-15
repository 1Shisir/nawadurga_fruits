import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Form(
        child: Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Phone number',
              prefixIcon: Icon(
                Icons.phone,
                size: 24,
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
