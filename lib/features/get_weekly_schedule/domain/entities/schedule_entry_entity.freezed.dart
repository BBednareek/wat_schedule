// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule_entry_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ScheduleEntryEntity {
  String get raw;
  String? get subject;
  EntryType? get type;
  String? get room;
  String? get building;
  @JsonKey(name: 'block_raw')
  String get blockRaw;
  @JsonKey(name: 'block_time')
  String get blockTime;

  /// Create a copy of ScheduleEntryEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ScheduleEntryEntityCopyWith<ScheduleEntryEntity> get copyWith =>
      _$ScheduleEntryEntityCopyWithImpl<ScheduleEntryEntity>(
          this as ScheduleEntryEntity, _$identity);

  /// Serializes this ScheduleEntryEntity to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ScheduleEntryEntity &&
            (identical(other.raw, raw) || other.raw == raw) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.room, room) || other.room == room) &&
            (identical(other.building, building) ||
                other.building == building) &&
            (identical(other.blockRaw, blockRaw) ||
                other.blockRaw == blockRaw) &&
            (identical(other.blockTime, blockTime) ||
                other.blockTime == blockTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, raw, subject, type, room, building, blockRaw, blockTime);

  @override
  String toString() {
    return 'ScheduleEntryEntity(raw: $raw, subject: $subject, type: $type, room: $room, building: $building, blockRaw: $blockRaw, blockTime: $blockTime)';
  }
}

/// @nodoc
abstract mixin class $ScheduleEntryEntityCopyWith<$Res> {
  factory $ScheduleEntryEntityCopyWith(
          ScheduleEntryEntity value, $Res Function(ScheduleEntryEntity) _then) =
      _$ScheduleEntryEntityCopyWithImpl;
  @useResult
  $Res call(
      {String raw,
      String? subject,
      EntryType? type,
      String? room,
      String? building,
      @JsonKey(name: 'block_raw') String blockRaw,
      @JsonKey(name: 'block_time') String blockTime});
}

/// @nodoc
class _$ScheduleEntryEntityCopyWithImpl<$Res>
    implements $ScheduleEntryEntityCopyWith<$Res> {
  _$ScheduleEntryEntityCopyWithImpl(this._self, this._then);

  final ScheduleEntryEntity _self;
  final $Res Function(ScheduleEntryEntity) _then;

  /// Create a copy of ScheduleEntryEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? raw = null,
    Object? subject = freezed,
    Object? type = freezed,
    Object? room = freezed,
    Object? building = freezed,
    Object? blockRaw = null,
    Object? blockTime = null,
  }) {
    return _then(_self.copyWith(
      raw: null == raw
          ? _self.raw
          : raw // ignore: cast_nullable_to_non_nullable
              as String,
      subject: freezed == subject
          ? _self.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as EntryType?,
      room: freezed == room
          ? _self.room
          : room // ignore: cast_nullable_to_non_nullable
              as String?,
      building: freezed == building
          ? _self.building
          : building // ignore: cast_nullable_to_non_nullable
              as String?,
      blockRaw: null == blockRaw
          ? _self.blockRaw
          : blockRaw // ignore: cast_nullable_to_non_nullable
              as String,
      blockTime: null == blockTime
          ? _self.blockTime
          : blockTime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [ScheduleEntryEntity].
extension ScheduleEntryEntityPatterns on ScheduleEntryEntity {
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
    TResult Function(_ScheduleEntryEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ScheduleEntryEntity() when $default != null:
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
    TResult Function(_ScheduleEntryEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ScheduleEntryEntity():
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
    TResult? Function(_ScheduleEntryEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ScheduleEntryEntity() when $default != null:
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
            String raw,
            String? subject,
            EntryType? type,
            String? room,
            String? building,
            @JsonKey(name: 'block_raw') String blockRaw,
            @JsonKey(name: 'block_time') String blockTime)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ScheduleEntryEntity() when $default != null:
        return $default(_that.raw, _that.subject, _that.type, _that.room,
            _that.building, _that.blockRaw, _that.blockTime);
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
            String raw,
            String? subject,
            EntryType? type,
            String? room,
            String? building,
            @JsonKey(name: 'block_raw') String blockRaw,
            @JsonKey(name: 'block_time') String blockTime)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ScheduleEntryEntity():
        return $default(_that.raw, _that.subject, _that.type, _that.room,
            _that.building, _that.blockRaw, _that.blockTime);
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
            String raw,
            String? subject,
            EntryType? type,
            String? room,
            String? building,
            @JsonKey(name: 'block_raw') String blockRaw,
            @JsonKey(name: 'block_time') String blockTime)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ScheduleEntryEntity() when $default != null:
        return $default(_that.raw, _that.subject, _that.type, _that.room,
            _that.building, _that.blockRaw, _that.blockTime);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ScheduleEntryEntity implements ScheduleEntryEntity {
  _ScheduleEntryEntity(
      {required this.raw,
      this.subject,
      this.type,
      this.room,
      this.building,
      @JsonKey(name: 'block_raw') required this.blockRaw,
      @JsonKey(name: 'block_time') required this.blockTime});
  factory _ScheduleEntryEntity.fromJson(Map<String, dynamic> json) =>
      _$ScheduleEntryEntityFromJson(json);

  @override
  final String raw;
  @override
  final String? subject;
  @override
  final EntryType? type;
  @override
  final String? room;
  @override
  final String? building;
  @override
  @JsonKey(name: 'block_raw')
  final String blockRaw;
  @override
  @JsonKey(name: 'block_time')
  final String blockTime;

  /// Create a copy of ScheduleEntryEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ScheduleEntryEntityCopyWith<_ScheduleEntryEntity> get copyWith =>
      __$ScheduleEntryEntityCopyWithImpl<_ScheduleEntryEntity>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ScheduleEntryEntityToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ScheduleEntryEntity &&
            (identical(other.raw, raw) || other.raw == raw) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.room, room) || other.room == room) &&
            (identical(other.building, building) ||
                other.building == building) &&
            (identical(other.blockRaw, blockRaw) ||
                other.blockRaw == blockRaw) &&
            (identical(other.blockTime, blockTime) ||
                other.blockTime == blockTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, raw, subject, type, room, building, blockRaw, blockTime);

  @override
  String toString() {
    return 'ScheduleEntryEntity(raw: $raw, subject: $subject, type: $type, room: $room, building: $building, blockRaw: $blockRaw, blockTime: $blockTime)';
  }
}

/// @nodoc
abstract mixin class _$ScheduleEntryEntityCopyWith<$Res>
    implements $ScheduleEntryEntityCopyWith<$Res> {
  factory _$ScheduleEntryEntityCopyWith(_ScheduleEntryEntity value,
          $Res Function(_ScheduleEntryEntity) _then) =
      __$ScheduleEntryEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String raw,
      String? subject,
      EntryType? type,
      String? room,
      String? building,
      @JsonKey(name: 'block_raw') String blockRaw,
      @JsonKey(name: 'block_time') String blockTime});
}

/// @nodoc
class __$ScheduleEntryEntityCopyWithImpl<$Res>
    implements _$ScheduleEntryEntityCopyWith<$Res> {
  __$ScheduleEntryEntityCopyWithImpl(this._self, this._then);

  final _ScheduleEntryEntity _self;
  final $Res Function(_ScheduleEntryEntity) _then;

  /// Create a copy of ScheduleEntryEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? raw = null,
    Object? subject = freezed,
    Object? type = freezed,
    Object? room = freezed,
    Object? building = freezed,
    Object? blockRaw = null,
    Object? blockTime = null,
  }) {
    return _then(_ScheduleEntryEntity(
      raw: null == raw
          ? _self.raw
          : raw // ignore: cast_nullable_to_non_nullable
              as String,
      subject: freezed == subject
          ? _self.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as EntryType?,
      room: freezed == room
          ? _self.room
          : room // ignore: cast_nullable_to_non_nullable
              as String?,
      building: freezed == building
          ? _self.building
          : building // ignore: cast_nullable_to_non_nullable
              as String?,
      blockRaw: null == blockRaw
          ? _self.blockRaw
          : blockRaw // ignore: cast_nullable_to_non_nullable
              as String,
      blockTime: null == blockTime
          ? _self.blockTime
          : blockTime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
