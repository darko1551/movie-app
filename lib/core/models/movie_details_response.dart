import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/core/models/cast_result_response.dart';
import 'package:movie_app/core/models/genre_response.dart';
import 'package:movie_app/feature/movie_details/domain/entities/movie_details.dart';

part 'movie_details_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MovieDetailsResponse {
  MovieDetailsResponse({
    required this.id,
    required this.title,
    required this.originalLanguage,
    required this.posterPath,
    required this.runtime,
    required this.voteAverage,
    required this.overview,
    required this.genres,
    required this.credits,
    required this.releaseDate,
  });

  int? id;
  String? title;
  String? originalLanguage;
  String? posterPath;
  int? runtime;
  double? voteAverage;
  String? overview;
  List<GenreResponse>? genres;
  CastResultResponse? credits;
  DateTime? releaseDate;

  factory MovieDetailsResponse.fromJson(Map<String, dynamic> json) => _$MovieDetailsResponseFromJson(json);

  MovieDetails toDomain() => MovieDetails(
        id: id,
        title: title,
        originalLanguage: originalLanguage,
        posterPath: posterPath,
        runtime: runtime,
        voteAverage: voteAverage,
        overview: overview,
        genres: genres?.map((genre) => genre.toDomain()).toList() ?? [],
        cast: credits?.cast?.map((cast) => cast.toDomain()).toList() ?? [],
        releaseDate: releaseDate,
      );
}
