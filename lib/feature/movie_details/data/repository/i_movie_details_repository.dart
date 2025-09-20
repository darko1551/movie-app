import 'package:dartz/dartz.dart';
import 'package:movie_app/core/entity/movie.dart';
import 'package:movie_app/core/error/either_app_failure_or.dart';
import 'package:movie_app/core/localization/locale_Enum.dart';
import 'package:movie_app/feature/movie_details/domain/entities/movie_details.dart';

abstract class IMovieDetailsRepository {
  EitherAppFailureOr<MovieDetails> fetchMovieDetails(int movieId, LocaleEnum locale);
  EitherAppFailureOr<bool> isFavoriteMovie(int movieId);
  EitherAppFailureOr<Unit> addOrRemoveFavorite(Movie movie);
  EitherAppFailureOr<Stream<bool>> isFavoriteMovieStream(int movieId);
}
