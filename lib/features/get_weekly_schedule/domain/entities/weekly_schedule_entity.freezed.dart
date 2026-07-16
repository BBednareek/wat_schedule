// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weekly_schedule_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WeeklyScheduleEntity {
  @JsonKey(name: 'schedule')
  List<DayScheduleEntity> get days;

  /// Create a copy of WeeklyScheduleEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WeeklyScheduleEntityCopyWith<WeeklyScheduleEntity> get copyWith =>
      _$WeeklyScheduleEntityCopyWithImpl<WeeklyScheduleEntity>(
          this as WeeklyScheduleEntity, _$identity);

  /// Serializes this WeeklyScheduleEntity to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WeeklyScheduleEntity &&
            const DeepCollectionEquality().equals(other.days, days));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(days));

  @override
  String toString() {
    return 'WeeklyScheduleEntity(days: $days)';
  }
}

/// @nodoc
abstract mixin class $WeeklyScheduleEntityCopyWith<$Res> {
  factory $WeeklyScheduleEntityCopyWith(WeeklyScheduleEntity value,
          $Res Function(WeeklyScheduleEntity) _then) =
      _$WeeklyScheduleEntityCopyWithImpl;
  @useResult
  $Res call({@JsonKey(name: 'schedule') List<DayScheduleEntity> days});
}

/// @nodoc
class _$WeeklyScheduleEntityCopyWithImpl<$Res>
    implements $WeeklyScheduleEntityCopyWith<$Res> {
  _$WeeklyScheduleEntityCopyWithImpl(this._self, this._then);

  final WeeklyScheduleEntity _self;
  final $Res Function(WeeklyScheduleEntity) _then;

  /// Create a copy of WeeklyScheduleEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? days = null,
  }) {
    return _then(_self.copyWith(
      days: null == days
          ? _self.days
          : days // ignore: cast_nullable_to_non_nullable
              as List<DayScheduleEntity>,
    ));
  }
}

/// Adds pattern-matching-related methods to [WeeklyScheduleEntity].
extension WeeklyScheduleEntityPatterns on WeeklyScheduleEntity {
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
    TResult Function(_WeeklyScheduleEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WeeklyScheduleEntity() when $default != null:
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
    TResult Function(_WeeklyScheduleEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WeeklyScheduleEntity():
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
    TResult? Function(_WeeklyScheduleEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WeeklyScheduleEntity() when $default != null:
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
    TResult Function(@JsonKey(name: 'schedule') List<DayScheduleEntity> days)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WeeklyScheduleEntity() when $default != null:
        return $default(_that.days);
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
    TResult Function(@JsonKey(name: 'schedule') List<DayScheduleEntity> days)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WeeklyScheduleEntity():
        return $default(_that.days);
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
    TResult? Function(@JsonKey(name: 'schedule') List<DayScheduleEntity> days)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WeeklyScheduleEntity() when $default != null:
        return $default(_that.days);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _WeeklyScheduleEntity implements WeeklyScheduleEntity {
  _WeeklyScheduleEntity(
      {@JsonKey(name: 'schedule') required final List<DayScheduleEntity> days})
      : _days = days;
  factory _WeeklyScheduleEntity.fromJson(Map<String, dynamic> json) =>
      _$WeeklyScheduleEntityFromJson(json);

  final List<DayScheduleEntity> _days;
  @override
  @JsonKey(name: 'schedule')
  List<DayScheduleEntity> get days {
    if (_days is EqualUnmodifiableListView) return _days;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_days);
  }

  /// Create a copy of WeeklyScheduleEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WeeklyScheduleEntityCopyWith<_WeeklyScheduleEntity> get copyWith =>
      __$WeeklyScheduleEntityCopyWithImpl<_WeeklyScheduleEntity>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$WeeklyScheduleEntityToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WeeklyScheduleEntity &&
            const DeepCollectionEquality().equals(other._days, _days));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_days));

  @override
  String toString() {
    return 'WeeklyScheduleEntity(days: $days)';
  }
}

/// @nodoc
abstract mixin class _$WeeklyScheduleEntityCopyWith<$Res>
    implements $WeeklyScheduleEntityCopyWith<$Res> {
  factory _$WeeklyScheduleEntityCopyWith(_WeeklyScheduleEntity value,
          $Res Function(_WeeklyScheduleEntity) _then) =
      __$WeeklyScheduleEntityCopyWithImpl;
  @override
  @useResult
  $Res call({@JsonKey(name: 'schedule') List<DayScheduleEntity> days});
}

/// @nodoc
class __$WeeklyScheduleEntityCopyWithImpl<$Res>
    implements _$WeeklyScheduleEntityCopyWith<$Res> {
  __$WeeklyScheduleEntityCopyWithImpl(this._self, this._then);

  final _WeeklyScheduleEntity _self;
  final $Res Function(_WeeklyScheduleEntity) _then;

  /// Create a copy of WeeklyScheduleEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? days = null,
  }) {
    return _then(_WeeklyScheduleEntity(
      days: null == days
          ? _self._days
          : days // ignore: cast_nullable_to_non_nullable
              as List<DayScheduleEntity>,
    ));
  }
}

// dart format on
