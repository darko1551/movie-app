import 'package:freezed_annotation/freezed_annotation.dart';

part 'cast.freezed.dart';
part 'cast.g.dart';

@freezed
abstract class Cast with _$Cast {
  factory Cast({
    required int? id,
    required String? knownForDepartment,
    required String? name,
    required String? character,
    required String? profilePath,
  }) = _Cast;

  factory Cast.fromJson(Map<String, dynamic> json) => _$CastFromJson(json);
}
