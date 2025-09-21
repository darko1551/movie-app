// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_details_favorite_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MovieDetailsFavoriteEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MovieDetailsFavoriteEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'MovieDetailsFavoriteEvent()';
  }
}

/// @nodoc
class $MovieDetailsFavoriteEventCopyWith<$Res> {
  $MovieDetailsFavoriteEventCopyWith(
      MovieDetailsFavoriteEvent _, $Res Function(MovieDetailsFavoriteEvent) __);
}

/// Adds pattern-matching-related methods to [MovieDetailsFavoriteEvent].
extension MovieDetailsFavoriteEventPatterns on MovieDetailsFavoriteEvent {
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
    TResult Function(_WatchFavoriteStatus value)? watchFavoriteStatus,
    TResult Function(_AddOrRemoveFavorite value)? addOrRemoveFavorite,
    TResult Function(_OnFavoriteStatusChanged value)? onFavoriteStatusChanged,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WatchFavoriteStatus() when watchFavoriteStatus != null:
        return watchFavoriteStatus(_that);
      case _AddOrRemoveFavorite() when addOrRemoveFavorite != null:
        return addOrRemoveFavorite(_that);
      case _OnFavoriteStatusChanged() when onFavoriteStatusChanged != null:
        return onFavoriteStatusChanged(_that);
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
    required TResult Function(_WatchFavoriteStatus value) watchFavoriteStatus,
    required TResult Function(_AddOrRemoveFavorite value) addOrRemoveFavorite,
    required TResult Function(_OnFavoriteStatusChanged value)
        onFavoriteStatusChanged,
  }) {
    final _that = this;
    switch (_that) {
      case _WatchFavoriteStatus():
        return watchFavoriteStatus(_that);
      case _AddOrRemoveFavorite():
        return addOrRemoveFavorite(_that);
      case _OnFavoriteStatusChanged():
        return onFavoriteStatusChanged(_that);
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
    TResult? Function(_WatchFavoriteStatus value)? watchFavoriteStatus,
    TResult? Function(_AddOrRemoveFavorite value)? addOrRemoveFavorite,
    TResult? Function(_OnFavoriteStatusChanged value)? onFavoriteStatusChanged,
  }) {
    final _that = this;
    switch (_that) {
      case _WatchFavoriteStatus() when watchFavoriteStatus != null:
        return watchFavoriteStatus(_that);
      case _AddOrRemoveFavorite() when addOrRemoveFavorite != null:
        return addOrRemoveFavorite(_that);
      case _OnFavoriteStatusChanged() when onFavoriteStatusChanged != null:
        return onFavoriteStatusChanged(_that);
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
    TResult Function(int movieId)? watchFavoriteStatus,
    TResult Function(Movie movie)? addOrRemoveFavorite,
    TResult Function(bool isFav)? onFavoriteStatusChanged,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WatchFavoriteStatus() when watchFavoriteStatus != null:
        return watchFavoriteStatus(_that.movieId);
      case _AddOrRemoveFavorite() when addOrRemoveFavorite != null:
        return addOrRemoveFavorite(_that.movie);
      case _OnFavoriteStatusChanged() when onFavoriteStatusChanged != null:
        return onFavoriteStatusChanged(_that.isFav);
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
    required TResult Function(int movieId) watchFavoriteStatus,
    required TResult Function(Movie movie) addOrRemoveFavorite,
    required TResult Function(bool isFav) onFavoriteStatusChanged,
  }) {
    final _that = this;
    switch (_that) {
      case _WatchFavoriteStatus():
        return watchFavoriteStatus(_that.movieId);
      case _AddOrRemoveFavorite():
        return addOrRemoveFavorite(_that.movie);
      case _OnFavoriteStatusChanged():
        return onFavoriteStatusChanged(_that.isFav);
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
    TResult? Function(int movieId)? watchFavoriteStatus,
    TResult? Function(Movie movie)? addOrRemoveFavorite,
    TResult? Function(bool isFav)? onFavoriteStatusChanged,
  }) {
    final _that = this;
    switch (_that) {
      case _WatchFavoriteStatus() when watchFavoriteStatus != null:
        return watchFavoriteStatus(_that.movieId);
      case _AddOrRemoveFavorite() when addOrRemoveFavorite != null:
        return addOrRemoveFavorite(_that.movie);
      case _OnFavoriteStatusChanged() when onFavoriteStatusChanged != null:
        return onFavoriteStatusChanged(_that.isFav);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _WatchFavoriteStatus implements MovieDetailsFavoriteEvent {
  const _WatchFavoriteStatus(this.movieId);

  final int movieId;

  /// Create a copy of MovieDetailsFavoriteEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WatchFavoriteStatusCopyWith<_WatchFavoriteStatus> get copyWith =>
      __$WatchFavoriteStatusCopyWithImpl<_WatchFavoriteStatus>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WatchFavoriteStatus &&
            (identical(other.movieId, movieId) || other.movieId == movieId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, movieId);

  @override
  String toString() {
    return 'MovieDetailsFavoriteEvent.watchFavoriteStatus(movieId: $movieId)';
  }
}

/// @nodoc
abstract mixin class _$WatchFavoriteStatusCopyWith<$Res>
    implements $MovieDetailsFavoriteEventCopyWith<$Res> {
  factory _$WatchFavoriteStatusCopyWith(_WatchFavoriteStatus value,
          $Res Function(_WatchFavoriteStatus) _then) =
      __$WatchFavoriteStatusCopyWithImpl;
  @useResult
  $Res call({int movieId});
}

/// @nodoc
class __$WatchFavoriteStatusCopyWithImpl<$Res>
    implements _$WatchFavoriteStatusCopyWith<$Res> {
  __$WatchFavoriteStatusCopyWithImpl(this._self, this._then);

  final _WatchFavoriteStatus _self;
  final $Res Function(_WatchFavoriteStatus) _then;

  /// Create a copy of MovieDetailsFavoriteEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? movieId = null,
  }) {
    return _then(_WatchFavoriteStatus(
      null == movieId
          ? _self.movieId
          : movieId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _AddOrRemoveFavorite implements MovieDetailsFavoriteEvent {
  const _AddOrRemoveFavorite(this.movie);

  final Movie movie;

  /// Create a copy of MovieDetailsFavoriteEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AddOrRemoveFavoriteCopyWith<_AddOrRemoveFavorite> get copyWith =>
      __$AddOrRemoveFavoriteCopyWithImpl<_AddOrRemoveFavorite>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AddOrRemoveFavorite &&
            (identical(other.movie, movie) || other.movie == movie));
  }

  @override
  int get hashCode => Object.hash(runtimeType, movie);

  @override
  String toString() {
    return 'MovieDetailsFavoriteEvent.addOrRemoveFavorite(movie: $movie)';
  }
}

/// @nodoc
abstract mixin class _$AddOrRemoveFavoriteCopyWith<$Res>
    implements $MovieDetailsFavoriteEventCopyWith<$Res> {
  factory _$AddOrRemoveFavoriteCopyWith(_AddOrRemoveFavorite value,
          $Res Function(_AddOrRemoveFavorite) _then) =
      __$AddOrRemoveFavoriteCopyWithImpl;
  @useResult
  $Res call({Movie movie});

  $MovieCopyWith<$Res> get movie;
}

/// @nodoc
class __$AddOrRemoveFavoriteCopyWithImpl<$Res>
    implements _$AddOrRemoveFavoriteCopyWith<$Res> {
  __$AddOrRemoveFavoriteCopyWithImpl(this._self, this._then);

  final _AddOrRemoveFavorite _self;
  final $Res Function(_AddOrRemoveFavorite) _then;

  /// Create a copy of MovieDetailsFavoriteEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? movie = null,
  }) {
    return _then(_AddOrRemoveFavorite(
      null == movie
          ? _self.movie
          : movie // ignore: cast_nullable_to_non_nullable
              as Movie,
    ));
  }

  /// Create a copy of MovieDetailsFavoriteEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MovieCopyWith<$Res> get movie {
    return $MovieCopyWith<$Res>(_self.movie, (value) {
      return _then(_self.copyWith(movie: value));
    });
  }
}

/// @nodoc

class _OnFavoriteStatusChanged implements MovieDetailsFavoriteEvent {
  const _OnFavoriteStatusChanged(this.isFav);

  final bool isFav;

  /// Create a copy of MovieDetailsFavoriteEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OnFavoriteStatusChangedCopyWith<_OnFavoriteStatusChanged> get copyWith =>
      __$OnFavoriteStatusChangedCopyWithImpl<_OnFavoriteStatusChanged>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OnFavoriteStatusChanged &&
            (identical(other.isFav, isFav) || other.isFav == isFav));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isFav);

  @override
  String toString() {
    return 'MovieDetailsFavoriteEvent.onFavoriteStatusChanged(isFav: $isFav)';
  }
}

/// @nodoc
abstract mixin class _$OnFavoriteStatusChangedCopyWith<$Res>
    implements $MovieDetailsFavoriteEventCopyWith<$Res> {
  factory _$OnFavoriteStatusChangedCopyWith(_OnFavoriteStatusChanged value,
          $Res Function(_OnFavoriteStatusChanged) _then) =
      __$OnFavoriteStatusChangedCopyWithImpl;
  @useResult
  $Res call({bool isFav});
}

/// @nodoc
class __$OnFavoriteStatusChangedCopyWithImpl<$Res>
    implements _$OnFavoriteStatusChangedCopyWith<$Res> {
  __$OnFavoriteStatusChangedCopyWithImpl(this._self, this._then);

  final _OnFavoriteStatusChanged _self;
  final $Res Function(_OnFavoriteStatusChanged) _then;

  /// Create a copy of MovieDetailsFavoriteEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isFav = null,
  }) {
    return _then(_OnFavoriteStatusChanged(
      null == isFav
          ? _self.isFav
          : isFav // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$MovieDetailsFavoriteState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MovieDetailsFavoriteState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'MovieDetailsFavoriteState()';
  }
}

/// @nodoc
class $MovieDetailsFavoriteStateCopyWith<$Res> {
  $MovieDetailsFavoriteStateCopyWith(
      MovieDetailsFavoriteState _, $Res Function(MovieDetailsFavoriteState) __);
}

/// Adds pattern-matching-related methods to [MovieDetailsFavoriteState].
extension MovieDetailsFavoriteStatePatterns on MovieDetailsFavoriteState {
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
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
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
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    final _that = this;
    switch (_that) {
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
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    final _that = this;
    switch (_that) {
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
    TResult Function()? loading,
    TResult Function(bool isFavorite)? loaded,
    TResult Function(AppFailure error)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Loading() when loading != null:
        return loading();
      case _Loaded() when loaded != null:
        return loaded(_that.isFavorite);
      case _Error() when error != null:
        return error(_that.error);
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
    required TResult Function() loading,
    required TResult Function(bool isFavorite) loaded,
    required TResult Function(AppFailure error) error,
  }) {
    final _that = this;
    switch (_that) {
      case _Loading():
        return loading();
      case _Loaded():
        return loaded(_that.isFavorite);
      case _Error():
        return error(_that.error);
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
    TResult? Function()? loading,
    TResult? Function(bool isFavorite)? loaded,
    TResult? Function(AppFailure error)? error,
  }) {
    final _that = this;
    switch (_that) {
      case _Loading() when loading != null:
        return loading();
      case _Loaded() when loaded != null:
        return loaded(_that.isFavorite);
      case _Error() when error != null:
        return error(_that.error);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Loading implements MovieDetailsFavoriteState {
  const _Loading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'MovieDetailsFavoriteState.loading()';
  }
}

/// @nodoc

class _Loaded implements MovieDetailsFavoriteState {
  const _Loaded(this.isFavorite);

  final bool isFavorite;

  /// Create a copy of MovieDetailsFavoriteState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoadedCopyWith<_Loaded> get copyWith =>
      __$LoadedCopyWithImpl<_Loaded>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Loaded &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isFavorite);

  @override
  String toString() {
    return 'MovieDetailsFavoriteState.loaded(isFavorite: $isFavorite)';
  }
}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res>
    implements $MovieDetailsFavoriteStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) =
      __$LoadedCopyWithImpl;
  @useResult
  $Res call({bool isFavorite});
}

/// @nodoc
class __$LoadedCopyWithImpl<$Res> implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

  /// Create a copy of MovieDetailsFavoriteState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isFavorite = null,
  }) {
    return _then(_Loaded(
      null == isFavorite
          ? _self.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _Error implements MovieDetailsFavoriteState {
  const _Error(this.error);

  final AppFailure error;

  /// Create a copy of MovieDetailsFavoriteState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ErrorCopyWith<_Error> get copyWith =>
      __$ErrorCopyWithImpl<_Error>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Error &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @override
  String toString() {
    return 'MovieDetailsFavoriteState.error(error: $error)';
  }
}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res>
    implements $MovieDetailsFavoriteStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) =
      __$ErrorCopyWithImpl;
  @useResult
  $Res call({AppFailure error});
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

  /// Create a copy of MovieDetailsFavoriteState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = null,
  }) {
    return _then(_Error(
      null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as AppFailure,
    ));
  }
}

// dart format on
