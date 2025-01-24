import 'package:asset_tracker/core/constants/const_app_colors.dart';
import 'package:asset_tracker/core/constants/const_app_texts.dart';
import 'package:flutter/material.dart';

extension DetermineColorExtension on String {
  Color toColor() {
    switch (this) {
      case ConstAppTexts.dirUpText:
        return ConstAppColors.defaultGreenColor;
      case ConstAppTexts.dirDownText:
        return ConstAppColors.defaultRedColor;
      default:
        return ConstAppColors.defaultBlackColor;
    }
  }
}
