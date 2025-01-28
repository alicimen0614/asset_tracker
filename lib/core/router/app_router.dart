import 'package:auto_route/auto_route.dart';
import 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: MainRoute.page),
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(
          page: LoginRoute.page,
        ),
        AutoRoute(
          path: '/main',
          page: MainRoute.page,
          children: [
            AutoRoute(page: HomeRoute.page, path: 'home'),
            AutoRoute(page: UserRoute.page, path: 'user'),
          ],
        ),
      ];
}

final router = AppRouter();
