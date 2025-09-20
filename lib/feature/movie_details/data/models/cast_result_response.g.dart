// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cast_result_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CastResultResponse _$CastResultResponseFromJson(Map<String, dynamic> json) =>
    CastResultResponse(
      cast: (json['cast'] as List<dynamic>?)
          ?.map((e) => CastResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CastResultResponseToJson(CastResultResponse instance) =>
    <String, dynamic>{
      'cast': instance.cast,
    };
