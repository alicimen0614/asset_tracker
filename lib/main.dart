import 'package:asset_tracker/core/constants/const_app_texts.dart';
import 'package:asset_tracker/core/init/init.dart';
import 'package:asset_tracker/core/router/app_router.dart';
import 'package:asset_tracker/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  AppInit.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp.router(
        title: ConstAppTexts.appTitleText,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.appTheme,
        routerDelegate: router.delegate(),
        routeInformationParser: router.defaultRouteParser(),
      ),
    );
  }
}
