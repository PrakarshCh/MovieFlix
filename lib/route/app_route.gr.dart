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

abstract class $AppRouter extends _i12.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    AccountRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.Account(),
      );
    },
    AppBottomBarRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.AppBottomBar(),
      );
    },
    EditAccountRoute.name: (routeData) {
      final args = routeData.argsAs<EditAccountRouteArgs>(
          orElse: () => const EditAccountRouteArgs());
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.EditAccount(key: args.key),
      );
    },
    FavouritesPageRoute.name: (routeData) {
      final args = routeData.argsAs<FavouritesPageRouteArgs>(
          orElse: () => const FavouritesPageRouteArgs());
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.FavouritesPage(key: args.key),
      );
    },
    HomeMovieListRoute.name: (routeData) {
      final args = routeData.argsAs<HomeMovieListRouteArgs>();
      return _i12.AutoRoutePage<dynamic>(
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
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.HomePage(key: args.key),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.Login(key: args.key),
      );
    },
    MovieDetailScreenRoute.name: (routeData) {
      final args = routeData.argsAs<MovieDetailScreenRouteArgs>();
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.MovieDetailScreen(
          key: args.key,
          movie: args.movie,
          title: args.title,
        ),
      );
    },
    MovieItemRoute.name: (routeData) {
      final args = routeData.argsAs<MovieItemRouteArgs>();
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.MovieItem(
          args.movie,
          key: args.key,
          isFavourite: args.isFavourite,
          title: args.title,
        ),
      );
    },
    OnboardingRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.Onboarding(),
      );
    },
    SignupPageRoute.name: (routeData) {
      final args = routeData.argsAs<SignupPageRouteArgs>(
          orElse: () => const SignupPageRouteArgs());
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.SignupPage(key: args.key),
      );
    },
  };
}

/// generated route for
/// [_i1.Account]
class AccountRoute extends _i12.PageRouteInfo<void> {
  const AccountRoute({List<_i12.PageRouteInfo>? children})
      : super(
          AccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountRoute';

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
    List<_i12.PageRouteInfo>? children,
  }) : super(
          EditAccountRoute.name,
          args: EditAccountRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'EditAccountRoute';

  static const _i12.PageInfo<EditAccountRouteArgs> page =
      _i12.PageInfo<EditAccountRouteArgs>(name);
}

class EditAccountRouteArgs {
  const EditAccountRouteArgs({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return 'EditAccountRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.FavouritesPage]
class FavouritesPageRoute extends _i12.PageRouteInfo<FavouritesPageRouteArgs> {
  FavouritesPageRoute({
    _i13.Key? key,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          FavouritesPageRoute.name,
          args: FavouritesPageRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'FavouritesPageRoute';

  static const _i12.PageInfo<FavouritesPageRouteArgs> page =
      _i12.PageInfo<FavouritesPageRouteArgs>(name);
}

class FavouritesPageRouteArgs {
  const FavouritesPageRouteArgs({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return 'FavouritesPageRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.HomeMovieList]
class HomeMovieListRoute extends _i12.PageRouteInfo<HomeMovieListRouteArgs> {
  HomeMovieListRoute({
    required String title,
    required List<_i14.MovieData> movieList,
    _i13.Key? key,
    List<int>? wishListItems,
    List<_i12.PageRouteInfo>? children,
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

  static const _i12.PageInfo<HomeMovieListRouteArgs> page =
      _i12.PageInfo<HomeMovieListRouteArgs>(name);
}

class HomeMovieListRouteArgs {
  const HomeMovieListRouteArgs({
    required this.title,
    required this.movieList,
    this.key,
    this.wishListItems,
  });

  final String title;

  final List<_i14.MovieData> movieList;

  final _i13.Key? key;

  final List<int>? wishListItems;

  @override
  String toString() {
    return 'HomeMovieListRouteArgs{title: $title, movieList: $movieList, key: $key, wishListItems: $wishListItems}';
  }
}

/// generated route for
/// [_i6.HomePage]
class HomePageRoute extends _i12.PageRouteInfo<HomePageRouteArgs> {
  HomePageRoute({
    _i13.Key? key,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          HomePageRoute.name,
          args: HomePageRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HomePageRoute';

  static const _i12.PageInfo<HomePageRouteArgs> page =
      _i12.PageInfo<HomePageRouteArgs>(name);
}

class HomePageRouteArgs {
  const HomePageRouteArgs({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return 'HomePageRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i7.Login]
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
/// [_i8.MovieDetailScreen]
class MovieDetailScreenRoute
    extends _i12.PageRouteInfo<MovieDetailScreenRouteArgs> {
  MovieDetailScreenRoute({
    _i13.Key? key,
    required _i14.MovieData movie,
    required String title,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          MovieDetailScreenRoute.name,
          args: MovieDetailScreenRouteArgs(
            key: key,
            movie: movie,
            title: title,
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
  });

  final _i13.Key? key;

  final _i14.MovieData movie;

  final String title;

  @override
  String toString() {
    return 'MovieDetailScreenRouteArgs{key: $key, movie: $movie, title: $title}';
  }
}

/// generated route for
/// [_i9.MovieItem]
class MovieItemRoute extends _i12.PageRouteInfo<MovieItemRouteArgs> {
  MovieItemRoute({
    required _i14.MovieData movie,
    _i13.Key? key,
    bool isFavourite = false,
    required String title,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          MovieItemRoute.name,
          args: MovieItemRouteArgs(
            movie: movie,
            key: key,
            isFavourite: isFavourite,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'MovieItemRoute';

  static const _i12.PageInfo<MovieItemRouteArgs> page =
      _i12.PageInfo<MovieItemRouteArgs>(name);
}

class MovieItemRouteArgs {
  const MovieItemRouteArgs({
    required this.movie,
    this.key,
    this.isFavourite = false,
    required this.title,
  });

  final _i14.MovieData movie;

  final _i13.Key? key;

  final bool isFavourite;

  final String title;

  @override
  String toString() {
    return 'MovieItemRouteArgs{movie: $movie, key: $key, isFavourite: $isFavourite, title: $title}';
  }
}

/// generated route for
/// [_i10.Onboarding]
class OnboardingRoute extends _i12.PageRouteInfo<void> {
  const OnboardingRoute({List<_i12.PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i11.SignupPage]
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
