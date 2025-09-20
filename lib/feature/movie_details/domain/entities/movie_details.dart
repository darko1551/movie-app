import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/feature/movie_details/domain/entities/cast.dart';
import 'package:movie_app/feature/movies/domain/entities/genre.dart';

part 'movie_details.freezed.dart';
part 'movie_details.g.dart';

@freezed
abstract class MovieDetails with _$MovieDetails {
  factory MovieDetails({
    required int? id,
    required String? title,
    required String? originalLanguage,
    required String? posterPath,
    required int? runtime,
    required double? voteAverage,
    required String? overview,
    required List<Genre>? genres,
    required List<Cast>? cast,
    required DateTime? releaseDate,
  }) = _MovieDetails;

  factory MovieDetails.fromJson(Map<String, dynamic> json) => _$MovieDetailsFromJson(json);
}
