import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/core/models/movie_response.dart';
import 'package:movie_app/core/entity/movie_result.dart';

part 'movie_result_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MovieResultResponse {
  MovieResultResponse({
    required this.page,
    required this.totalPages,
    required this.totalResults,
    required this.results,
  });

  int? page;
  int? totalPages;
  int? totalResults;
  List<MovieResponse>? results;

  factory MovieResultResponse.fromJson(Map<String, dynamic> json) => _$MovieResultResponseFromJson(json);

  MovieResult toDomain() => MovieResult(
        page: page,
        totalPages: totalPages,
        totalResults: totalResults,
        results: results?.map((element) => element.toDomain()).toList(),
      );
}
