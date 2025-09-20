import 'package:drift/drift.dart';
import 'package:movie_app/core/database/app_database.dart';
import 'package:movie_app/core/database/type_converters/int_list_converter.dart';
import 'package:movie_app/core/entity/movie.dart';

class MovieTable extends Table {
  IntColumn get id => integer().unique()();
  TextColumn get title => text().nullable()();
  TextColumn get posterPath => text().nullable()();
  TextColumn get genresJson => text().map(const IntListConverter()).nullable()();
  RealColumn get voteAverage => real().nullable()();
  DateTimeColumn get releaseDate => dateTime().nullable()();
}

extension MovieTableMapper on MovieTableData {
  Movie toDomain() => Movie(
        id: id,
        title: title,
        posterPath: posterPath,
        genreIds: genresJson,
        voteAverage: voteAverage,
        releaseDate: releaseDate,
      );
}

extension MovieDomainMapper on Movie {
  MovieTableCompanion toCompanion() => MovieTableCompanion(
        id: Value(id!),
        title: Value(title),
        genresJson: Value(genreIds),
        voteAverage: Value(voteAverage),
        posterPath: Value(posterPath),
        releaseDate: Value(releaseDate),
      );
}
