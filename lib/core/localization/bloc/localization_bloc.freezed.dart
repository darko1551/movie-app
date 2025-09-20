// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'localization_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LocalizationEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LocalizationEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LocalizationEvent()';
  }
}

/// @nodoc
class $LocalizationEventCopyWith<$Res> {
  $LocalizationEventCopyWith(
      LocalizationEvent _, $Res Function(LocalizationEvent) __);
}

/// Adds pattern-matching-related methods to [LocalizationEvent].
extension LocalizationEventPatterns on LocalizationEvent {
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
    TResult Function(_LocaleChanged value)? localeChanged,
    TResult Function(_LoadInitialLocale value)? loadInitialLocale,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LocaleChanged() when localeChanged != null:
        return localeChanged(_that);
      case _LoadInitialLocale() when loadInitialLocale != null:
        return loadInitialLocale(_that);
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
    required TResult Function(_LocaleChanged value) localeChanged,
    required TResult Function(_LoadInitialLocale value) loadInitialLocale,
  }) {
    final _that = this;
    switch (_that) {
      case _LocaleChanged():
        return localeChanged(_that);
      case _LoadInitialLocale():
        return loadInitialLocale(_that);
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
    TResult? Function(_LocaleChanged value)? localeChanged,
    TResult? Function(_LoadInitialLocale value)? loadInitialLocale,
  }) {
    final _that = this;
    switch (_that) {
      case _LocaleChanged() when localeChanged != null:
        return localeChanged(_that);
      case _LoadInitialLocale() when loadInitialLocale != null:
        return loadInitialLocale(_that);
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
    TResult Function(LocaleEnum locale)? localeChanged,
    TResult Function()? loadInitialLocale,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LocaleChanged() when localeChanged != null:
        return localeChanged(_that.locale);
      case _LoadInitialLocale() when loadInitialLocale != null:
        return loadInitialLocale();
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
    required TResult Function(LocaleEnum locale) localeChanged,
    required TResult Function() loadInitialLocale,
  }) {
    final _that = this;
    switch (_that) {
      case _LocaleChanged():
        return localeChanged(_that.locale);
      case _LoadInitialLocale():
        return loadInitialLocale();
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
    TResult? Function(LocaleEnum locale)? localeChanged,
    TResult? Function()? loadInitialLocale,
  }) {
    final _that = this;
    switch (_that) {
      case _LocaleChanged() when localeChanged != null:
        return localeChanged(_that.locale);
      case _LoadInitialLocale() when loadInitialLocale != null:
        return loadInitialLocale();
      case _:
        return null;
    }
  }
}

/// @nodoc

class _LocaleChanged implements LocalizationEvent {
  const _LocaleChanged(this.locale);

  final LocaleEnum locale;

  /// Create a copy of LocalizationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LocaleChangedCopyWith<_LocaleChanged> get copyWith =>
      __$LocaleChangedCopyWithImpl<_LocaleChanged>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LocaleChanged &&
            const DeepCollectionEquality().equals(other.locale, locale));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(locale));

  @override
  String toString() {
    return 'LocalizationEvent.localeChanged(locale: $locale)';
  }
}

/// @nodoc
abstract mixin class _$LocaleChangedCopyWith<$Res>
    implements $LocalizationEventCopyWith<$Res> {
  factory _$LocaleChangedCopyWith(
          _LocaleChanged value, $Res Function(_LocaleChanged) _then) =
      __$LocaleChangedCopyWithImpl;
  @useResult
  $Res call({LocaleEnum locale});
}

/// @nodoc
class __$LocaleChangedCopyWithImpl<$Res>
    implements _$LocaleChangedCopyWith<$Res> {
  __$LocaleChangedCopyWithImpl(this._self, this._then);

  final _LocaleChanged _self;
  final $Res Function(_LocaleChanged) _then;

  /// Create a copy of LocalizationEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? locale = freezed,
  }) {
    return _then(_LocaleChanged(
      freezed == locale
          ? _self.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as LocaleEnum,
    ));
  }
}

/// @nodoc

class _LoadInitialLocale implements LocalizationEvent {
  const _LoadInitialLocale();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _LoadInitialLocale);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LocalizationEvent.loadInitialLocale()';
  }
}

/// @nodoc
mixin _$LocalizationState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LocalizationState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LocalizationState()';
  }
}

/// @nodoc
class $LocalizationStateCopyWith<$Res> {
  $LocalizationStateCopyWith(
      LocalizationState _, $Res Function(LocalizationState) __);
}

/// Adds pattern-matching-related methods to [LocalizationState].
extension LocalizationStatePatterns on LocalizationState {
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
    TResult Function(_Initial value)? initial,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _Loaded() when loaded != null:
        return loaded(_that);
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loaded value) loaded,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial(_that);
      case _Loaded():
        return loaded(_that);
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
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loaded value)? loaded,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _Loaded() when loaded != null:
        return loaded(_that);
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
    TResult Function()? initial,
    TResult Function(LocaleEnum locale, AppFailure? error)? loaded,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _Loaded() when loaded != null:
        return loaded(_that.locale, _that.error);
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
    required TResult Function() initial,
    required TResult Function(LocaleEnum locale, AppFailure? error) loaded,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial();
      case _Loaded():
        return loaded(_that.locale, _that.error);
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
    TResult? Function()? initial,
    TResult? Function(LocaleEnum locale, AppFailure? error)? loaded,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _Loaded() when loaded != null:
        return loaded(_that.locale, _that.error);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial implements LocalizationState {
  const _Initial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LocalizationState.initial()';
  }
}

/// @nodoc

class _Loaded implements LocalizationState {
  const _Loaded(this.locale, {this.error});

  final LocaleEnum locale;
  final AppFailure? error;

  /// Create a copy of LocalizationState
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
            const DeepCollectionEquality().equals(other.locale, locale) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(locale), error);

  @override
  String toString() {
    return 'LocalizationState.loaded(locale: $locale, error: $error)';
  }
}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res>
    implements $LocalizationStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) =
      __$LoadedCopyWithImpl;
  @useResult
  $Res call({LocaleEnum locale, AppFailure? error});
}

/// @nodoc
class __$LoadedCopyWithImpl<$Res> implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

  /// Create a copy of LocalizationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? locale = freezed,
    Object? error = freezed,
  }) {
    return _then(_Loaded(
      freezed == locale
          ? _self.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as LocaleEnum,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as AppFailure?,
    ));
  }
}

// dart format on
