// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Movie _$MovieFromJson(Map<String, dynamic> json) => _Movie(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      posterPath: json['posterPath'] as String?,
      genreIds: (json['genreIds'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      voteAverage: (json['voteAverage'] as num?)?.toDouble(),
      releaseDate: json['releaseDate'] == null
          ? null
          : DateTime.parse(json['releaseDate'] as String),
    );

Map<String, dynamic> _$MovieToJson(_Movie instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'posterPath': instance.posterPath,
      'genreIds': instance.genreIds,
      'voteAverage': instance.voteAverage,
      'releaseDate': instance.releaseDate?.toIso8601String(),
    };
