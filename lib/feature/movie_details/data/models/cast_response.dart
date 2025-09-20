import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/feature/movie_details/domain/entities/cast.dart';

part 'cast_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CastResponse {
  CastResponse({
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.character,
    required this.profilePath,
  });

  int? id;
  String? knownForDepartment;
  String? name;
  String? character;
  String? profilePath;

  factory CastResponse.fromJson(Map<String, dynamic> json) => _$CastResponseFromJson(json);

  Cast toDomain() => Cast(
      id: id,
      knownForDepartment: knownForDepartment,
      name: name,
      character: character,
      profilePath: profilePath);
}
