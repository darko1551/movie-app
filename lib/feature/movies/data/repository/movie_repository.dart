import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/database/app_database.dart';
import 'package:movie_app/core/error/app_failure.dart';
import 'package:movie_app/core/error/either_app_failure_or.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/core/localization/locale_Enum.dart';
import 'package:movie_app/core/network/api/api_client.dart';
import 'package:movie_app/core/database/tables/movie_table.dart';
import 'package:movie_app/feature/movies/data/repository/i_movie_repository.dart';
import 'package:movie_app/core/entity/movie.dart';
import 'package:movie_app/core/entity/movie_result.dart';

@LazySingleton(as: IMovieRepository)
class MovieRepository implements IMovieRepository {
  final ApiClient _apiClient;
  final AppDatabase _appDatabase;

  MovieRepository(
    this._apiClient,
    this._appDatabase,
  );

  @override
  EitherAppFailureOr<MovieResult> fetchNowShowingMovieResults(int page, LocaleEnum locale) async {
    try {
      final response = await _apiClient.nowShowing(page, locale.tmdbApiCode);
      return Right(response.toDomain());
    } on DioException catch (e) {
      return Left(AppFailure.fromDioErrorResponse(e));
    } on Exception catch (_) {
      return Left(Failure.server.appFailure);
    }
  }

  @override
  EitherAppFailureOr<MovieResult> fetchPopularMovieResults(int page, LocaleEnum locale) async {
    try {
      final response = await _apiClient.popular(page, locale.tmdbApiCode);
      return Right(response.toDomain());
    } on DioException catch (e) {
      return Left(AppFailure.fromDioErrorResponse(e));
    } on Exception catch (_) {
      return Left(Failure.server.appFailure);
    }
  }

  @override
  EitherAppFailureOr<Stream<List<Movie>>> fetchFavoriteMoviesStream() async {
    try {
      var moviesStream = _appDatabase
          .select(_appDatabase.movieTable)
          .watch()
          .map((rows) => rows.map((companion) => companion.toDomain()).toList());
      return Right(moviesStream);
    } catch (e) {
      return Left(Failure.database.appFailure);
    }
  }

  @override
  EitherAppFailureOr<List<Movie>> fetchFavoriteMovies() async {
    try {
      List<MovieTableData> movieTableData = await _appDatabase.select(_appDatabase.movieTable).get();
      var movies = movieTableData.map((companion) => companion.toDomain()).toList();
      return Right(movies);
    } catch (e) {
      return Left(Failure.database.appFailure);
    }
  }
}
