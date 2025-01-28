import 'package:asset_tracker/core/constants/const_app_colors.dart';
import 'package:asset_tracker/core/constants/const_app_texts.dart';
import 'package:asset_tracker/core/router/app_router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final List<PageRouteInfo> _routes = [
    const HomeRoute(),
    const UserRoute(),
  ];

  final List<NavigationDestination> _bottomNavigationBarItems = [
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
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
        routes: _routes,
        bottomNavigationBuilder: (context, tabsRouter) => NavigationBar(
              destinations: _bottomNavigationBarItems,
              selectedIndex: tabsRouter.activeIndex,
              onDestinationSelected: (value) => _onTap(value, tabsRouter),
            ));
  }

  void _onTap(int selectedIndex, TabsRouter tabsRouter) {
    tabsRouter.setActiveIndex(selectedIndex);
  }
}
