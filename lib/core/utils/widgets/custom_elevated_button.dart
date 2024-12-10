import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String title;
  final Size size;
  final VoidCallback onTap;
  const CustomElevatedButton(
      {super.key,
      required this.title,
      required this.size,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF45474B),
          minimumSize: size,
        ),
        onPressed: onTap,
        child: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ));
  }
}
