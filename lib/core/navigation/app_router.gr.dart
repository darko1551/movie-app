// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;
import 'package:movie_app/core/entity/movie.dart' as _i9;
import 'package:movie_app/feature/movie_details/presentation/movie_details_page.dart'
    as _i2;
import 'package:movie_app/feature/movie_search/presentation/movie_search_page.dart'
    as _i3;
import 'package:movie_app/feature/movies/domain/entities/movie_list_type.dart'
    as _i10;
import 'package:movie_app/feature/movies/presentation/movies_page.dart' as _i4;
import 'package:movie_app/feature/movies/presentation/widget/see_more_page.dart'
    as _i5;
import 'package:movie_app/feature/settings/presentation/settings_page.dart'
    as _i6;
import 'package:movie_app/main_screen.dart' as _i1;

/// generated route for
/// [_i1.MainScreen]
class MainRoute extends _i7.PageRouteInfo<MainRouteArgs> {
  MainRoute({_i8.Key? key, List<_i7.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          args: MainRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MainRouteArgs>(
        orElse: () => const MainRouteArgs(),
      );
      return _i1.MainScreen(key: args.key);
    },
  );
}

class MainRouteArgs {
  const MainRouteArgs({this.key});

  final _i8.Key? key;

  @override
  String toString() {
    return 'MainRouteArgs{key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! MainRouteArgs) return false;
    return key == other.key;
  }

  @override
  int get hashCode => key.hashCode;
}

/// generated route for
/// [_i2.MovieDetailsPage]
class MovieDetailsRoute extends _i7.PageRouteInfo<MovieDetailsRouteArgs> {
  MovieDetailsRoute({
    _i8.Key? key,
    required _i9.Movie movie,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          MovieDetailsRoute.name,
          args: MovieDetailsRouteArgs(key: key, movie: movie),
          initialChildren: children,
        );

  static const String name = 'MovieDetailsRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MovieDetailsRouteArgs>();
      return _i2.MovieDetailsPage(key: args.key, movie: args.movie);
    },
  );
}

class MovieDetailsRouteArgs {
  const MovieDetailsRouteArgs({this.key, required this.movie});

  final _i8.Key? key;

  final _i9.Movie movie;

  @override
  String toString() {
    return 'MovieDetailsRouteArgs{key: $key, movie: $movie}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! MovieDetailsRouteArgs) return false;
    return key == other.key && movie == other.movie;
  }

  @override
  int get hashCode => key.hashCode ^ movie.hashCode;
}

/// generated route for
/// [_i3.MovieSearchPage]
class MovieSearchRoute extends _i7.PageRouteInfo<void> {
  const MovieSearchRoute({List<_i7.PageRouteInfo>? children})
      : super(MovieSearchRoute.name, initialChildren: children);

  static const String name = 'MovieSearchRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i3.MovieSearchPage();
    },
  );
}

/// generated route for
/// [_i4.MoviesPage]
class MoviesRoute extends _i7.PageRouteInfo<void> {
  const MoviesRoute({List<_i7.PageRouteInfo>? children})
      : super(MoviesRoute.name, initialChildren: children);

  static const String name = 'MoviesRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i4.MoviesPage();
    },
  );
}

/// generated route for
/// [_i5.SeeMorePage]
class SeeMoreRoute extends _i7.PageRouteInfo<SeeMoreRouteArgs> {
  SeeMoreRoute({
    _i8.Key? key,
    required _i10.MovieListType movieListType,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          SeeMoreRoute.name,
          args: SeeMoreRouteArgs(key: key, movieListType: movieListType),
          initialChildren: children,
        );

  static const String name = 'SeeMoreRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SeeMoreRouteArgs>();
      return _i5.SeeMorePage(key: args.key, movieListType: args.movieListType);
    },
  );
}

class SeeMoreRouteArgs {
  const SeeMoreRouteArgs({this.key, required this.movieListType});

  final _i8.Key? key;

  final _i10.MovieListType movieListType;

  @override
  String toString() {
    return 'SeeMoreRouteArgs{key: $key, movieListType: $movieListType}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SeeMoreRouteArgs) return false;
    return key == other.key && movieListType == other.movieListType;
  }

  @override
  int get hashCode => key.hashCode ^ movieListType.hashCode;
}

/// generated route for
/// [_i6.SettingsPage]
class SettingsRoute extends _i7.PageRouteInfo<void> {
  const SettingsRoute({List<_i7.PageRouteInfo>? children})
      : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i6.SettingsPage();
    },
  );
}
