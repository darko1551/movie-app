import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/localization/bloc/localization_bloc.dart';
import 'package:movie_app/core/navigation/bottom_navigation/bloc/bottom_navigation_bloc.dart';
import 'package:movie_app/core/services/service_locator/service_locator.dart';
import 'package:movie_app/core/theme/bloc/bloc/theme_bloc.dart';
import 'package:movie_app/feature/movie_details/domain/bloc/movie_details/movie_details_bloc.dart';
import 'package:movie_app/feature/movie_details/domain/bloc/movie_details_favorite/movie_details_favorite_bloc.dart';
import 'package:movie_app/feature/movie_search/domain/bloc/movie_search_bloc.dart';
import 'package:movie_app/feature/movies/domain/bloc/favorite/favorite_bloc.dart';
import 'package:movie_app/feature/movies/domain/bloc/now_showing/now_showing_bloc.dart';
import 'package:movie_app/feature/movies/domain/bloc/popular/popular_bloc.dart';
import 'package:movie_app/feature/movies/domain/bloc/see_more/see_more_bloc.dart';

List<BlocProvider> appBlocProviders = [
  BlocProvider<NowShowingBloc>(create: (context) => serviceLocator<NowShowingBloc>()),
  BlocProvider<PopularBloc>(create: (context) => serviceLocator<PopularBloc>()),
  BlocProvider<MovieDetailsBloc>(create: (context) => serviceLocator<MovieDetailsBloc>()),
  BlocProvider<SeeMoreBloc>(create: (context) => serviceLocator<SeeMoreBloc>()),
  BlocProvider<FavoriteBloc>(create: (context) => serviceLocator<FavoriteBloc>()),
  BlocProvider<BottomNavigationBloc>(create: (context) => serviceLocator<BottomNavigationBloc>()),
  BlocProvider<MovieSearchBloc>(create: (context) => serviceLocator<MovieSearchBloc>()),
  BlocProvider<MovieDetailsFavoriteBloc>(create: (context) => serviceLocator<MovieDetailsFavoriteBloc>()),
  BlocProvider<LocalizationBloc>(
    create: (context) => serviceLocator<LocalizationBloc>()..add(LocalizationEvent.loadInitialLocale()),
  ),
  BlocProvider<ThemeBloc>(
      create: (context) => serviceLocator<ThemeBloc>()..add(ThemeEvent.loadInitThemeMode())),
];
