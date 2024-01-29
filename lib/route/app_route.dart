import 'package:auto_route/auto_route.dart';
import 'app_route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: OnboardingRoute.page, initial: true),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: SignupPageRoute.page),
        AutoRoute(page: AppBottomBarRoute.page),
        AutoRoute(page: HomePageRoute.page),
        AutoRoute(page: MovieDetailScreenRoute.page),
        AutoRoute(page: EditAccountRoute.page),
      ];
}
