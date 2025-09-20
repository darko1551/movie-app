// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MovieDetails {
  int? get id;
  String? get title;
  String? get originalLanguage;
  String? get posterPath;
  int? get runtime;
  double? get voteAverage;
  String? get overview;
  List<Genre>? get genres;
  List<Cast>? get cast;
  DateTime? get releaseDate;

  /// Create a copy of MovieDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MovieDetailsCopyWith<MovieDetails> get copyWith =>
      _$MovieDetailsCopyWithImpl<MovieDetails>(
          this as MovieDetails, _$identity);

  /// Serializes this MovieDetails to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MovieDetails &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.originalLanguage, originalLanguage) ||
                other.originalLanguage == originalLanguage) &&
            (identical(other.posterPath, posterPath) ||
                other.posterPath == posterPath) &&
            (identical(other.runtime, runtime) || other.runtime == runtime) &&
            (identical(other.voteAverage, voteAverage) ||
                other.voteAverage == voteAverage) &&
            (identical(other.overview, overview) ||
                other.overview == overview) &&
            const DeepCollectionEquality().equals(other.genres, genres) &&
            const DeepCollectionEquality().equals(other.cast, cast) &&
            (identical(other.releaseDate, releaseDate) ||
                other.releaseDate == releaseDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      originalLanguage,
      posterPath,
      runtime,
      voteAverage,
      overview,
      const DeepCollectionEquality().hash(genres),
      const DeepCollectionEquality().hash(cast),
      releaseDate);

  @override
  String toString() {
    return 'MovieDetails(id: $id, title: $title, originalLanguage: $originalLanguage, posterPath: $posterPath, runtime: $runtime, voteAverage: $voteAverage, overview: $overview, genres: $genres, cast: $cast, releaseDate: $releaseDate)';
  }
}

/// @nodoc
abstract mixin class $MovieDetailsCopyWith<$Res> {
  factory $MovieDetailsCopyWith(
          MovieDetails value, $Res Function(MovieDetails) _then) =
      _$MovieDetailsCopyWithImpl;
  @useResult
  $Res call(
      {int? id,
      String? title,
      String? originalLanguage,
      String? posterPath,
      int? runtime,
      double? voteAverage,
      String? overview,
      List<Genre>? genres,
      List<Cast>? cast,
      DateTime? releaseDate});
}

/// @nodoc
class _$MovieDetailsCopyWithImpl<$Res> implements $MovieDetailsCopyWith<$Res> {
  _$MovieDetailsCopyWithImpl(this._self, this._then);

  final MovieDetails _self;
  final $Res Function(MovieDetails) _then;

  /// Create a copy of MovieDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? originalLanguage = freezed,
    Object? posterPath = freezed,
    Object? runtime = freezed,
    Object? voteAverage = freezed,
    Object? overview = freezed,
    Object? genres = freezed,
    Object? cast = freezed,
    Object? releaseDate = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      originalLanguage: freezed == originalLanguage
          ? _self.originalLanguage
          : originalLanguage // ignore: cast_nullable_to_non_nullable
              as String?,
      posterPath: freezed == posterPath
          ? _self.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      runtime: freezed == runtime
          ? _self.runtime
          : runtime // ignore: cast_nullable_to_non_nullable
              as int?,
      voteAverage: freezed == voteAverage
          ? _self.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as double?,
      overview: freezed == overview
          ? _self.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String?,
      genres: freezed == genres
          ? _self.genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<Genre>?,
      cast: freezed == cast
          ? _self.cast
          : cast // ignore: cast_nullable_to_non_nullable
              as List<Cast>?,
      releaseDate: freezed == releaseDate
          ? _self.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// Adds pattern-matching-related methods to [MovieDetails].
extension MovieDetailsPatterns on MovieDetails {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_MovieDetails value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MovieDetails() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_MovieDetails value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MovieDetails():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_MovieDetails value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MovieDetails() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            int? id,
            String? title,
            String? originalLanguage,
            String? posterPath,
            int? runtime,
            double? voteAverage,
            String? overview,
            List<Genre>? genres,
            List<Cast>? cast,
            DateTime? releaseDate)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MovieDetails() when $default != null:
        return $default(
            _that.id,
            _that.title,
            _that.originalLanguage,
            _that.posterPath,
            _that.runtime,
            _that.voteAverage,
            _that.overview,
            _that.genres,
            _that.cast,
            _that.releaseDate);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            int? id,
            String? title,
            String? originalLanguage,
            String? posterPath,
            int? runtime,
            double? voteAverage,
            String? overview,
            List<Genre>? genres,
            List<Cast>? cast,
            DateTime? releaseDate)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MovieDetails():
        return $default(
            _that.id,
            _that.title,
            _that.originalLanguage,
            _that.posterPath,
            _that.runtime,
            _that.voteAverage,
            _that.overview,
            _that.genres,
            _that.cast,
            _that.releaseDate);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            int? id,
            String? title,
            String? originalLanguage,
            String? posterPath,
            int? runtime,
            double? voteAverage,
            String? overview,
            List<Genre>? genres,
            List<Cast>? cast,
            DateTime? releaseDate)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MovieDetails() when $default != null:
        return $default(
            _that.id,
            _that.title,
            _that.originalLanguage,
            _that.posterPath,
            _that.runtime,
            _that.voteAverage,
            _that.overview,
            _that.genres,
            _that.cast,
            _that.releaseDate);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _MovieDetails implements MovieDetails {
  _MovieDetails(
      {required this.id,
      required this.title,
      required this.originalLanguage,
      required this.posterPath,
      required this.runtime,
      required this.voteAverage,
      required this.overview,
      required final List<Genre>? genres,
      required final List<Cast>? cast,
      required this.releaseDate})
      : _genres = genres,
        _cast = cast;
  factory _MovieDetails.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsFromJson(json);

  @override
  final int? id;
  @override
  final String? title;
  @override
  final String? originalLanguage;
  @override
  final String? posterPath;
  @override
  final int? runtime;
  @override
  final double? voteAverage;
  @override
  final String? overview;
  final List<Genre>? _genres;
  @override
  List<Genre>? get genres {
    final value = _genres;
    if (value == null) return null;
    if (_genres is EqualUnmodifiableListView) return _genres;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Cast>? _cast;
  @override
  List<Cast>? get cast {
    final value = _cast;
    if (value == null) return null;
    if (_cast is EqualUnmodifiableListView) return _cast;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final DateTime? releaseDate;

  /// Create a copy of MovieDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MovieDetailsCopyWith<_MovieDetails> get copyWith =>
      __$MovieDetailsCopyWithImpl<_MovieDetails>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MovieDetailsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MovieDetails &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.originalLanguage, originalLanguage) ||
                other.originalLanguage == originalLanguage) &&
            (identical(other.posterPath, posterPath) ||
                other.posterPath == posterPath) &&
            (identical(other.runtime, runtime) || other.runtime == runtime) &&
            (identical(other.voteAverage, voteAverage) ||
                other.voteAverage == voteAverage) &&
            (identical(other.overview, overview) ||
                other.overview == overview) &&
            const DeepCollectionEquality().equals(other._genres, _genres) &&
            const DeepCollectionEquality().equals(other._cast, _cast) &&
            (identical(other.releaseDate, releaseDate) ||
                other.releaseDate == releaseDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      originalLanguage,
      posterPath,
      runtime,
      voteAverage,
      overview,
      const DeepCollectionEquality().hash(_genres),
      const DeepCollectionEquality().hash(_cast),
      releaseDate);

  @override
  String toString() {
    return 'MovieDetails(id: $id, title: $title, originalLanguage: $originalLanguage, posterPath: $posterPath, runtime: $runtime, voteAverage: $voteAverage, overview: $overview, genres: $genres, cast: $cast, releaseDate: $releaseDate)';
  }
}

/// @nodoc
abstract mixin class _$MovieDetailsCopyWith<$Res>
    implements $MovieDetailsCopyWith<$Res> {
  factory _$MovieDetailsCopyWith(
          _MovieDetails value, $Res Function(_MovieDetails) _then) =
      __$MovieDetailsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? id,
      String? title,
      String? originalLanguage,
      String? posterPath,
      int? runtime,
      double? voteAverage,
      String? overview,
      List<Genre>? genres,
      List<Cast>? cast,
      DateTime? releaseDate});
}

/// @nodoc
class __$MovieDetailsCopyWithImpl<$Res>
    implements _$MovieDetailsCopyWith<$Res> {
  __$MovieDetailsCopyWithImpl(this._self, this._then);

  final _MovieDetails _self;
  final $Res Function(_MovieDetails) _then;

  /// Create a copy of MovieDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? originalLanguage = freezed,
    Object? posterPath = freezed,
    Object? runtime = freezed,
    Object? voteAverage = freezed,
    Object? overview = freezed,
    Object? genres = freezed,
    Object? cast = freezed,
    Object? releaseDate = freezed,
  }) {
    return _then(_MovieDetails(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      originalLanguage: freezed == originalLanguage
          ? _self.originalLanguage
          : originalLanguage // ignore: cast_nullable_to_non_nullable
              as String?,
      posterPath: freezed == posterPath
          ? _self.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      runtime: freezed == runtime
          ? _self.runtime
          : runtime // ignore: cast_nullable_to_non_nullable
              as int?,
      voteAverage: freezed == voteAverage
          ? _self.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as double?,
      overview: freezed == overview
          ? _self.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String?,
      genres: freezed == genres
          ? _self._genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<Genre>?,
      cast: freezed == cast
          ? _self._cast
          : cast // ignore: cast_nullable_to_non_nullable
              as List<Cast>?,
      releaseDate: freezed == releaseDate
          ? _self.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

// dart format on
