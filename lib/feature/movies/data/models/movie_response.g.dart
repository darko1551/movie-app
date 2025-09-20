// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieResponse _$MovieResponseFromJson(Map<String, dynamic> json) =>
    MovieResponse(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      posterPath: json['poster_path'] as String?,
      genreIds: (json['genre_ids'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      releaseDate:
          const DateTimeConverter().fromJson(json['release_date'] as String?),
    );

Map<String, dynamic> _$MovieResponseToJson(MovieResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'poster_path': instance.posterPath,
      'genre_ids': instance.genreIds,
      'vote_average': instance.voteAverage,
      'release_date': const DateTimeConverter().toJson(instance.releaseDate),
    };
