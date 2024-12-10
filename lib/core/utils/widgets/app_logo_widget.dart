import 'package:flutter/material.dart';

class AppLogoWidget extends StatelessWidget {
  final double height;
  const AppLogoWidget({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    const String imagePath = "assets/images/assets_logo.png";
    return Center(
      child: Image.asset(
        imagePath,
        height: height,
      ),
    );
  }
}
