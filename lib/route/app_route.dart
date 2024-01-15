import 'package:auto_route/auto_route.dart';

import 'app_route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: AppBottomBarRoute.page, initial: true),
        AutoRoute(page: HomePageRoute.page),
        AutoRoute(page: MovieDetailScreenRoute.page),
      ];
}
