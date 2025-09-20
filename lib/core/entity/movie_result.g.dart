// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MovieResult _$MovieResultFromJson(Map<String, dynamic> json) => _MovieResult(
      page: (json['page'] as num?)?.toInt(),
      totalPages: (json['totalPages'] as num?)?.toInt(),
      totalResults: (json['totalResults'] as num?)?.toInt(),
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovieResultToJson(_MovieResult instance) =>
    <String, dynamic>{
      'page': instance.page,
      'totalPages': instance.totalPages,
      'totalResults': instance.totalResults,
      'results': instance.results,
    };
