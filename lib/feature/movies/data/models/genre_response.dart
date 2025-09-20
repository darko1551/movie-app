import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/feature/movies/domain/entities/genre.dart';

part 'genre_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class GenreResponse {
  GenreResponse({
    required this.id,
    required this.name,
  });

  int? id;
  String? name;

  factory GenreResponse.fromJson(Map<String, dynamic> json) => _$GenreResponseFromJson(json);

  Genre toDomain() => Genre(
        id: id,
        name: name,
      );
}
