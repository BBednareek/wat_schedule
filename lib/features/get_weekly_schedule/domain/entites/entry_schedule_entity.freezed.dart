// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'entry_schedule_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EntryEntity {
  String get raw;
  String? get subject;
  EntryType? get type;
  String? get room;
  String? get building; // ignore: non_constant_identifier_names
  String get block_raw; // ignore: non_constant_identifier_names
  String get block_time;

  /// Create a copy of EntryEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EntryEntityCopyWith<EntryEntity> get copyWith =>
      _$EntryEntityCopyWithImpl<EntryEntity>(this as EntryEntity, _$identity);

  /// Serializes this EntryEntity to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EntryEntity &&
            (identical(other.raw, raw) || other.raw == raw) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.room, room) || other.room == room) &&
            (identical(other.building, building) ||
                other.building == building) &&
            (identical(other.block_raw, block_raw) ||
                other.block_raw == block_raw) &&
            (identical(other.block_time, block_time) ||
                other.block_time == block_time));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, raw, subject, type, room, building, block_raw, block_time);

  @override
  String toString() {
    return 'EntryEntity(raw: $raw, subject: $subject, type: $type, room: $room, building: $building, block_raw: $block_raw, block_time: $block_time)';
  }
}

/// @nodoc
abstract mixin class $EntryEntityCopyWith<$Res> {
  factory $EntryEntityCopyWith(
          EntryEntity value, $Res Function(EntryEntity) _then) =
      _$EntryEntityCopyWithImpl;
  @useResult
  $Res call(
      {String raw,
      String? subject,
      EntryType? type,
      String? room,
      String? building,
      String block_raw,
      String block_time});
}

/// @nodoc
class _$EntryEntityCopyWithImpl<$Res> implements $EntryEntityCopyWith<$Res> {
  _$EntryEntityCopyWithImpl(this._self, this._then);

  final EntryEntity _self;
  final $Res Function(EntryEntity) _then;

  /// Create a copy of EntryEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? raw = null,
    Object? subject = freezed,
    Object? type = freezed,
    Object? room = freezed,
    Object? building = freezed,
    Object? block_raw = null,
    Object? block_time = null,
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
      block_raw: null == block_raw
          ? _self.block_raw
          : block_raw // ignore: cast_nullable_to_non_nullable
              as String,
      block_time: null == block_time
          ? _self.block_time
          : block_time // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [EntryEntity].
extension EntryEntityPatterns on EntryEntity {
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
    TResult Function(_EntryEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _EntryEntity() when $default != null:
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
    TResult Function(_EntryEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EntryEntity():
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
    TResult? Function(_EntryEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EntryEntity() when $default != null:
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
    TResult Function(String raw, String? subject, EntryType? type, String? room,
            String? building, String block_raw, String block_time)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _EntryEntity() when $default != null:
        return $default(_that.raw, _that.subject, _that.type, _that.room,
            _that.building, _that.block_raw, _that.block_time);
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
    TResult Function(String raw, String? subject, EntryType? type, String? room,
            String? building, String block_raw, String block_time)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EntryEntity():
        return $default(_that.raw, _that.subject, _that.type, _that.room,
            _that.building, _that.block_raw, _that.block_time);
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
            String block_raw,
            String block_time)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EntryEntity() when $default != null:
        return $default(_that.raw, _that.subject, _that.type, _that.room,
            _that.building, _that.block_raw, _that.block_time);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _EntryEntity implements EntryEntity {
  _EntryEntity(
      {required this.raw,
      this.subject,
      this.type,
      this.room,
      this.building,
      required this.block_raw,
      required this.block_time});
  factory _EntryEntity.fromJson(Map<String, dynamic> json) =>
      _$EntryEntityFromJson(json);

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
// ignore: non_constant_identifier_names
  @override
  final String block_raw;
// ignore: non_constant_identifier_names
  @override
  final String block_time;

  /// Create a copy of EntryEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EntryEntityCopyWith<_EntryEntity> get copyWith =>
      __$EntryEntityCopyWithImpl<_EntryEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$EntryEntityToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EntryEntity &&
            (identical(other.raw, raw) || other.raw == raw) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.room, room) || other.room == room) &&
            (identical(other.building, building) ||
                other.building == building) &&
            (identical(other.block_raw, block_raw) ||
                other.block_raw == block_raw) &&
            (identical(other.block_time, block_time) ||
                other.block_time == block_time));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, raw, subject, type, room, building, block_raw, block_time);

  @override
  String toString() {
    return 'EntryEntity(raw: $raw, subject: $subject, type: $type, room: $room, building: $building, block_raw: $block_raw, block_time: $block_time)';
  }
}

/// @nodoc
abstract mixin class _$EntryEntityCopyWith<$Res>
    implements $EntryEntityCopyWith<$Res> {
  factory _$EntryEntityCopyWith(
          _EntryEntity value, $Res Function(_EntryEntity) _then) =
      __$EntryEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String raw,
      String? subject,
      EntryType? type,
      String? room,
      String? building,
      String block_raw,
      String block_time});
}

/// @nodoc
class __$EntryEntityCopyWithImpl<$Res> implements _$EntryEntityCopyWith<$Res> {
  __$EntryEntityCopyWithImpl(this._self, this._then);

  final _EntryEntity _self;
  final $Res Function(_EntryEntity) _then;

  /// Create a copy of EntryEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? raw = null,
    Object? subject = freezed,
    Object? type = freezed,
    Object? room = freezed,
    Object? building = freezed,
    Object? block_raw = null,
    Object? block_time = null,
  }) {
    return _then(_EntryEntity(
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
      block_raw: null == block_raw
          ? _self.block_raw
          : block_raw // ignore: cast_nullable_to_non_nullable
              as String,
      block_time: null == block_time
          ? _self.block_time
          : block_time // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
