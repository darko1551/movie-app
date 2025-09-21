import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/core/models/cast_response.dart';
import 'package:movie_app/feature/movie_details/domain/entities/cast_result.dart';

part 'cast_result_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CastResultResponse {
  CastResultResponse({
    required this.cast,
  });

  List<CastResponse>? cast;

  factory CastResultResponse.fromJson(Map<String, dynamic> json) => _$CastResultResponseFromJson(json);

  CastResult toDomain() => CastResult(cast: cast?.map((credit) => credit.toDomain()).toList());
}
