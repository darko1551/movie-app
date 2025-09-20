import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/feature/movie_details/domain/entities/cast.dart';

part 'cast_result.freezed.dart';
part 'cast_result.g.dart';

@freezed
abstract class CastResult with _$CastResult {
  factory CastResult({
    required List<Cast>? cast,
  }) = _CastResult;

  factory CastResult.fromJson(Map<String, dynamic> json) => _$CastResultFromJson(json);
}
