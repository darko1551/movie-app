import 'package:movie_app/core/error/either_app_failure_or.dart';
import 'package:movie_app/core/entity/movie.dart';
import 'package:movie_app/core/entity/movie_result.dart';
import 'package:movie_app/core/localization/locale_Enum.dart';

abstract class IMovieRepository {
  EitherAppFailureOr<MovieResult> fetchNowShowingMovieResults(int page, LocaleEnum locale);
  EitherAppFailureOr<MovieResult> fetchPopularMovieResults(int page, LocaleEnum locale);
  EitherAppFailureOr<Stream<List<Movie>>> fetchFavoriteMoviesStream();
  EitherAppFailureOr<List<Movie>> fetchFavoriteMovies();
}
