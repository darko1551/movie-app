import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/database/app_database.dart';
import 'package:movie_app/core/database/tables/movie_table.dart';
import 'package:movie_app/core/entity/movie.dart';
import 'package:movie_app/core/error/app_failure.dart';
import 'package:movie_app/core/error/either_app_failure_or.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/core/localization/locale_Enum.dart';
import 'package:movie_app/core/network/api/api_client.dart';
import 'package:movie_app/feature/movie_details/data/repository/i_movie_details_repository.dart';
import 'package:movie_app/feature/movie_details/domain/entities/movie_details.dart';

@LazySingleton(as: IMovieDetailsRepository)
class MovieDetailsRepository implements IMovieDetailsRepository {
  final ApiClient _apiClient;
  final AppDatabase _appDatabase;

  MovieDetailsRepository(this._apiClient, this._appDatabase);

  @override
  EitherAppFailureOr<MovieDetails> fetchMovieDetails(int movieId, LocaleEnum locale) async {
    try {
      final response = await _apiClient.movieDetails(movieId, locale.tmdbApiCode);
      return Right(response.toDomain());
    } on DioException catch (e) {
      return Left(AppFailure.fromDioErrorResponse(e));
    } on Exception catch (_) {
      return Left(Failure.server.appFailure);
    }
  }

  @override
  EitherAppFailureOr<Unit> addOrRemoveFavorite(Movie movie) async {
    try {
      var alreadyFavoriteResponse = await isFavoriteMovie(movie.id!);
      return alreadyFavoriteResponse.fold(
        (l) {
          return Left(Failure.database.appFailure);
        },
        (exists) async {
          if (exists) {
            var query = _appDatabase.delete(_appDatabase.movieTable)
              ..where((tbl) => tbl.id.equals(movie.id!));
            await query.go();
            return Right(unit);
          } else {
            MovieTableCompanion movieTableCompanion = movie.toCompanion();
            await _appDatabase.into(_appDatabase.movieTable).insert(
                  movieTableCompanion,
                  mode: InsertMode.insertOrFail,
                );
            return Right(unit);
          }
        },
      );
    } catch (e) {
      return Left(Failure.database.appFailure);
    }
  }

  @override
  EitherAppFailureOr<bool> isFavoriteMovie(int movieId) async {
    try {
      var query = _appDatabase.select(_appDatabase.movieTable)..where((tbl) => tbl.id.equals(movieId));
      final movie = await query.getSingleOrNull();
      return Right(movie != null);
    } catch (e) {
      return Left(Failure.database.appFailure);
    }
  }

  @override
  EitherAppFailureOr<Stream<bool>> isFavoriteMovieStream(int movieId) async {
    try {
      var query = _appDatabase.select(_appDatabase.movieTable)..where((tbl) => tbl.id.equals(movieId));
      final stream = query.watch().map((row) => row.isNotEmpty);
      return Right(stream);
    } catch (e) {
      return Left(Failure.database.appFailure);
    }
  }
}
