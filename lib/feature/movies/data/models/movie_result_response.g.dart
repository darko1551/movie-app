// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_result_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieResultResponse _$MovieResultResponseFromJson(Map<String, dynamic> json) =>
    MovieResultResponse(
      page: (json['page'] as num?)?.toInt(),
      totalPages: (json['total_pages'] as num?)?.toInt(),
      totalResults: (json['total_results'] as num?)?.toInt(),
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => MovieResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovieResultResponseToJson(
        MovieResultResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
      'results': instance.results,
    };
