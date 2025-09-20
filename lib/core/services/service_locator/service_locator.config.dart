// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../../feature/movie_details/data/repository/i_movie_details_repository.dart'
    as _i170;
import '../../../feature/movie_details/data/repository/movie_details_repository.dart'
    as _i581;
import '../../../feature/movie_details/domain/bloc/movie_details/movie_details_bloc.dart'
    as _i646;
import '../../../feature/movie_details/domain/bloc/movie_details_favorite/movie_details_favorite_bloc.dart'
    as _i317;
import '../../../feature/movie_search/data/repository/i_movie_search_repository.dart'
    as _i273;
import '../../../feature/movie_search/data/repository/movie_search_repository.dart'
    as _i890;
import '../../../feature/movie_search/domain/bloc/movie_search_bloc.dart'
    as _i44;
import '../../../feature/movies/data/repository/i_movie_repository.dart'
    as _i589;
import '../../../feature/movies/data/repository/movie_repository.dart' as _i111;
import '../../../feature/movies/domain/bloc/favorite/favorite_bloc.dart'
    as _i178;
import '../../../feature/movies/domain/bloc/now_showing/now_showing_bloc.dart'
    as _i447;
import '../../../feature/movies/domain/bloc/popular/popular_bloc.dart' as _i273;
import '../../../feature/movies/domain/bloc/see_more/see_more_bloc.dart'
    as _i107;
import '../../database/app_database.dart' as _i234;
import '../../localization/bloc/localization_bloc.dart' as _i958;
import '../../navigation/app_router.dart' as _i783;
import '../../navigation/bottom_navigation/bloc/bottom_navigation_bloc.dart'
    as _i477;
import '../../network/api/api_client.dart' as _i92;
import '../../network/api/dio_provider.dart' as _i378;
import '../../theme/bloc/bloc/theme_bloc.dart' as _i156;
import '../storage_service/i_storage_service.dart' as _i327;
import '../storage_service/shared_preferences_service.dart' as _i153;
import 'service_locator.dart' as _i105;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    final dioProvider = _$DioProvider();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.singleton<_i234.AppDatabase>(() => _i234.AppDatabase());
    gh.singleton<_i361.Dio>(() => dioProvider.dio);
    gh.singleton<_i477.BottomNavigationBloc>(
        () => _i477.BottomNavigationBloc());
    gh.singleton<_i783.AppRouter>(() => _i783.AppRouter());
    gh.singleton<_i327.IStorageService>(
        () => _i153.SharedPreferencesService(gh<_i460.SharedPreferences>()));
    gh.factory<_i92.ApiClient>(() => _i92.ApiClient.new(gh<_i361.Dio>()));
    gh.singleton<_i156.ThemeBloc>(
        () => _i156.ThemeBloc(gh<_i327.IStorageService>()));
    gh.singleton<_i958.LocalizationBloc>(
        () => _i958.LocalizationBloc(gh<_i327.IStorageService>()));
    gh.lazySingleton<_i170.IMovieDetailsRepository>(
        () => _i581.MovieDetailsRepository(
              gh<_i92.ApiClient>(),
              gh<_i234.AppDatabase>(),
            ));
    gh.singleton<_i646.MovieDetailsBloc>(() => _i646.MovieDetailsBloc(
          gh<_i170.IMovieDetailsRepository>(),
          gh<_i958.LocalizationBloc>(),
        ));
    gh.lazySingleton<_i589.IMovieRepository>(() => _i111.MovieRepository(
          gh<_i92.ApiClient>(),
          gh<_i234.AppDatabase>(),
        ));
    gh.lazySingleton<_i273.IMovieSearchRepository>(
        () => _i890.MovieSearchRepository(gh<_i92.ApiClient>()));
    gh.singleton<_i107.SeeMoreBloc>(() => _i107.SeeMoreBloc(
          gh<_i589.IMovieRepository>(),
          gh<_i958.LocalizationBloc>(),
        ));
    gh.singleton<_i273.PopularBloc>(() => _i273.PopularBloc(
          gh<_i589.IMovieRepository>(),
          gh<_i958.LocalizationBloc>(),
        ));
    gh.singleton<_i447.NowShowingBloc>(() => _i447.NowShowingBloc(
          gh<_i589.IMovieRepository>(),
          gh<_i958.LocalizationBloc>(),
        ));
    gh.singleton<_i178.FavoriteBloc>(
        () => _i178.FavoriteBloc(gh<_i589.IMovieRepository>()));
    gh.singleton<_i44.MovieSearchBloc>(() => _i44.MovieSearchBloc(
          gh<_i273.IMovieSearchRepository>(),
          gh<_i958.LocalizationBloc>(),
        ));
    gh.singleton<_i317.MovieDetailsFavoriteBloc>(() =>
        _i317.MovieDetailsFavoriteBloc(gh<_i170.IMovieDetailsRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i105.RegisterModule {}

class _$DioProvider extends _i378.DioProvider {}
