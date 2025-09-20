// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MovieResult {
  int? get page;
  int? get totalPages;
  int? get totalResults;
  List<Movie>? get results;

  /// Create a copy of MovieResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MovieResultCopyWith<MovieResult> get copyWith =>
      _$MovieResultCopyWithImpl<MovieResult>(this as MovieResult, _$identity);

  /// Serializes this MovieResult to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MovieResult &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.totalResults, totalResults) ||
                other.totalResults == totalResults) &&
            const DeepCollectionEquality().equals(other.results, results));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, page, totalPages, totalResults,
      const DeepCollectionEquality().hash(results));

  @override
  String toString() {
    return 'MovieResult(page: $page, totalPages: $totalPages, totalResults: $totalResults, results: $results)';
  }
}

/// @nodoc
abstract mixin class $MovieResultCopyWith<$Res> {
  factory $MovieResultCopyWith(
          MovieResult value, $Res Function(MovieResult) _then) =
      _$MovieResultCopyWithImpl;
  @useResult
  $Res call(
      {int? page, int? totalPages, int? totalResults, List<Movie>? results});
}

/// @nodoc
class _$MovieResultCopyWithImpl<$Res> implements $MovieResultCopyWith<$Res> {
  _$MovieResultCopyWithImpl(this._self, this._then);

  final MovieResult _self;
  final $Res Function(MovieResult) _then;

  /// Create a copy of MovieResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = freezed,
    Object? totalPages = freezed,
    Object? totalResults = freezed,
    Object? results = freezed,
  }) {
    return _then(_self.copyWith(
      page: freezed == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPages: freezed == totalPages
          ? _self.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int?,
      totalResults: freezed == totalResults
          ? _self.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int?,
      results: freezed == results
          ? _self.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Movie>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [MovieResult].
extension MovieResultPatterns on MovieResult {
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
    TResult Function(_MovieResult value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MovieResult() when $default != null:
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
    TResult Function(_MovieResult value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MovieResult():
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
    TResult? Function(_MovieResult value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MovieResult() when $default != null:
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
    TResult Function(int? page, int? totalPages, int? totalResults,
            List<Movie>? results)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MovieResult() when $default != null:
        return $default(
            _that.page, _that.totalPages, _that.totalResults, _that.results);
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
            int? page, int? totalPages, int? totalResults, List<Movie>? results)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MovieResult():
        return $default(
            _that.page, _that.totalPages, _that.totalResults, _that.results);
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
    TResult? Function(int? page, int? totalPages, int? totalResults,
            List<Movie>? results)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MovieResult() when $default != null:
        return $default(
            _that.page, _that.totalPages, _that.totalResults, _that.results);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _MovieResult implements MovieResult {
  const _MovieResult(
      {required this.page,
      required this.totalPages,
      required this.totalResults,
      required final List<Movie>? results})
      : _results = results;
  factory _MovieResult.fromJson(Map<String, dynamic> json) =>
      _$MovieResultFromJson(json);

  @override
  final int? page;
  @override
  final int? totalPages;
  @override
  final int? totalResults;
  final List<Movie>? _results;
  @override
  List<Movie>? get results {
    final value = _results;
    if (value == null) return null;
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of MovieResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MovieResultCopyWith<_MovieResult> get copyWith =>
      __$MovieResultCopyWithImpl<_MovieResult>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MovieResultToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MovieResult &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.totalResults, totalResults) ||
                other.totalResults == totalResults) &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, page, totalPages, totalResults,
      const DeepCollectionEquality().hash(_results));

  @override
  String toString() {
    return 'MovieResult(page: $page, totalPages: $totalPages, totalResults: $totalResults, results: $results)';
  }
}

/// @nodoc
abstract mixin class _$MovieResultCopyWith<$Res>
    implements $MovieResultCopyWith<$Res> {
  factory _$MovieResultCopyWith(
          _MovieResult value, $Res Function(_MovieResult) _then) =
      __$MovieResultCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? page, int? totalPages, int? totalResults, List<Movie>? results});
}

/// @nodoc
class __$MovieResultCopyWithImpl<$Res> implements _$MovieResultCopyWith<$Res> {
  __$MovieResultCopyWithImpl(this._self, this._then);

  final _MovieResult _self;
  final $Res Function(_MovieResult) _then;

  /// Create a copy of MovieResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? page = freezed,
    Object? totalPages = freezed,
    Object? totalResults = freezed,
    Object? results = freezed,
  }) {
    return _then(_MovieResult(
      page: freezed == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPages: freezed == totalPages
          ? _self.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int?,
      totalResults: freezed == totalResults
          ? _self.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int?,
      results: freezed == results
          ? _self._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Movie>?,
    ));
  }
}

// dart format on
