import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/entity/movie_result.dart';
import 'package:movie_app/core/error/app_failure.dart';
import 'package:movie_app/core/error/either_app_failure_or.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/core/localization/locale_Enum.dart';

import 'package:movie_app/core/network/api/api_client.dart';
import 'package:movie_app/feature/movie_search/data/repository/i_movie_search_repository.dart';

@LazySingleton(as: IMovieSearchRepository)
class MovieSearchRepository implements IMovieSearchRepository {
  final ApiClient _apiClient;

  MovieSearchRepository(this._apiClient);

  @override
  EitherAppFailureOr<MovieResult> fetchMoviesByQuery(
      int page, String query, LocaleEnum locale, String year) async {
    try {
      final response = await _apiClient.search(page, query, locale.tmdbApiCode, year);
      return Right(response.toDomain());
    } on DioException catch (e) {
      return Left(AppFailure.fromDioErrorResponse(e));
    } on Exception catch (_) {
      return Left(Failure.server.appFailure);
    }
  }
}
