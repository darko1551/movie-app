// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cast_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CastResult _$CastResultFromJson(Map<String, dynamic> json) => _CastResult(
      cast: (json['cast'] as List<dynamic>?)
          ?.map((e) => Cast.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CastResultToJson(_CastResult instance) =>
    <String, dynamic>{
      'cast': instance.cast,
    };
