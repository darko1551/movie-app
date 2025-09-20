// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_search_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MovieSearchEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is MovieSearchEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'MovieSearchEvent()';
  }
}

/// @nodoc
class $MovieSearchEventCopyWith<$Res> {
  $MovieSearchEventCopyWith(
      MovieSearchEvent _, $Res Function(MovieSearchEvent) __);
}

/// Adds pattern-matching-related methods to [MovieSearchEvent].
extension MovieSearchEventPatterns on MovieSearchEvent {
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
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Search value)? search,
    TResult Function(_Reset value)? reset,
    TResult Function(_GenreFilterExpandToggle value)? genreFilterExpandToggle,
    TResult Function(_GenreTapped value)? genreTapped,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Search() when search != null:
        return search(_that);
      case _Reset() when reset != null:
        return reset(_that);
      case _GenreFilterExpandToggle() when genreFilterExpandToggle != null:
        return genreFilterExpandToggle(_that);
      case _GenreTapped() when genreTapped != null:
        return genreTapped(_that);
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
  TResult map<TResult extends Object?>({
    required TResult Function(_Search value) search,
    required TResult Function(_Reset value) reset,
    required TResult Function(_GenreFilterExpandToggle value)
        genreFilterExpandToggle,
    required TResult Function(_GenreTapped value) genreTapped,
  }) {
    final _that = this;
    switch (_that) {
      case _Search():
        return search(_that);
      case _Reset():
        return reset(_that);
      case _GenreFilterExpandToggle():
        return genreFilterExpandToggle(_that);
      case _GenreTapped():
        return genreTapped(_that);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Search value)? search,
    TResult? Function(_Reset value)? reset,
    TResult? Function(_GenreFilterExpandToggle value)? genreFilterExpandToggle,
    TResult? Function(_GenreTapped value)? genreTapped,
  }) {
    final _that = this;
    switch (_that) {
      case _Search() when search != null:
        return search(_that);
      case _Reset() when reset != null:
        return reset(_that);
      case _GenreFilterExpandToggle() when genreFilterExpandToggle != null:
        return genreFilterExpandToggle(_that);
      case _GenreTapped() when genreTapped != null:
        return genreTapped(_that);
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
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query, String year)? search,
    TResult Function()? reset,
    TResult Function()? genreFilterExpandToggle,
    TResult Function(GenreEnum genre)? genreTapped,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Search() when search != null:
        return search(_that.query, _that.year);
      case _Reset() when reset != null:
        return reset();
      case _GenreFilterExpandToggle() when genreFilterExpandToggle != null:
        return genreFilterExpandToggle();
      case _GenreTapped() when genreTapped != null:
        return genreTapped(_that.genre);
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
  TResult when<TResult extends Object?>({
    required TResult Function(String query, String year) search,
    required TResult Function() reset,
    required TResult Function() genreFilterExpandToggle,
    required TResult Function(GenreEnum genre) genreTapped,
  }) {
    final _that = this;
    switch (_that) {
      case _Search():
        return search(_that.query, _that.year);
      case _Reset():
        return reset();
      case _GenreFilterExpandToggle():
        return genreFilterExpandToggle();
      case _GenreTapped():
        return genreTapped(_that.genre);
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query, String year)? search,
    TResult? Function()? reset,
    TResult? Function()? genreFilterExpandToggle,
    TResult? Function(GenreEnum genre)? genreTapped,
  }) {
    final _that = this;
    switch (_that) {
      case _Search() when search != null:
        return search(_that.query, _that.year);
      case _Reset() when reset != null:
        return reset();
      case _GenreFilterExpandToggle() when genreFilterExpandToggle != null:
        return genreFilterExpandToggle();
      case _GenreTapped() when genreTapped != null:
        return genreTapped(_that.genre);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Search implements MovieSearchEvent {
  const _Search(this.query, this.year);

  final String query;
  final String year;

  /// Create a copy of MovieSearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchCopyWith<_Search> get copyWith =>
      __$SearchCopyWithImpl<_Search>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Search &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.year, year) || other.year == year));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query, year);

  @override
  String toString() {
    return 'MovieSearchEvent.search(query: $query, year: $year)';
  }
}

/// @nodoc
abstract mixin class _$SearchCopyWith<$Res>
    implements $MovieSearchEventCopyWith<$Res> {
  factory _$SearchCopyWith(_Search value, $Res Function(_Search) _then) =
      __$SearchCopyWithImpl;
  @useResult
  $Res call({String query, String year});
}

/// @nodoc
class __$SearchCopyWithImpl<$Res> implements _$SearchCopyWith<$Res> {
  __$SearchCopyWithImpl(this._self, this._then);

  final _Search _self;
  final $Res Function(_Search) _then;

  /// Create a copy of MovieSearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? query = null,
    Object? year = null,
  }) {
    return _then(_Search(
      null == query
          ? _self.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      null == year
          ? _self.year
          : year // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _Reset implements MovieSearchEvent {
  const _Reset();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Reset);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'MovieSearchEvent.reset()';
  }
}

/// @nodoc

class _GenreFilterExpandToggle implements MovieSearchEvent {
  const _GenreFilterExpandToggle();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _GenreFilterExpandToggle);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'MovieSearchEvent.genreFilterExpandToggle()';
  }
}

/// @nodoc

class _GenreTapped implements MovieSearchEvent {
  const _GenreTapped(this.genre);

  final GenreEnum genre;

  /// Create a copy of MovieSearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GenreTappedCopyWith<_GenreTapped> get copyWith =>
      __$GenreTappedCopyWithImpl<_GenreTapped>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GenreTapped &&
            (identical(other.genre, genre) || other.genre == genre));
  }

  @override
  int get hashCode => Object.hash(runtimeType, genre);

  @override
  String toString() {
    return 'MovieSearchEvent.genreTapped(genre: $genre)';
  }
}

/// @nodoc
abstract mixin class _$GenreTappedCopyWith<$Res>
    implements $MovieSearchEventCopyWith<$Res> {
  factory _$GenreTappedCopyWith(
          _GenreTapped value, $Res Function(_GenreTapped) _then) =
      __$GenreTappedCopyWithImpl;
  @useResult
  $Res call({GenreEnum genre});
}

/// @nodoc
class __$GenreTappedCopyWithImpl<$Res> implements _$GenreTappedCopyWith<$Res> {
  __$GenreTappedCopyWithImpl(this._self, this._then);

  final _GenreTapped _self;
  final $Res Function(_GenreTapped) _then;

  /// Create a copy of MovieSearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? genre = null,
  }) {
    return _then(_GenreTapped(
      null == genre
          ? _self.genre
          : genre // ignore: cast_nullable_to_non_nullable
              as GenreEnum,
    ));
  }
}

/// @nodoc
mixin _$MovieSearchState {
  bool get genreFilterIsExpanded;
  List<GenreEnum> get selectedGenres;

  /// Create a copy of MovieSearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MovieSearchStateCopyWith<MovieSearchState> get copyWith =>
      _$MovieSearchStateCopyWithImpl<MovieSearchState>(
          this as MovieSearchState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MovieSearchState &&
            (identical(other.genreFilterIsExpanded, genreFilterIsExpanded) ||
                other.genreFilterIsExpanded == genreFilterIsExpanded) &&
            const DeepCollectionEquality()
                .equals(other.selectedGenres, selectedGenres));
  }

  @override
  int get hashCode => Object.hash(runtimeType, genreFilterIsExpanded,
      const DeepCollectionEquality().hash(selectedGenres));

  @override
  String toString() {
    return 'MovieSearchState(genreFilterIsExpanded: $genreFilterIsExpanded, selectedGenres: $selectedGenres)';
  }
}

/// @nodoc
abstract mixin class $MovieSearchStateCopyWith<$Res> {
  factory $MovieSearchStateCopyWith(
          MovieSearchState value, $Res Function(MovieSearchState) _then) =
      _$MovieSearchStateCopyWithImpl;
  @useResult
  $Res call({bool genreFilterIsExpanded, List<GenreEnum> selectedGenres});
}

/// @nodoc
class _$MovieSearchStateCopyWithImpl<$Res>
    implements $MovieSearchStateCopyWith<$Res> {
  _$MovieSearchStateCopyWithImpl(this._self, this._then);

  final MovieSearchState _self;
  final $Res Function(MovieSearchState) _then;

  /// Create a copy of MovieSearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? genreFilterIsExpanded = null,
    Object? selectedGenres = null,
  }) {
    return _then(_self.copyWith(
      genreFilterIsExpanded: null == genreFilterIsExpanded
          ? _self.genreFilterIsExpanded
          : genreFilterIsExpanded // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedGenres: null == selectedGenres
          ? _self.selectedGenres
          : selectedGenres // ignore: cast_nullable_to_non_nullable
              as List<GenreEnum>,
    ));
  }
}

/// Adds pattern-matching-related methods to [MovieSearchState].
extension MovieSearchStatePatterns on MovieSearchState {
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
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NotSearching value)? notSearching,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NotSearching() when notSearching != null:
        return notSearching(_that);
      case _Loading() when loading != null:
        return loading(_that);
      case _Loaded() when loaded != null:
        return loaded(_that);
      case _Error() when error != null:
        return error(_that);
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
  TResult map<TResult extends Object?>({
    required TResult Function(_NotSearching value) notSearching,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    final _that = this;
    switch (_that) {
      case _NotSearching():
        return notSearching(_that);
      case _Loading():
        return loading(_that);
      case _Loaded():
        return loaded(_that);
      case _Error():
        return error(_that);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NotSearching value)? notSearching,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    final _that = this;
    switch (_that) {
      case _NotSearching() when notSearching != null:
        return notSearching(_that);
      case _Loading() when loading != null:
        return loading(_that);
      case _Loaded() when loaded != null:
        return loaded(_that);
      case _Error() when error != null:
        return error(_that);
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
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            bool genreFilterIsExpanded, List<GenreEnum> selectedGenres)?
        notSearching,
    TResult Function(
            bool genreFilterIsExpanded, List<GenreEnum> selectedGenres)?
        loading,
    TResult Function(List<Movie> movies, bool genreFilterIsExpanded,
            bool loadingMore, List<GenreEnum> selectedGenres)?
        loaded,
    TResult Function(AppFailure error, bool genreFilterIsExpanded,
            List<GenreEnum> selectedGenres)?
        error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NotSearching() when notSearching != null:
        return notSearching(_that.genreFilterIsExpanded, _that.selectedGenres);
      case _Loading() when loading != null:
        return loading(_that.genreFilterIsExpanded, _that.selectedGenres);
      case _Loaded() when loaded != null:
        return loaded(_that.movies, _that.genreFilterIsExpanded,
            _that.loadingMore, _that.selectedGenres);
      case _Error() when error != null:
        return error(
            _that.error, _that.genreFilterIsExpanded, _that.selectedGenres);
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
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool genreFilterIsExpanded, List<GenreEnum> selectedGenres)
        notSearching,
    required TResult Function(
            bool genreFilterIsExpanded, List<GenreEnum> selectedGenres)
        loading,
    required TResult Function(List<Movie> movies, bool genreFilterIsExpanded,
            bool loadingMore, List<GenreEnum> selectedGenres)
        loaded,
    required TResult Function(AppFailure error, bool genreFilterIsExpanded,
            List<GenreEnum> selectedGenres)
        error,
  }) {
    final _that = this;
    switch (_that) {
      case _NotSearching():
        return notSearching(_that.genreFilterIsExpanded, _that.selectedGenres);
      case _Loading():
        return loading(_that.genreFilterIsExpanded, _that.selectedGenres);
      case _Loaded():
        return loaded(_that.movies, _that.genreFilterIsExpanded,
            _that.loadingMore, _that.selectedGenres);
      case _Error():
        return error(
            _that.error, _that.genreFilterIsExpanded, _that.selectedGenres);
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            bool genreFilterIsExpanded, List<GenreEnum> selectedGenres)?
        notSearching,
    TResult? Function(
            bool genreFilterIsExpanded, List<GenreEnum> selectedGenres)?
        loading,
    TResult? Function(List<Movie> movies, bool genreFilterIsExpanded,
            bool loadingMore, List<GenreEnum> selectedGenres)?
        loaded,
    TResult? Function(AppFailure error, bool genreFilterIsExpanded,
            List<GenreEnum> selectedGenres)?
        error,
  }) {
    final _that = this;
    switch (_that) {
      case _NotSearching() when notSearching != null:
        return notSearching(_that.genreFilterIsExpanded, _that.selectedGenres);
      case _Loading() when loading != null:
        return loading(_that.genreFilterIsExpanded, _that.selectedGenres);
      case _Loaded() when loaded != null:
        return loaded(_that.movies, _that.genreFilterIsExpanded,
            _that.loadingMore, _that.selectedGenres);
      case _Error() when error != null:
        return error(
            _that.error, _that.genreFilterIsExpanded, _that.selectedGenres);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _NotSearching implements MovieSearchState {
  const _NotSearching(
      this.genreFilterIsExpanded, final List<GenreEnum> selectedGenres)
      : _selectedGenres = selectedGenres;

  @override
  final bool genreFilterIsExpanded;
  final List<GenreEnum> _selectedGenres;
  @override
  List<GenreEnum> get selectedGenres {
    if (_selectedGenres is EqualUnmodifiableListView) return _selectedGenres;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedGenres);
  }

  /// Create a copy of MovieSearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NotSearchingCopyWith<_NotSearching> get copyWith =>
      __$NotSearchingCopyWithImpl<_NotSearching>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NotSearching &&
            (identical(other.genreFilterIsExpanded, genreFilterIsExpanded) ||
                other.genreFilterIsExpanded == genreFilterIsExpanded) &&
            const DeepCollectionEquality()
                .equals(other._selectedGenres, _selectedGenres));
  }

  @override
  int get hashCode => Object.hash(runtimeType, genreFilterIsExpanded,
      const DeepCollectionEquality().hash(_selectedGenres));

  @override
  String toString() {
    return 'MovieSearchState.notSearching(genreFilterIsExpanded: $genreFilterIsExpanded, selectedGenres: $selectedGenres)';
  }
}

/// @nodoc
abstract mixin class _$NotSearchingCopyWith<$Res>
    implements $MovieSearchStateCopyWith<$Res> {
  factory _$NotSearchingCopyWith(
          _NotSearching value, $Res Function(_NotSearching) _then) =
      __$NotSearchingCopyWithImpl;
  @override
  @useResult
  $Res call({bool genreFilterIsExpanded, List<GenreEnum> selectedGenres});
}

/// @nodoc
class __$NotSearchingCopyWithImpl<$Res>
    implements _$NotSearchingCopyWith<$Res> {
  __$NotSearchingCopyWithImpl(this._self, this._then);

  final _NotSearching _self;
  final $Res Function(_NotSearching) _then;

  /// Create a copy of MovieSearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? genreFilterIsExpanded = null,
    Object? selectedGenres = null,
  }) {
    return _then(_NotSearching(
      null == genreFilterIsExpanded
          ? _self.genreFilterIsExpanded
          : genreFilterIsExpanded // ignore: cast_nullable_to_non_nullable
              as bool,
      null == selectedGenres
          ? _self._selectedGenres
          : selectedGenres // ignore: cast_nullable_to_non_nullable
              as List<GenreEnum>,
    ));
  }
}

/// @nodoc

class _Loading implements MovieSearchState {
  const _Loading(
      this.genreFilterIsExpanded, final List<GenreEnum> selectedGenres)
      : _selectedGenres = selectedGenres;

  @override
  final bool genreFilterIsExpanded;
  final List<GenreEnum> _selectedGenres;
  @override
  List<GenreEnum> get selectedGenres {
    if (_selectedGenres is EqualUnmodifiableListView) return _selectedGenres;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedGenres);
  }

  /// Create a copy of MovieSearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoadingCopyWith<_Loading> get copyWith =>
      __$LoadingCopyWithImpl<_Loading>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Loading &&
            (identical(other.genreFilterIsExpanded, genreFilterIsExpanded) ||
                other.genreFilterIsExpanded == genreFilterIsExpanded) &&
            const DeepCollectionEquality()
                .equals(other._selectedGenres, _selectedGenres));
  }

  @override
  int get hashCode => Object.hash(runtimeType, genreFilterIsExpanded,
      const DeepCollectionEquality().hash(_selectedGenres));

  @override
  String toString() {
    return 'MovieSearchState.loading(genreFilterIsExpanded: $genreFilterIsExpanded, selectedGenres: $selectedGenres)';
  }
}

/// @nodoc
abstract mixin class _$LoadingCopyWith<$Res>
    implements $MovieSearchStateCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) _then) =
      __$LoadingCopyWithImpl;
  @override
  @useResult
  $Res call({bool genreFilterIsExpanded, List<GenreEnum> selectedGenres});
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res> implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(this._self, this._then);

  final _Loading _self;
  final $Res Function(_Loading) _then;

  /// Create a copy of MovieSearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? genreFilterIsExpanded = null,
    Object? selectedGenres = null,
  }) {
    return _then(_Loading(
      null == genreFilterIsExpanded
          ? _self.genreFilterIsExpanded
          : genreFilterIsExpanded // ignore: cast_nullable_to_non_nullable
              as bool,
      null == selectedGenres
          ? _self._selectedGenres
          : selectedGenres // ignore: cast_nullable_to_non_nullable
              as List<GenreEnum>,
    ));
  }
}

/// @nodoc

class _Loaded implements MovieSearchState {
  const _Loaded(final List<Movie> movies, this.genreFilterIsExpanded,
      this.loadingMore, final List<GenreEnum> selectedGenres)
      : _movies = movies,
        _selectedGenres = selectedGenres;

  final List<Movie> _movies;
  List<Movie> get movies {
    if (_movies is EqualUnmodifiableListView) return _movies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_movies);
  }

  @override
  final bool genreFilterIsExpanded;
  final bool loadingMore;
  final List<GenreEnum> _selectedGenres;
  @override
  List<GenreEnum> get selectedGenres {
    if (_selectedGenres is EqualUnmodifiableListView) return _selectedGenres;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedGenres);
  }

  /// Create a copy of MovieSearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoadedCopyWith<_Loaded> get copyWith =>
      __$LoadedCopyWithImpl<_Loaded>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Loaded &&
            const DeepCollectionEquality().equals(other._movies, _movies) &&
            (identical(other.genreFilterIsExpanded, genreFilterIsExpanded) ||
                other.genreFilterIsExpanded == genreFilterIsExpanded) &&
            (identical(other.loadingMore, loadingMore) ||
                other.loadingMore == loadingMore) &&
            const DeepCollectionEquality()
                .equals(other._selectedGenres, _selectedGenres));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_movies),
      genreFilterIsExpanded,
      loadingMore,
      const DeepCollectionEquality().hash(_selectedGenres));

  @override
  String toString() {
    return 'MovieSearchState.loaded(movies: $movies, genreFilterIsExpanded: $genreFilterIsExpanded, loadingMore: $loadingMore, selectedGenres: $selectedGenres)';
  }
}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res>
    implements $MovieSearchStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) =
      __$LoadedCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<Movie> movies,
      bool genreFilterIsExpanded,
      bool loadingMore,
      List<GenreEnum> selectedGenres});
}

/// @nodoc
class __$LoadedCopyWithImpl<$Res> implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

  /// Create a copy of MovieSearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? movies = null,
    Object? genreFilterIsExpanded = null,
    Object? loadingMore = null,
    Object? selectedGenres = null,
  }) {
    return _then(_Loaded(
      null == movies
          ? _self._movies
          : movies // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
      null == genreFilterIsExpanded
          ? _self.genreFilterIsExpanded
          : genreFilterIsExpanded // ignore: cast_nullable_to_non_nullable
              as bool,
      null == loadingMore
          ? _self.loadingMore
          : loadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
      null == selectedGenres
          ? _self._selectedGenres
          : selectedGenres // ignore: cast_nullable_to_non_nullable
              as List<GenreEnum>,
    ));
  }
}

/// @nodoc

class _Error implements MovieSearchState {
  const _Error(this.error, this.genreFilterIsExpanded,
      final List<GenreEnum> selectedGenres)
      : _selectedGenres = selectedGenres;

  final AppFailure error;
  @override
  final bool genreFilterIsExpanded;
  final List<GenreEnum> _selectedGenres;
  @override
  List<GenreEnum> get selectedGenres {
    if (_selectedGenres is EqualUnmodifiableListView) return _selectedGenres;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedGenres);
  }

  /// Create a copy of MovieSearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ErrorCopyWith<_Error> get copyWith =>
      __$ErrorCopyWithImpl<_Error>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Error &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.genreFilterIsExpanded, genreFilterIsExpanded) ||
                other.genreFilterIsExpanded == genreFilterIsExpanded) &&
            const DeepCollectionEquality()
                .equals(other._selectedGenres, _selectedGenres));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error, genreFilterIsExpanded,
      const DeepCollectionEquality().hash(_selectedGenres));

  @override
  String toString() {
    return 'MovieSearchState.error(error: $error, genreFilterIsExpanded: $genreFilterIsExpanded, selectedGenres: $selectedGenres)';
  }
}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res>
    implements $MovieSearchStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) =
      __$ErrorCopyWithImpl;
  @override
  @useResult
  $Res call(
      {AppFailure error,
      bool genreFilterIsExpanded,
      List<GenreEnum> selectedGenres});
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

  /// Create a copy of MovieSearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = null,
    Object? genreFilterIsExpanded = null,
    Object? selectedGenres = null,
  }) {
    return _then(_Error(
      null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as AppFailure,
      null == genreFilterIsExpanded
          ? _self.genreFilterIsExpanded
          : genreFilterIsExpanded // ignore: cast_nullable_to_non_nullable
              as bool,
      null == selectedGenres
          ? _self._selectedGenres
          : selectedGenres // ignore: cast_nullable_to_non_nullable
              as List<GenreEnum>,
    ));
  }
}

// dart format on
