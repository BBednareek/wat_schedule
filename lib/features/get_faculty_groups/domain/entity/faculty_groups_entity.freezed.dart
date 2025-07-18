// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'faculty_groups_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FacultyGroupsEntity {
  Map<String, List<String>> get groups_by_faculty;

  /// Create a copy of FacultyGroupsEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FacultyGroupsEntityCopyWith<FacultyGroupsEntity> get copyWith =>
      _$FacultyGroupsEntityCopyWithImpl<FacultyGroupsEntity>(
          this as FacultyGroupsEntity, _$identity);

  /// Serializes this FacultyGroupsEntity to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FacultyGroupsEntity &&
            const DeepCollectionEquality()
                .equals(other.groups_by_faculty, groups_by_faculty));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(groups_by_faculty));

  @override
  String toString() {
    return 'FacultyGroupsEntity(groups_by_faculty: $groups_by_faculty)';
  }
}

/// @nodoc
abstract mixin class $FacultyGroupsEntityCopyWith<$Res> {
  factory $FacultyGroupsEntityCopyWith(
          FacultyGroupsEntity value, $Res Function(FacultyGroupsEntity) _then) =
      _$FacultyGroupsEntityCopyWithImpl;
  @useResult
  $Res call({Map<String, List<String>> groups_by_faculty});
}

/// @nodoc
class _$FacultyGroupsEntityCopyWithImpl<$Res>
    implements $FacultyGroupsEntityCopyWith<$Res> {
  _$FacultyGroupsEntityCopyWithImpl(this._self, this._then);

  final FacultyGroupsEntity _self;
  final $Res Function(FacultyGroupsEntity) _then;

  /// Create a copy of FacultyGroupsEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groups_by_faculty = null,
  }) {
    return _then(_self.copyWith(
      groups_by_faculty: null == groups_by_faculty
          ? _self.groups_by_faculty
          : groups_by_faculty // ignore: cast_nullable_to_non_nullable
              as Map<String, List<String>>,
    ));
  }
}

/// Adds pattern-matching-related methods to [FacultyGroupsEntity].
extension FacultyGroupsEntityPatterns on FacultyGroupsEntity {
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
    TResult Function(_FacultyGroupsEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FacultyGroupsEntity() when $default != null:
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
    TResult Function(_FacultyGroupsEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FacultyGroupsEntity():
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
    TResult? Function(_FacultyGroupsEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FacultyGroupsEntity() when $default != null:
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
    TResult Function(Map<String, List<String>> groups_by_faculty)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FacultyGroupsEntity() when $default != null:
        return $default(_that.groups_by_faculty);
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
    TResult Function(Map<String, List<String>> groups_by_faculty) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FacultyGroupsEntity():
        return $default(_that.groups_by_faculty);
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
    TResult? Function(Map<String, List<String>> groups_by_faculty)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FacultyGroupsEntity() when $default != null:
        return $default(_that.groups_by_faculty);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _FacultyGroupsEntity implements FacultyGroupsEntity {
  _FacultyGroupsEntity(
      {required final Map<String, List<String>> groups_by_faculty})
      : _groups_by_faculty = groups_by_faculty;
  factory _FacultyGroupsEntity.fromJson(Map<String, dynamic> json) =>
      _$FacultyGroupsEntityFromJson(json);

  final Map<String, List<String>> _groups_by_faculty;
  @override
  Map<String, List<String>> get groups_by_faculty {
    if (_groups_by_faculty is EqualUnmodifiableMapView)
      return _groups_by_faculty;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_groups_by_faculty);
  }

  /// Create a copy of FacultyGroupsEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FacultyGroupsEntityCopyWith<_FacultyGroupsEntity> get copyWith =>
      __$FacultyGroupsEntityCopyWithImpl<_FacultyGroupsEntity>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FacultyGroupsEntityToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FacultyGroupsEntity &&
            const DeepCollectionEquality()
                .equals(other._groups_by_faculty, _groups_by_faculty));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_groups_by_faculty));

  @override
  String toString() {
    return 'FacultyGroupsEntity(groups_by_faculty: $groups_by_faculty)';
  }
}

/// @nodoc
abstract mixin class _$FacultyGroupsEntityCopyWith<$Res>
    implements $FacultyGroupsEntityCopyWith<$Res> {
  factory _$FacultyGroupsEntityCopyWith(_FacultyGroupsEntity value,
          $Res Function(_FacultyGroupsEntity) _then) =
      __$FacultyGroupsEntityCopyWithImpl;
  @override
  @useResult
  $Res call({Map<String, List<String>> groups_by_faculty});
}

/// @nodoc
class __$FacultyGroupsEntityCopyWithImpl<$Res>
    implements _$FacultyGroupsEntityCopyWith<$Res> {
  __$FacultyGroupsEntityCopyWithImpl(this._self, this._then);

  final _FacultyGroupsEntity _self;
  final $Res Function(_FacultyGroupsEntity) _then;

  /// Create a copy of FacultyGroupsEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? groups_by_faculty = null,
  }) {
    return _then(_FacultyGroupsEntity(
      groups_by_faculty: null == groups_by_faculty
          ? _self._groups_by_faculty
          : groups_by_faculty // ignore: cast_nullable_to_non_nullable
              as Map<String, List<String>>,
    ));
  }
}

// dart format on
