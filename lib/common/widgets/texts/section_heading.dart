import 'package:flutter/material.dart';

class CustomSectionHeading extends StatelessWidget {
  const CustomSectionHeading({
    super.key,
    required this.showActionButton,
    required this.title,
    this.buttonTitle = 'View all',
    this.onPressed,
  });

  final bool showActionButton;
  final String title, buttonTitle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (showActionButton)
          TextButton(onPressed: onPressed, child: Text(buttonTitle)),
      ],
    );
  }
}
