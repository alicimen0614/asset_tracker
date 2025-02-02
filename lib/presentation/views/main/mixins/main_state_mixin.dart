import 'package:asset_tracker/core/constants/const_app_colors.dart';
import 'package:asset_tracker/core/constants/const_app_texts.dart';
import 'package:asset_tracker/core/router/app_router.gr.dart';
import 'package:asset_tracker/presentation/views/main/main_view.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

mixin MainStateMixin on State<MainView> {
  final List<PageRouteInfo> routes = [
    const HomeRoute(),
    const UserRoute(),
  ];

  final List<NavigationDestination> bottomNavigationBarItems = [
    const NavigationDestination(
      icon: Icon(
        Icons.home,
        color: ConstAppColors.defaultDarkGreyColor,
      ),
      label: ConstAppTexts.homeText,
    ),
    const NavigationDestination(
        icon: Icon(
          Icons.person,
          color: ConstAppColors.defaultDarkGreyColor,
        ),
        label: ConstAppTexts.userText),
  ];
}
