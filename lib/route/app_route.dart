import 'package:auto_route/auto_route.dart';
import 'app_route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: OnboardingRoute.page),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: SignupPageRoute.page),
        AutoRoute(page: AppBottomBarRoute.page),
        AutoRoute(page: HomeScreenRoute.page, initial: false),
        AutoRoute(page: MovieDetailScreenRoute.page),
        AutoRoute(page: EditAccountRoute.page),
        AutoRoute(page: SplashScreenRoute.page, initial: true),
      ];
}
