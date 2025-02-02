import 'package:asset_tracker/core/sizes/app_size.dart';
import 'package:flutter/material.dart';

class CustomSizedBox extends SizedBox {
  const CustomSizedBox({super.key, super.width, super.height});

  const CustomSizedBox.empty({super.key}) : super();

  // for heigth

  ///4.0
  const CustomSizedBox.xSmallHeigth({super.key})
      : super(height: AppSize.xSmallSize);

  ///8.0
  const CustomSizedBox.smallHeigth({super.key})
      : super(height: AppSize.smallSize);

  ///12.0
  const CustomSizedBox.mediumHeigth({super.key})
      : super(height: AppSize.mediumSize);

  ///16.0
  const CustomSizedBox.largeHeigth({super.key})
      : super(height: AppSize.largeSize);

  ///20.0
  const CustomSizedBox.xlargeHeigth({super.key})
      : super(height: AppSize.xLargeSize);

  ///40.0
  const CustomSizedBox.x2largeHeigth({super.key})
      : super(height: AppSize.x2LargeSize);

  ///60.0
  const CustomSizedBox.x3largeHeigth({super.key})
      : super(height: AppSize.x3LargeSize);

  ///80.0
  const CustomSizedBox.x4largeHeigth({super.key})
      : super(height: AppSize.x4LargeSize);

  ///100.0
  const CustomSizedBox.hugeHeigth({super.key})
      : super(height: AppSize.x5LargeSize);

  // for width

  ///4.0
  const CustomSizedBox.xSmallWidth({super.key})
      : super(width: AppSize.xSmallSize);

  ///8.0

  const CustomSizedBox.smallWidth({super.key})
      : super(width: AppSize.smallSize);

  ///12.0

  const CustomSizedBox.mediumWidth({super.key})
      : super(width: AppSize.mediumSize);

  ///16.0

  const CustomSizedBox.largeWidth({super.key})
      : super(width: AppSize.largeSize);

  ///20.0
  const CustomSizedBox.xlargeWidth({super.key})
      : super(width: AppSize.xLargeSize);

  ///40.0
  const CustomSizedBox.x2largeWidth({super.key})
      : super(width: AppSize.x2LargeSize);

  ///60.0
  const CustomSizedBox.x3largeWidth({super.key})
      : super(width: AppSize.x3LargeSize);

  ///80.0
  const CustomSizedBox.x4largeWidth({super.key})
      : super(width: AppSize.x4LargeSize);

  ///100.0
  const CustomSizedBox.hugeWidth({super.key})
      : super(width: AppSize.x5LargeSize);
}
