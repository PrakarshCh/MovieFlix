import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import '../presentation/Screens/Home.dart';
import '../presentation/Screens/HomeDetail.dart';
part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(page: DetailRoute.page),
      ];
}
