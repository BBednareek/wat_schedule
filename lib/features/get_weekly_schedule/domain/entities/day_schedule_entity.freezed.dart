// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'day_schedule_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DayScheduleEntity {
  String get date;
  List<ScheduleEntryEntity> get entries;

  /// Create a copy of DayScheduleEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DayScheduleEntityCopyWith<DayScheduleEntity> get copyWith =>
      _$DayScheduleEntityCopyWithImpl<DayScheduleEntity>(
          this as DayScheduleEntity, _$identity);

  /// Serializes this DayScheduleEntity to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DayScheduleEntity &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality().equals(other.entries, entries));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, date, const DeepCollectionEquality().hash(entries));

  @override
  String toString() {
    return 'DayScheduleEntity(date: $date, entries: $entries)';
  }
}

/// @nodoc
abstract mixin class $DayScheduleEntityCopyWith<$Res> {
  factory $DayScheduleEntityCopyWith(
          DayScheduleEntity value, $Res Function(DayScheduleEntity) _then) =
      _$DayScheduleEntityCopyWithImpl;
  @useResult
  $Res call({String date, List<ScheduleEntryEntity> entries});
}

/// @nodoc
class _$DayScheduleEntityCopyWithImpl<$Res>
    implements $DayScheduleEntityCopyWith<$Res> {
  _$DayScheduleEntityCopyWithImpl(this._self, this._then);

  final DayScheduleEntity _self;
  final $Res Function(DayScheduleEntity) _then;

  /// Create a copy of DayScheduleEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? entries = null,
  }) {
    return _then(_self.copyWith(
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      entries: null == entries
          ? _self.entries
          : entries // ignore: cast_nullable_to_non_nullable
              as List<ScheduleEntryEntity>,
    ));
  }
}

/// Adds pattern-matching-related methods to [DayScheduleEntity].
extension DayScheduleEntityPatterns on DayScheduleEntity {
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
    TResult Function(_DayScheduleEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DayScheduleEntity() when $default != null:
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
    TResult Function(_DayScheduleEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DayScheduleEntity():
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
    TResult? Function(_DayScheduleEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DayScheduleEntity() when $default != null:
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
    TResult Function(String date, List<ScheduleEntryEntity> entries)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DayScheduleEntity() when $default != null:
        return $default(_that.date, _that.entries);
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
    TResult Function(String date, List<ScheduleEntryEntity> entries) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DayScheduleEntity():
        return $default(_that.date, _that.entries);
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
    TResult? Function(String date, List<ScheduleEntryEntity> entries)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DayScheduleEntity() when $default != null:
        return $default(_that.date, _that.entries);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _DayScheduleEntity implements DayScheduleEntity {
  _DayScheduleEntity(
      {required this.date, required final List<ScheduleEntryEntity> entries})
      : _entries = entries;
  factory _DayScheduleEntity.fromJson(Map<String, dynamic> json) =>
      _$DayScheduleEntityFromJson(json);

  @override
  final String date;
  final List<ScheduleEntryEntity> _entries;
  @override
  List<ScheduleEntryEntity> get entries {
    if (_entries is EqualUnmodifiableListView) return _entries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_entries);
  }

  /// Create a copy of DayScheduleEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DayScheduleEntityCopyWith<_DayScheduleEntity> get copyWith =>
      __$DayScheduleEntityCopyWithImpl<_DayScheduleEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DayScheduleEntityToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DayScheduleEntity &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality().equals(other._entries, _entries));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, date, const DeepCollectionEquality().hash(_entries));

  @override
  String toString() {
    return 'DayScheduleEntity(date: $date, entries: $entries)';
  }
}

/// @nodoc
abstract mixin class _$DayScheduleEntityCopyWith<$Res>
    implements $DayScheduleEntityCopyWith<$Res> {
  factory _$DayScheduleEntityCopyWith(
          _DayScheduleEntity value, $Res Function(_DayScheduleEntity) _then) =
      __$DayScheduleEntityCopyWithImpl;
  @override
  @useResult
  $Res call({String date, List<ScheduleEntryEntity> entries});
}

/// @nodoc
class __$DayScheduleEntityCopyWithImpl<$Res>
    implements _$DayScheduleEntityCopyWith<$Res> {
  __$DayScheduleEntityCopyWithImpl(this._self, this._then);

  final _DayScheduleEntity _self;
  final $Res Function(_DayScheduleEntity) _then;

  /// Create a copy of DayScheduleEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? date = null,
    Object? entries = null,
  }) {
    return _then(_DayScheduleEntity(
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      entries: null == entries
          ? _self._entries
          : entries // ignore: cast_nullable_to_non_nullable
              as List<ScheduleEntryEntity>,
    ));
  }
}

// dart format on
