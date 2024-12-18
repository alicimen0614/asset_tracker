import 'package:asset_tracker/core/constants/const_app_colors.dart';
import 'package:asset_tracker/core/sizes/app_size.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final appTheme = ThemeData(
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: ConstAppColors.blackElevatedButtonColor,
          foregroundColor: Colors.white),
    ),
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.tealAccent),
    appBarTheme: const AppBarTheme(
      backgroundColor: ConstAppColors.yellowAppBarColor,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      hintStyle: TextStyle(
        color: Colors.grey,
      ),
      filled: true,
      fillColor: Colors.transparent,
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black,
        ),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.smallRadius)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black,
          width: 1.5,
        ),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.smallRadius)),
      ),
    ),
  );
}