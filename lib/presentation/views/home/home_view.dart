import 'package:asset_tracker/core/constants/const_app_texts.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(ConstAppTexts.homePageText),
        centerTitle: true,
      ),
    );
  }
}
