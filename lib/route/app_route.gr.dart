// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i12;
import 'package:flutter/material.dart' as _i13;
import 'package:ttn_flix/data/models/movie_model.dart' as _i14;
import 'package:ttn_flix/screens/account/account_screen.dart' as _i1;
import 'package:ttn_flix/screens/account/edit_account/edit_account_screen.dart'
    as _i3;
import 'package:ttn_flix/screens/authentication/login/login_screen.dart' as _i6;
import 'package:ttn_flix/screens/authentication/signup/signup_screen.dart'
    as _i10;
import 'package:ttn_flix/screens/bottomBar/bottom_bar.dart' as _i2;
import 'package:ttn_flix/screens/favourites/favourites_screen.dart' as _i4;
import 'package:ttn_flix/screens/home/home_detail_screen.dart' as _i7;
import 'package:ttn_flix/screens/home/home_screen.dart' as _i5;
import 'package:ttn_flix/screens/home/widgets/home_movie_item_view.dart' as _i8;
import 'package:ttn_flix/screens/onboarding/onboarding_screen.dart' as _i9;
import 'package:ttn_flix/screens/splash/splash_screen.dart' as _i11;

abstract class $AppRouter extends _i12.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    AccountScreenRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AccountScreen(),
      );
    },
    AppBottomBarRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.AppBottomBar(),
      );
    },
    EditAccountRoute.name: (routeData) {
      final args = routeData.argsAs<EditAccountRouteArgs>();
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.EditAccount(
          key: args.key,
          isUpdated: args.isUpdated,
        ),
      );
    },
    FavoriteScreenRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.FavoriteScreen(),
      );
    },
    HomeScreenRoute.name: (routeData) {
      final args = routeData.argsAs<HomeScreenRouteArgs>(
          orElse: () => const HomeScreenRouteArgs());
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.HomeScreen(key: args.key),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.Login(key: args.key),
      );
    },
    MovieDetailScreenRoute.name: (routeData) {
      final args = routeData.argsAs<MovieDetailScreenRouteArgs>();
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.MovieDetailScreen(
          key: args.key,
          movie: args.movie,
          title: args.title,
          isClicked: args.isClicked,
        ),
      );
    },
    MovieItemWidgetRoute.name: (routeData) {
      final args = routeData.argsAs<MovieItemWidgetRouteArgs>();
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.MovieItemWidget(
          key: args.key,
          movie: args.movie,
          bannerWidget: args.bannerWidget,
          isFromHomeView: args.isFromHomeView,
          isClicked: args.isClicked,
        ),
      );
    },
    OnboardingRoute.name: (routeData) {
      final args = routeData.argsAs<OnboardingRouteArgs>(
          orElse: () => const OnboardingRouteArgs());
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.Onboarding(key: args.key),
      );
    },
    SignupPageRoute.name: (routeData) {
      final args = routeData.argsAs<SignupPageRouteArgs>(
          orElse: () => const SignupPageRouteArgs());
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.SignupPage(key: args.key),
      );
    },
    SplashScreenRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AccountScreen]
class AccountScreenRoute extends _i12.PageRouteInfo<void> {
  const AccountScreenRoute({List<_i12.PageRouteInfo>? children})
      : super(
          AccountScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountScreenRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AppBottomBar]
class AppBottomBarRoute extends _i12.PageRouteInfo<void> {
  const AppBottomBarRoute({List<_i12.PageRouteInfo>? children})
      : super(
          AppBottomBarRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppBottomBarRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i3.EditAccount]
class EditAccountRoute extends _i12.PageRouteInfo<EditAccountRouteArgs> {
  EditAccountRoute({
    _i13.Key? key,
    required Function isUpdated,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          EditAccountRoute.name,
          args: EditAccountRouteArgs(
            key: key,
            isUpdated: isUpdated,
          ),
          initialChildren: children,
        );

  static const String name = 'EditAccountRoute';

  static const _i12.PageInfo<EditAccountRouteArgs> page =
      _i12.PageInfo<EditAccountRouteArgs>(name);
}

class EditAccountRouteArgs {
  const EditAccountRouteArgs({
    this.key,
    required this.isUpdated,
  });

  final _i13.Key? key;

  final Function isUpdated;

  @override
  String toString() {
    return 'EditAccountRouteArgs{key: $key, isUpdated: $isUpdated}';
  }
}

/// generated route for
/// [_i4.FavoriteScreen]
class FavoriteScreenRoute extends _i12.PageRouteInfo<void> {
  const FavoriteScreenRoute({List<_i12.PageRouteInfo>? children})
      : super(
          FavoriteScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavoriteScreenRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i5.HomeScreen]
class HomeScreenRoute extends _i12.PageRouteInfo<HomeScreenRouteArgs> {
  HomeScreenRoute({
    _i13.Key? key,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          HomeScreenRoute.name,
          args: HomeScreenRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HomeScreenRoute';

  static const _i12.PageInfo<HomeScreenRouteArgs> page =
      _i12.PageInfo<HomeScreenRouteArgs>(name);
}

class HomeScreenRouteArgs {
  const HomeScreenRouteArgs({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return 'HomeScreenRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i6.Login]
class LoginRoute extends _i12.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i13.Key? key,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i12.PageInfo<LoginRouteArgs> page =
      _i12.PageInfo<LoginRouteArgs>(name);
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i7.MovieDetailScreen]
class MovieDetailScreenRoute
    extends _i12.PageRouteInfo<MovieDetailScreenRouteArgs> {
  MovieDetailScreenRoute({
    _i13.Key? key,
    required _i14.MovieData movie,
    required String title,
    required dynamic Function() isClicked,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          MovieDetailScreenRoute.name,
          args: MovieDetailScreenRouteArgs(
            key: key,
            movie: movie,
            title: title,
            isClicked: isClicked,
          ),
          initialChildren: children,
        );

  static const String name = 'MovieDetailScreenRoute';

  static const _i12.PageInfo<MovieDetailScreenRouteArgs> page =
      _i12.PageInfo<MovieDetailScreenRouteArgs>(name);
}

class MovieDetailScreenRouteArgs {
  const MovieDetailScreenRouteArgs({
    this.key,
    required this.movie,
    required this.title,
    required this.isClicked,
  });

  final _i13.Key? key;

  final _i14.MovieData movie;

  final String title;

  final dynamic Function() isClicked;

  @override
  String toString() {
    return 'MovieDetailScreenRouteArgs{key: $key, movie: $movie, title: $title, isClicked: $isClicked}';
  }
}

/// generated route for
/// [_i8.MovieItemWidget]
class MovieItemWidgetRoute
    extends _i12.PageRouteInfo<MovieItemWidgetRouteArgs> {
  MovieItemWidgetRoute({
    _i13.Key? key,
    required _i14.MovieData movie,
    required _i13.Widget bannerWidget,
    required bool isFromHomeView,
    required dynamic Function()? isClicked,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          MovieItemWidgetRoute.name,
          args: MovieItemWidgetRouteArgs(
            key: key,
            movie: movie,
            bannerWidget: bannerWidget,
            isFromHomeView: isFromHomeView,
            isClicked: isClicked,
          ),
          initialChildren: children,
        );

  static const String name = 'MovieItemWidgetRoute';

  static const _i12.PageInfo<MovieItemWidgetRouteArgs> page =
      _i12.PageInfo<MovieItemWidgetRouteArgs>(name);
}

class MovieItemWidgetRouteArgs {
  const MovieItemWidgetRouteArgs({
    this.key,
    required this.movie,
    required this.bannerWidget,
    required this.isFromHomeView,
    required this.isClicked,
  });

  final _i13.Key? key;

  final _i14.MovieData movie;

  final _i13.Widget bannerWidget;

  final bool isFromHomeView;

  final dynamic Function()? isClicked;

  @override
  String toString() {
    return 'MovieItemWidgetRouteArgs{key: $key, movie: $movie, bannerWidget: $bannerWidget, isFromHomeView: $isFromHomeView, isClicked: $isClicked}';
  }
}

/// generated route for
/// [_i9.Onboarding]
class OnboardingRoute extends _i12.PageRouteInfo<OnboardingRouteArgs> {
  OnboardingRoute({
    _i13.Key? key,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          OnboardingRoute.name,
          args: OnboardingRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const _i12.PageInfo<OnboardingRouteArgs> page =
      _i12.PageInfo<OnboardingRouteArgs>(name);
}

class OnboardingRouteArgs {
  const OnboardingRouteArgs({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return 'OnboardingRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i10.SignupPage]
class SignupPageRoute extends _i12.PageRouteInfo<SignupPageRouteArgs> {
  SignupPageRoute({
    _i13.Key? key,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          SignupPageRoute.name,
          args: SignupPageRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SignupPageRoute';

  static const _i12.PageInfo<SignupPageRouteArgs> page =
      _i12.PageInfo<SignupPageRouteArgs>(name);
}

class SignupPageRouteArgs {
  const SignupPageRouteArgs({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return 'SignupPageRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i11.SplashScreen]
class SplashScreenRoute extends _i12.PageRouteInfo<void> {
  const SplashScreenRoute({List<_i12.PageRouteInfo>? children})
      : super(
          SplashScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashScreenRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}
