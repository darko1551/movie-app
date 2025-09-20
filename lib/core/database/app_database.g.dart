// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $MovieTableTable extends MovieTable
    with TableInfo<$MovieTableTable, MovieTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MovieTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _posterPathMeta =
      const VerificationMeta('posterPath');
  @override
  late final GeneratedColumn<String> posterPath = GeneratedColumn<String>(
      'poster_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  late final GeneratedColumnWithTypeConverter<List<int>?, String> genresJson =
      GeneratedColumn<String>('genres_json', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<List<int>?>($MovieTableTable.$convertergenresJsonn);
  static const VerificationMeta _voteAverageMeta =
      const VerificationMeta('voteAverage');
  @override
  late final GeneratedColumn<double> voteAverage = GeneratedColumn<double>(
      'vote_average', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _releaseDateMeta =
      const VerificationMeta('releaseDate');
  @override
  late final GeneratedColumn<DateTime> releaseDate = GeneratedColumn<DateTime>(
      'release_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, posterPath, genresJson, voteAverage, releaseDate];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'movie_table';
  @override
  VerificationContext validateIntegrity(Insertable<MovieTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    }
    if (data.containsKey('poster_path')) {
      context.handle(
          _posterPathMeta,
          posterPath.isAcceptableOrUnknown(
              data['poster_path']!, _posterPathMeta));
    }
    if (data.containsKey('vote_average')) {
      context.handle(
          _voteAverageMeta,
          voteAverage.isAcceptableOrUnknown(
              data['vote_average']!, _voteAverageMeta));
    }
    if (data.containsKey('release_date')) {
      context.handle(
          _releaseDateMeta,
          releaseDate.isAcceptableOrUnknown(
              data['release_date']!, _releaseDateMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  MovieTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MovieTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title']),
      posterPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}poster_path']),
      genresJson: $MovieTableTable.$convertergenresJsonn.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}genres_json'])),
      voteAverage: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}vote_average']),
      releaseDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}release_date']),
    );
  }

  @override
  $MovieTableTable createAlias(String alias) {
    return $MovieTableTable(attachedDatabase, alias);
  }

  static TypeConverter<List<int>, String> $convertergenresJson =
      const IntListConverter();
  static TypeConverter<List<int>?, String?> $convertergenresJsonn =
      NullAwareTypeConverter.wrap($convertergenresJson);
}

class MovieTableData extends DataClass implements Insertable<MovieTableData> {
  final int id;
  final String? title;
  final String? posterPath;
  final List<int>? genresJson;
  final double? voteAverage;
  final DateTime? releaseDate;
  const MovieTableData(
      {required this.id,
      this.title,
      this.posterPath,
      this.genresJson,
      this.voteAverage,
      this.releaseDate});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || posterPath != null) {
      map['poster_path'] = Variable<String>(posterPath);
    }
    if (!nullToAbsent || genresJson != null) {
      map['genres_json'] = Variable<String>(
          $MovieTableTable.$convertergenresJsonn.toSql(genresJson));
    }
    if (!nullToAbsent || voteAverage != null) {
      map['vote_average'] = Variable<double>(voteAverage);
    }
    if (!nullToAbsent || releaseDate != null) {
      map['release_date'] = Variable<DateTime>(releaseDate);
    }
    return map;
  }

  MovieTableCompanion toCompanion(bool nullToAbsent) {
    return MovieTableCompanion(
      id: Value(id),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      posterPath: posterPath == null && nullToAbsent
          ? const Value.absent()
          : Value(posterPath),
      genresJson: genresJson == null && nullToAbsent
          ? const Value.absent()
          : Value(genresJson),
      voteAverage: voteAverage == null && nullToAbsent
          ? const Value.absent()
          : Value(voteAverage),
      releaseDate: releaseDate == null && nullToAbsent
          ? const Value.absent()
          : Value(releaseDate),
    );
  }

  factory MovieTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MovieTableData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String?>(json['title']),
      posterPath: serializer.fromJson<String?>(json['posterPath']),
      genresJson: serializer.fromJson<List<int>?>(json['genresJson']),
      voteAverage: serializer.fromJson<double?>(json['voteAverage']),
      releaseDate: serializer.fromJson<DateTime?>(json['releaseDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String?>(title),
      'posterPath': serializer.toJson<String?>(posterPath),
      'genresJson': serializer.toJson<List<int>?>(genresJson),
      'voteAverage': serializer.toJson<double?>(voteAverage),
      'releaseDate': serializer.toJson<DateTime?>(releaseDate),
    };
  }

  MovieTableData copyWith(
          {int? id,
          Value<String?> title = const Value.absent(),
          Value<String?> posterPath = const Value.absent(),
          Value<List<int>?> genresJson = const Value.absent(),
          Value<double?> voteAverage = const Value.absent(),
          Value<DateTime?> releaseDate = const Value.absent()}) =>
      MovieTableData(
        id: id ?? this.id,
        title: title.present ? title.value : this.title,
        posterPath: posterPath.present ? posterPath.value : this.posterPath,
        genresJson: genresJson.present ? genresJson.value : this.genresJson,
        voteAverage: voteAverage.present ? voteAverage.value : this.voteAverage,
        releaseDate: releaseDate.present ? releaseDate.value : this.releaseDate,
      );
  MovieTableData copyWithCompanion(MovieTableCompanion data) {
    return MovieTableData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      posterPath:
          data.posterPath.present ? data.posterPath.value : this.posterPath,
      genresJson:
          data.genresJson.present ? data.genresJson.value : this.genresJson,
      voteAverage:
          data.voteAverage.present ? data.voteAverage.value : this.voteAverage,
      releaseDate:
          data.releaseDate.present ? data.releaseDate.value : this.releaseDate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MovieTableData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('posterPath: $posterPath, ')
          ..write('genresJson: $genresJson, ')
          ..write('voteAverage: $voteAverage, ')
          ..write('releaseDate: $releaseDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, title, posterPath, genresJson, voteAverage, releaseDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MovieTableData &&
          other.id == this.id &&
          other.title == this.title &&
          other.posterPath == this.posterPath &&
          other.genresJson == this.genresJson &&
          other.voteAverage == this.voteAverage &&
          other.releaseDate == this.releaseDate);
}

class MovieTableCompanion extends UpdateCompanion<MovieTableData> {
  final Value<int> id;
  final Value<String?> title;
  final Value<String?> posterPath;
  final Value<List<int>?> genresJson;
  final Value<double?> voteAverage;
  final Value<DateTime?> releaseDate;
  final Value<int> rowid;
  const MovieTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.posterPath = const Value.absent(),
    this.genresJson = const Value.absent(),
    this.voteAverage = const Value.absent(),
    this.releaseDate = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MovieTableCompanion.insert({
    required int id,
    this.title = const Value.absent(),
    this.posterPath = const Value.absent(),
    this.genresJson = const Value.absent(),
    this.voteAverage = const Value.absent(),
    this.releaseDate = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id);
  static Insertable<MovieTableData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? posterPath,
    Expression<String>? genresJson,
    Expression<double>? voteAverage,
    Expression<DateTime>? releaseDate,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (posterPath != null) 'poster_path': posterPath,
      if (genresJson != null) 'genres_json': genresJson,
      if (voteAverage != null) 'vote_average': voteAverage,
      if (releaseDate != null) 'release_date': releaseDate,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MovieTableCompanion copyWith(
      {Value<int>? id,
      Value<String?>? title,
      Value<String?>? posterPath,
      Value<List<int>?>? genresJson,
      Value<double?>? voteAverage,
      Value<DateTime?>? releaseDate,
      Value<int>? rowid}) {
    return MovieTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      posterPath: posterPath ?? this.posterPath,
      genresJson: genresJson ?? this.genresJson,
      voteAverage: voteAverage ?? this.voteAverage,
      releaseDate: releaseDate ?? this.releaseDate,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (posterPath.present) {
      map['poster_path'] = Variable<String>(posterPath.value);
    }
    if (genresJson.present) {
      map['genres_json'] = Variable<String>(
          $MovieTableTable.$convertergenresJsonn.toSql(genresJson.value));
    }
    if (voteAverage.present) {
      map['vote_average'] = Variable<double>(voteAverage.value);
    }
    if (releaseDate.present) {
      map['release_date'] = Variable<DateTime>(releaseDate.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MovieTableCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('posterPath: $posterPath, ')
          ..write('genresJson: $genresJson, ')
          ..write('voteAverage: $voteAverage, ')
          ..write('releaseDate: $releaseDate, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $MovieTableTable movieTable = $MovieTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [movieTable];
}

typedef $$MovieTableTableCreateCompanionBuilder = MovieTableCompanion Function({
  required int id,
  Value<String?> title,
  Value<String?> posterPath,
  Value<List<int>?> genresJson,
  Value<double?> voteAverage,
  Value<DateTime?> releaseDate,
  Value<int> rowid,
});
typedef $$MovieTableTableUpdateCompanionBuilder = MovieTableCompanion Function({
  Value<int> id,
  Value<String?> title,
  Value<String?> posterPath,
  Value<List<int>?> genresJson,
  Value<double?> voteAverage,
  Value<DateTime?> releaseDate,
  Value<int> rowid,
});

class $$MovieTableTableFilterComposer
    extends Composer<_$AppDatabase, $MovieTableTable> {
  $$MovieTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get posterPath => $composableBuilder(
      column: $table.posterPath, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<List<int>?, List<int>, String>
      get genresJson => $composableBuilder(
          column: $table.genresJson,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<double> get voteAverage => $composableBuilder(
      column: $table.voteAverage, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get releaseDate => $composableBuilder(
      column: $table.releaseDate, builder: (column) => ColumnFilters(column));
}

class $$MovieTableTableOrderingComposer
    extends Composer<_$AppDatabase, $MovieTableTable> {
  $$MovieTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get posterPath => $composableBuilder(
      column: $table.posterPath, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get genresJson => $composableBuilder(
      column: $table.genresJson, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get voteAverage => $composableBuilder(
      column: $table.voteAverage, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get releaseDate => $composableBuilder(
      column: $table.releaseDate, builder: (column) => ColumnOrderings(column));
}

class $$MovieTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $MovieTableTable> {
  $$MovieTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get posterPath => $composableBuilder(
      column: $table.posterPath, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<int>?, String> get genresJson =>
      $composableBuilder(
          column: $table.genresJson, builder: (column) => column);

  GeneratedColumn<double> get voteAverage => $composableBuilder(
      column: $table.voteAverage, builder: (column) => column);

  GeneratedColumn<DateTime> get releaseDate => $composableBuilder(
      column: $table.releaseDate, builder: (column) => column);
}

class $$MovieTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MovieTableTable,
    MovieTableData,
    $$MovieTableTableFilterComposer,
    $$MovieTableTableOrderingComposer,
    $$MovieTableTableAnnotationComposer,
    $$MovieTableTableCreateCompanionBuilder,
    $$MovieTableTableUpdateCompanionBuilder,
    (
      MovieTableData,
      BaseReferences<_$AppDatabase, $MovieTableTable, MovieTableData>
    ),
    MovieTableData,
    PrefetchHooks Function()> {
  $$MovieTableTableTableManager(_$AppDatabase db, $MovieTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MovieTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MovieTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MovieTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> title = const Value.absent(),
            Value<String?> posterPath = const Value.absent(),
            Value<List<int>?> genresJson = const Value.absent(),
            Value<double?> voteAverage = const Value.absent(),
            Value<DateTime?> releaseDate = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MovieTableCompanion(
            id: id,
            title: title,
            posterPath: posterPath,
            genresJson: genresJson,
            voteAverage: voteAverage,
            releaseDate: releaseDate,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int id,
            Value<String?> title = const Value.absent(),
            Value<String?> posterPath = const Value.absent(),
            Value<List<int>?> genresJson = const Value.absent(),
            Value<double?> voteAverage = const Value.absent(),
            Value<DateTime?> releaseDate = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MovieTableCompanion.insert(
            id: id,
            title: title,
            posterPath: posterPath,
            genresJson: genresJson,
            voteAverage: voteAverage,
            releaseDate: releaseDate,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$MovieTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $MovieTableTable,
    MovieTableData,
    $$MovieTableTableFilterComposer,
    $$MovieTableTableOrderingComposer,
    $$MovieTableTableAnnotationComposer,
    $$MovieTableTableCreateCompanionBuilder,
    $$MovieTableTableUpdateCompanionBuilder,
    (
      MovieTableData,
      BaseReferences<_$AppDatabase, $MovieTableTable, MovieTableData>
    ),
    MovieTableData,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$MovieTableTableTableManager get movieTable =>
      $$MovieTableTableTableManager(_db, _db.movieTable);
}
