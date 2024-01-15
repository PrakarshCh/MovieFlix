// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:ttn_flix/data/models/movie_model.dart' as _i8;
import 'package:ttn_flix/screens/account/account_screen.dart' as _i1;
import 'package:ttn_flix/screens/bottomBar/bottom_bar.dart' as _i2;
import 'package:ttn_flix/screens/favourites/favourites_screen.dart' as _i3;
import 'package:ttn_flix/screens/home/home_detail_screen.dart' as _i5;
import 'package:ttn_flix/screens/home/home_screen.dart' as _i4;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    AccountRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.Account(),
      );
    },
    AppBottomBarRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.AppBottomBar(),
      );
    },
    FavouritesPageRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.FavouritesPage(),
      );
    },
    HomePageRoute.name: (routeData) {
      final args = routeData.argsAs<HomePageRouteArgs>(
          orElse: () => const HomePageRouteArgs());
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.HomePage(key: args.key),
      );
    },
    MovieDetailScreenRoute.name: (routeData) {
      final args = routeData.argsAs<MovieDetailScreenRouteArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.MovieDetailScreen(
          key: args.key,
          movie: args.movie,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.Account]
class AccountRoute extends _i6.PageRouteInfo<void> {
  const AccountRoute({List<_i6.PageRouteInfo>? children})
      : super(
          AccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AppBottomBar]
class AppBottomBarRoute extends _i6.PageRouteInfo<void> {
  const AppBottomBarRoute({List<_i6.PageRouteInfo>? children})
      : super(
          AppBottomBarRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppBottomBarRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i3.FavouritesPage]
class FavouritesPageRoute extends _i6.PageRouteInfo<void> {
  const FavouritesPageRoute({List<_i6.PageRouteInfo>? children})
      : super(
          FavouritesPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavouritesPageRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i4.HomePage]
class HomePageRoute extends _i6.PageRouteInfo<HomePageRouteArgs> {
  HomePageRoute({
    _i7.Key? key,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          HomePageRoute.name,
          args: HomePageRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HomePageRoute';

  static const _i6.PageInfo<HomePageRouteArgs> page =
      _i6.PageInfo<HomePageRouteArgs>(name);
}

class HomePageRouteArgs {
  const HomePageRouteArgs({this.key});

  final _i7.Key? key;

  @override
  String toString() {
    return 'HomePageRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.MovieDetailScreen]
class MovieDetailScreenRoute
    extends _i6.PageRouteInfo<MovieDetailScreenRouteArgs> {
  MovieDetailScreenRoute({
    _i7.Key? key,
    required _i8.MovieData movie,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          MovieDetailScreenRoute.name,
          args: MovieDetailScreenRouteArgs(
            key: key,
            movie: movie,
          ),
          initialChildren: children,
        );

  static const String name = 'MovieDetailScreenRoute';

  static const _i6.PageInfo<MovieDetailScreenRouteArgs> page =
      _i6.PageInfo<MovieDetailScreenRouteArgs>(name);
}

class MovieDetailScreenRouteArgs {
  const MovieDetailScreenRouteArgs({
    this.key,
    required this.movie,
  });

  final _i7.Key? key;

  final _i8.MovieData movie;

  @override
  String toString() {
    return 'MovieDetailScreenRouteArgs{key: $key, movie: $movie}';
  }
}
