import 'package:asset_tracker/core/sizes/app_size.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Size size;
  const CustomElevatedButton({
    super.key,
    required this.title,
    required this.onTap,
    this.size = const Size(double.infinity, AppSize.largeSize),
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(fixedSize: size),
        onPressed: onTap,
        child: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ));
  }
}
