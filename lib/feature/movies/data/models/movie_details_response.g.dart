// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetailsResponse _$MovieDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    MovieDetailsResponse(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      originalLanguage: json['original_language'] as String?,
      posterPath: json['poster_path'] as String?,
      runtime: (json['runtime'] as num?)?.toInt(),
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      overview: json['overview'] as String?,
      genres: (json['genres'] as List<dynamic>?)
          ?.map((e) => GenreResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      credits: json['credits'] == null
          ? null
          : CastResultResponse.fromJson(
              json['credits'] as Map<String, dynamic>),
      releaseDate: json['release_date'] == null
          ? null
          : DateTime.parse(json['release_date'] as String),
    );

Map<String, dynamic> _$MovieDetailsResponseToJson(
        MovieDetailsResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'original_language': instance.originalLanguage,
      'poster_path': instance.posterPath,
      'runtime': instance.runtime,
      'vote_average': instance.voteAverage,
      'overview': instance.overview,
      'genres': instance.genres,
      'credits': instance.credits,
      'release_date': instance.releaseDate?.toIso8601String(),
    };
