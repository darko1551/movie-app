import 'package:movie_app/core/entity/movie_result.dart';
import 'package:movie_app/core/error/either_app_failure_or.dart';
import 'package:movie_app/core/localization/locale_Enum.dart';

abstract class IMovieSearchRepository {
  EitherAppFailureOr<MovieResult> fetchMoviesByQuery(int page, String query, LocaleEnum locale, String year);
}
