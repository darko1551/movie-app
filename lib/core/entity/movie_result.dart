import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/core/entity/movie.dart';

part 'movie_result.freezed.dart';
part 'movie_result.g.dart';

@freezed
abstract class MovieResult with _$MovieResult {
  const factory MovieResult({
    required int? page,
    required int? totalPages,
    required int? totalResults,
    required List<Movie>? results,
  }) = _MovieResult;

  factory MovieResult.fromJson(Map<String, dynamic> json) => _$MovieResultFromJson(json);
}
