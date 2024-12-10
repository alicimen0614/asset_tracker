import 'package:asset_tracker/core/router/app_router.dart';
import 'package:asset_tracker/core/router/app_router.gr.dart';
import 'package:asset_tracker/core/utils/extensions/device_size_extension.dart';
import 'package:asset_tracker/core/utils/widgets/app_logo_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final String imagePath = "assets/images/assets_logo.png";

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      router.replace(const LoginRoute());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppLogoWidget(
            height: context.deviceHeight * 0.20,
          ),
        ],
      ),
    );
  }
}
