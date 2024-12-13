import 'package:asset_tracker/core/constants/const_image_paths.dart';
import 'package:asset_tracker/core/sizes/app_size.dart';
import 'package:flutter/material.dart';

class AppLogoWidget extends Center {
  final double height;
  AppLogoWidget({super.key, required this.height})
      : super(
            child: Image.asset(
          ConstImagePaths.logoPath,
          height: height,
        ));

  AppLogoWidget.small({super.key, this.height = 0.0})
      : super(
          child: Image.asset(
            ConstImagePaths.logoPath,
            height: AppSize.smallSize,
          ),
        );

  AppLogoWidget.medium({super.key, this.height = 0.0})
      : super(
          child: Image.asset(
            ConstImagePaths.logoPath,
            height: AppSize.mediumSize,
          ),
        );

  AppLogoWidget.large({super.key, this.height = 0.0})
      : super(
          child: Image.asset(
            ConstImagePaths.logoPath,
            height: AppSize.largeSize,
          ),
        );

  AppLogoWidget.huge({super.key, this.height = 0.0})
      : super(
          child: Image.asset(
            ConstImagePaths.logoPath,
            height: AppSize.x5LargeSize,
          ),
        );

  AppLogoWidget.big({super.key, this.height = 0.0})
      : super(
          child: Image.asset(
            ConstImagePaths.logoPath,
            height: AppSize.defaultLogoSize,
          ),
        );
}
