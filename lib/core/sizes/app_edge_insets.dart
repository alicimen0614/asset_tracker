import 'package:asset_tracker/core/sizes/app_size.dart';
import 'package:flutter/widgets.dart';

class AppEdgeInsets extends EdgeInsets {
  const AppEdgeInsets.all(super.value) : super.all();

  static const AppEdgeInsets xSmall = AppEdgeInsets.all(AppSize.xSmallPadding);
  static const AppEdgeInsets small = AppEdgeInsets.all(AppSize.smallPadding);
  static const AppEdgeInsets medium = AppEdgeInsets.all(AppSize.mediumPadding);
  static const AppEdgeInsets large = AppEdgeInsets.all(AppSize.largePadding);
  static const AppEdgeInsets xLarge = AppEdgeInsets.all(AppSize.xLargePadding);

  // Symmetrical edge insets
  const AppEdgeInsets.symmetric({super.horizontal, super.vertical})
      : super.symmetric();

  static const AppEdgeInsets smallHorizontal =
      AppEdgeInsets.symmetric(horizontal: AppSize.smallPadding);
  static const AppEdgeInsets smallVertical =
      AppEdgeInsets.symmetric(vertical: AppSize.smallPadding);
  static const AppEdgeInsets mediumHorizontal =
      AppEdgeInsets.symmetric(horizontal: AppSize.mediumPadding);
  static const AppEdgeInsets mediumVertical =
      AppEdgeInsets.symmetric(vertical: AppSize.mediumPadding);
}
