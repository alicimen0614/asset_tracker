import 'package:flutter/widgets.dart';

class AppEdgeInsets extends EdgeInsets {
  const AppEdgeInsets.all(super.value) : super.all();

  static const AppEdgeInsets xSmall = AppEdgeInsets.all(4.0);
  static const AppEdgeInsets small = AppEdgeInsets.all(8.0);
  static const AppEdgeInsets medium = AppEdgeInsets.all(16.0);
  static const AppEdgeInsets large = AppEdgeInsets.all(24.0);
  static const AppEdgeInsets xLarge = AppEdgeInsets.all(32.0);

  // Symmetrical edge insets
  const AppEdgeInsets.symmetric({super.horizontal, super.vertical})
      : super.symmetric();

  static const AppEdgeInsets smallHorizontal =
      AppEdgeInsets.symmetric(horizontal: 8.0);
  static const AppEdgeInsets smallVertical =
      AppEdgeInsets.symmetric(vertical: 8.0);
  static const AppEdgeInsets mediumHorizontal =
      AppEdgeInsets.symmetric(horizontal: 16.0);
  static const AppEdgeInsets mediumVertical =
      AppEdgeInsets.symmetric(vertical: 16.0);
}
