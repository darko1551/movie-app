// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cast_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CastResult {
  List<Cast>? get cast;

  /// Create a copy of CastResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CastResultCopyWith<CastResult> get copyWith =>
      _$CastResultCopyWithImpl<CastResult>(this as CastResult, _$identity);

  /// Serializes this CastResult to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CastResult &&
            const DeepCollectionEquality().equals(other.cast, cast));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(cast));

  @override
  String toString() {
    return 'CastResult(cast: $cast)';
  }
}

/// @nodoc
abstract mixin class $CastResultCopyWith<$Res> {
  factory $CastResultCopyWith(
          CastResult value, $Res Function(CastResult) _then) =
      _$CastResultCopyWithImpl;
  @useResult
  $Res call({List<Cast>? cast});
}

/// @nodoc
class _$CastResultCopyWithImpl<$Res> implements $CastResultCopyWith<$Res> {
  _$CastResultCopyWithImpl(this._self, this._then);

  final CastResult _self;
  final $Res Function(CastResult) _then;

  /// Create a copy of CastResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cast = freezed,
  }) {
    return _then(_self.copyWith(
      cast: freezed == cast
          ? _self.cast
          : cast // ignore: cast_nullable_to_non_nullable
              as List<Cast>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [CastResult].
extension CastResultPatterns on CastResult {
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
    TResult Function(_CastResult value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CastResult() when $default != null:
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
    TResult Function(_CastResult value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CastResult():
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
    TResult? Function(_CastResult value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CastResult() when $default != null:
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
    TResult Function(List<Cast>? cast)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CastResult() when $default != null:
        return $default(_that.cast);
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
    TResult Function(List<Cast>? cast) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CastResult():
        return $default(_that.cast);
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
    TResult? Function(List<Cast>? cast)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CastResult() when $default != null:
        return $default(_that.cast);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CastResult implements CastResult {
  _CastResult({required final List<Cast>? cast}) : _cast = cast;
  factory _CastResult.fromJson(Map<String, dynamic> json) =>
      _$CastResultFromJson(json);

  final List<Cast>? _cast;
  @override
  List<Cast>? get cast {
    final value = _cast;
    if (value == null) return null;
    if (_cast is EqualUnmodifiableListView) return _cast;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of CastResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CastResultCopyWith<_CastResult> get copyWith =>
      __$CastResultCopyWithImpl<_CastResult>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CastResultToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CastResult &&
            const DeepCollectionEquality().equals(other._cast, _cast));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_cast));

  @override
  String toString() {
    return 'CastResult(cast: $cast)';
  }
}

/// @nodoc
abstract mixin class _$CastResultCopyWith<$Res>
    implements $CastResultCopyWith<$Res> {
  factory _$CastResultCopyWith(
          _CastResult value, $Res Function(_CastResult) _then) =
      __$CastResultCopyWithImpl;
  @override
  @useResult
  $Res call({List<Cast>? cast});
}

/// @nodoc
class __$CastResultCopyWithImpl<$Res> implements _$CastResultCopyWith<$Res> {
  __$CastResultCopyWithImpl(this._self, this._then);

  final _CastResult _self;
  final $Res Function(_CastResult) _then;

  /// Create a copy of CastResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? cast = freezed,
  }) {
    return _then(_CastResult(
      cast: freezed == cast
          ? _self._cast
          : cast // ignore: cast_nullable_to_non_nullable
              as List<Cast>?,
    ));
  }
}

// dart format on
