// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MovieDetails _$MovieDetailsFromJson(Map<String, dynamic> json) =>
    _MovieDetails(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      originalLanguage: json['originalLanguage'] as String?,
      posterPath: json['posterPath'] as String?,
      runtime: (json['runtime'] as num?)?.toInt(),
      voteAverage: (json['voteAverage'] as num?)?.toDouble(),
      overview: json['overview'] as String?,
      genres: (json['genres'] as List<dynamic>?)
          ?.map((e) => Genre.fromJson(e as Map<String, dynamic>))
          .toList(),
      cast: (json['cast'] as List<dynamic>?)
          ?.map((e) => Cast.fromJson(e as Map<String, dynamic>))
          .toList(),
      releaseDate: json['releaseDate'] == null
          ? null
          : DateTime.parse(json['releaseDate'] as String),
    );

Map<String, dynamic> _$MovieDetailsToJson(_MovieDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'originalLanguage': instance.originalLanguage,
      'posterPath': instance.posterPath,
      'runtime': instance.runtime,
      'voteAverage': instance.voteAverage,
      'overview': instance.overview,
      'genres': instance.genres,
      'cast': instance.cast,
      'releaseDate': instance.releaseDate?.toIso8601String(),
    };
