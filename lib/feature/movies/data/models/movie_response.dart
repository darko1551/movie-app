import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/core/entity/movie.dart';
import 'package:movie_app/core/network/api/converters/date_time_converter.dart';

part 'movie_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MovieResponse {
  MovieResponse({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.genreIds,
    required this.voteAverage,
    required this.releaseDate,
  });

  int? id;
  String? title;
  String? posterPath;
  List<int>? genreIds;
  double? voteAverage;
  @DateTimeConverter()
  DateTime? releaseDate;

  factory MovieResponse.fromJson(Map<String, dynamic> json) => _$MovieResponseFromJson(json);

  Movie toDomain() => Movie(
        id: id,
        title: title,
        posterPath: posterPath,
        genreIds: genreIds,
        voteAverage: voteAverage,
        releaseDate: releaseDate,
      );
}
