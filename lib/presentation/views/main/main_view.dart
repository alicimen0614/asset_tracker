import 'package:asset_tracker/presentation/views/main/mixins/main_state_mixin.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> with MainStateMixin {
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
        routes: routes,
        bottomNavigationBuilder: (context, tabsRouter) => NavigationBar(
              destinations: bottomNavigationBarItems,
              selectedIndex: tabsRouter.activeIndex,
              onDestinationSelected: (value) => _onTap(value, tabsRouter),
            ));
  }

  void _onTap(int selectedIndex, TabsRouter tabsRouter) {
    tabsRouter.setActiveIndex(selectedIndex);
  }
}
