import 'package:flutter/material.dart';
import '../../../../utils/consts/sizes.dart';
import '../../../../utils/device/device_utiliti.dart';

class CustomSearchContainer extends StatelessWidget {
  const CustomSearchContainer({
    super.key,
    required this.text,
    this.icon,
    this.showBackground = true,
    this.showBorder = true,
    this.onTap,
    this.padding =
        const EdgeInsets.symmetric(horizontal: CustomSizes.defaultSpace),
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Container(
          width: DeviceUtility.getScreenWidth(context),
          padding: const EdgeInsets.all(CustomSizes.md),
          decoration: BoxDecoration(
            color: showBackground ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(CustomSizes.cardRadiusLg),
            border: showBorder ? Border.all(color: Colors.grey) : null,
          ),
          child: Row(
            children: [
              Icon(icon, color: Colors.grey),
              const SizedBox(
                width: CustomSizes.spaceBtwnItems,
              ),
              Text(
                text,
                style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
