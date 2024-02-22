// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i13;
import 'package:flutter/material.dart' as _i14;
import 'package:ttn_flix/data/models/movie_model.dart' as _i15;
import 'package:ttn_flix/screens/account/account_screen.dart' as _i1;
import 'package:ttn_flix/screens/account/edit_account/edit_account_screen.dart'
    as _i3;
import 'package:ttn_flix/screens/authentication/login/login_screen.dart' as _i7;
import 'package:ttn_flix/screens/authentication/signup/signup_screen.dart'
    as _i11;
import 'package:ttn_flix/screens/bottomBar/bottom_bar.dart' as _i2;
import 'package:ttn_flix/screens/favourites/favourites_screen.dart' as _i4;
import 'package:ttn_flix/screens/home/home_detail_screen.dart' as _i8;
import 'package:ttn_flix/screens/home/home_screen.dart' as _i6;
import 'package:ttn_flix/screens/home/widgets/home_movie_item_view.dart' as _i9;
import 'package:ttn_flix/screens/home/widgets/home_movie_list_view.dart' as _i5;
import 'package:ttn_flix/screens/onboarding/onboarding_screen.dart' as _i10;
import 'package:ttn_flix/screens/splash/splash_screen.dart' as _i12;

abstract class $AppRouter extends _i13.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i13.PageFactory> pagesMap = {
    AccountScreenRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AccountScreen(),
      );
    },
    AppBottomBarRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.AppBottomBar(),
      );
    },
    EditAccountRoute.name: (routeData) {
      final args = routeData.argsAs<EditAccountRouteArgs>();
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.EditAccount(
          key: args.key,
          isUpdated: args.isUpdated,
        ),
      );
    },
    FavouritesPageRoute.name: (routeData) {
      final args = routeData.argsAs<FavouritesPageRouteArgs>(
          orElse: () => const FavouritesPageRouteArgs());
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.FavouritesPage(key: args.key),
      );
    },
    HomeMovieListRoute.name: (routeData) {
      final args = routeData.argsAs<HomeMovieListRouteArgs>();
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.HomeMovieList(
          args.title,
          args.movieList,
          key: args.key,
          wishListItems: args.wishListItems,
        ),
      );
    },
    HomePageRoute.name: (routeData) {
      final args = routeData.argsAs<HomePageRouteArgs>(
          orElse: () => const HomePageRouteArgs());
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.HomePage(key: args.key),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.Login(key: args.key),
      );
    },
    MovieDetailScreenRoute.name: (routeData) {
      final args = routeData.argsAs<MovieDetailScreenRouteArgs>();
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.MovieDetailScreen(
          key: args.key,
          movie: args.movie,
          title: args.title,
          isClicked: args.isClicked,
        ),
      );
    },
    MovieItemRoute.name: (routeData) {
      final args = routeData.argsAs<MovieItemRouteArgs>();
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.MovieItem(
          args.movie,
          key: args.key,
          isFavourite: args.isFavourite,
          title: args.title,
          isClicked: args.isClicked,
        ),
      );
    },
    OnboardingRoute.name: (routeData) {
      final args = routeData.argsAs<OnboardingRouteArgs>(
          orElse: () => const OnboardingRouteArgs());
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.Onboarding(key: args.key),
      );
    },
    SignupPageRoute.name: (routeData) {
      final args = routeData.argsAs<SignupPageRouteArgs>(
          orElse: () => const SignupPageRouteArgs());
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.SignupPage(key: args.key),
      );
    },
    SplashScreenRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AccountScreen]
class AccountScreenRoute extends _i13.PageRouteInfo<void> {
  const AccountScreenRoute({List<_i13.PageRouteInfo>? children})
      : super(
          AccountScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountScreenRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AppBottomBar]
class AppBottomBarRoute extends _i13.PageRouteInfo<void> {
  const AppBottomBarRoute({List<_i13.PageRouteInfo>? children})
      : super(
          AppBottomBarRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppBottomBarRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i3.EditAccount]
class EditAccountRoute extends _i13.PageRouteInfo<EditAccountRouteArgs> {
  EditAccountRoute({
    _i14.Key? key,
    required Function isUpdated,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          EditAccountRoute.name,
          args: EditAccountRouteArgs(
            key: key,
            isUpdated: isUpdated,
          ),
          initialChildren: children,
        );

  static const String name = 'EditAccountRoute';

  static const _i13.PageInfo<EditAccountRouteArgs> page =
      _i13.PageInfo<EditAccountRouteArgs>(name);
}

class EditAccountRouteArgs {
  const EditAccountRouteArgs({
    this.key,
    required this.isUpdated,
  });

  final _i14.Key? key;

  final Function isUpdated;

  @override
  String toString() {
    return 'EditAccountRouteArgs{key: $key, isUpdated: $isUpdated}';
  }
}

/// generated route for
/// [_i4.FavouritesPage]
class FavouritesPageRoute extends _i13.PageRouteInfo<FavouritesPageRouteArgs> {
  FavouritesPageRoute({
    _i14.Key? key,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          FavouritesPageRoute.name,
          args: FavouritesPageRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'FavouritesPageRoute';

  static const _i13.PageInfo<FavouritesPageRouteArgs> page =
      _i13.PageInfo<FavouritesPageRouteArgs>(name);
}

class FavouritesPageRouteArgs {
  const FavouritesPageRouteArgs({this.key});

  final _i14.Key? key;

  @override
  String toString() {
    return 'FavouritesPageRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.HomeMovieList]
class HomeMovieListRoute extends _i13.PageRouteInfo<HomeMovieListRouteArgs> {
  HomeMovieListRoute({
    required String title,
    required List<_i15.MovieData> movieList,
    _i14.Key? key,
    List<int>? wishListItems,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          HomeMovieListRoute.name,
          args: HomeMovieListRouteArgs(
            title: title,
            movieList: movieList,
            key: key,
            wishListItems: wishListItems,
          ),
          initialChildren: children,
        );

  static const String name = 'HomeMovieListRoute';

  static const _i13.PageInfo<HomeMovieListRouteArgs> page =
      _i13.PageInfo<HomeMovieListRouteArgs>(name);
}

class HomeMovieListRouteArgs {
  const HomeMovieListRouteArgs({
    required this.title,
    required this.movieList,
    this.key,
    this.wishListItems,
  });

  final String title;

  final List<_i15.MovieData> movieList;

  final _i14.Key? key;

  final List<int>? wishListItems;

  @override
  String toString() {
    return 'HomeMovieListRouteArgs{title: $title, movieList: $movieList, key: $key, wishListItems: $wishListItems}';
  }
}

/// generated route for
/// [_i6.HomePage]
class HomePageRoute extends _i13.PageRouteInfo<HomePageRouteArgs> {
  HomePageRoute({
    _i14.Key? key,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          HomePageRoute.name,
          args: HomePageRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HomePageRoute';

  static const _i13.PageInfo<HomePageRouteArgs> page =
      _i13.PageInfo<HomePageRouteArgs>(name);
}

class HomePageRouteArgs {
  const HomePageRouteArgs({this.key});

  final _i14.Key? key;

  @override
  String toString() {
    return 'HomePageRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i7.Login]
class LoginRoute extends _i13.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i14.Key? key,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i13.PageInfo<LoginRouteArgs> page =
      _i13.PageInfo<LoginRouteArgs>(name);
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final _i14.Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i8.MovieDetailScreen]
class MovieDetailScreenRoute
    extends _i13.PageRouteInfo<MovieDetailScreenRouteArgs> {
  MovieDetailScreenRoute({
    _i14.Key? key,
    required _i15.MovieData movie,
    required String title,
    required dynamic Function() isClicked,
    List<_i13.PageRouteInfo>? children,
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

  static const _i13.PageInfo<MovieDetailScreenRouteArgs> page =
      _i13.PageInfo<MovieDetailScreenRouteArgs>(name);
}

class MovieDetailScreenRouteArgs {
  const MovieDetailScreenRouteArgs({
    this.key,
    required this.movie,
    required this.title,
    required this.isClicked,
  });

  final _i14.Key? key;

  final _i15.MovieData movie;

  final String title;

  final dynamic Function() isClicked;

  @override
  String toString() {
    return 'MovieDetailScreenRouteArgs{key: $key, movie: $movie, title: $title, isClicked: $isClicked}';
  }
}

/// generated route for
/// [_i9.MovieItem]
class MovieItemRoute extends _i13.PageRouteInfo<MovieItemRouteArgs> {
  MovieItemRoute({
    required _i15.MovieData movie,
    _i14.Key? key,
    bool isFavourite = false,
    required String title,
    required dynamic Function()? isClicked,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          MovieItemRoute.name,
          args: MovieItemRouteArgs(
            movie: movie,
            key: key,
            isFavourite: isFavourite,
            title: title,
            isClicked: isClicked,
          ),
          initialChildren: children,
        );

  static const String name = 'MovieItemRoute';

  static const _i13.PageInfo<MovieItemRouteArgs> page =
      _i13.PageInfo<MovieItemRouteArgs>(name);
}

class MovieItemRouteArgs {
  const MovieItemRouteArgs({
    required this.movie,
    this.key,
    this.isFavourite = false,
    required this.title,
    required this.isClicked,
  });

  final _i15.MovieData movie;

  final _i14.Key? key;

  final bool isFavourite;

  final String title;

  final dynamic Function()? isClicked;

  @override
  String toString() {
    return 'MovieItemRouteArgs{movie: $movie, key: $key, isFavourite: $isFavourite, title: $title, isClicked: $isClicked}';
  }
}

/// generated route for
/// [_i10.Onboarding]
class OnboardingRoute extends _i13.PageRouteInfo<OnboardingRouteArgs> {
  OnboardingRoute({
    _i14.Key? key,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          OnboardingRoute.name,
          args: OnboardingRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const _i13.PageInfo<OnboardingRouteArgs> page =
      _i13.PageInfo<OnboardingRouteArgs>(name);
}

class OnboardingRouteArgs {
  const OnboardingRouteArgs({this.key});

  final _i14.Key? key;

  @override
  String toString() {
    return 'OnboardingRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i11.SignupPage]
class SignupPageRoute extends _i13.PageRouteInfo<SignupPageRouteArgs> {
  SignupPageRoute({
    _i14.Key? key,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          SignupPageRoute.name,
          args: SignupPageRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SignupPageRoute';

  static const _i13.PageInfo<SignupPageRouteArgs> page =
      _i13.PageInfo<SignupPageRouteArgs>(name);
}

class SignupPageRouteArgs {
  const SignupPageRouteArgs({this.key});

  final _i14.Key? key;

  @override
  String toString() {
    return 'SignupPageRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i12.SplashScreen]
class SplashScreenRoute extends _i13.PageRouteInfo<void> {
  const SplashScreenRoute({List<_i13.PageRouteInfo>? children})
      : super(
          SplashScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashScreenRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}
