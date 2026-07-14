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
  List<String> get groups_by_department;

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
                .equals(other.groups_by_department, groups_by_department));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(groups_by_department));

  @override
  String toString() {
    return 'FacultyGroupsEntity(groups_by_department: $groups_by_department)';
  }
}

/// @nodoc
abstract mixin class $FacultyGroupsEntityCopyWith<$Res> {
  factory $FacultyGroupsEntityCopyWith(
          FacultyGroupsEntity value, $Res Function(FacultyGroupsEntity) _then) =
      _$FacultyGroupsEntityCopyWithImpl;
  @useResult
  $Res call({List<String> groups_by_department});
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
    Object? groups_by_department = null,
  }) {
    return _then(_self.copyWith(
      groups_by_department: null == groups_by_department
          ? _self.groups_by_department
          : groups_by_department // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
    TResult Function(List<String> groups_by_department)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FacultyGroupsEntity() when $default != null:
        return $default(_that.groups_by_department);
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
    TResult Function(List<String> groups_by_department) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FacultyGroupsEntity():
        return $default(_that.groups_by_department);
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
    TResult? Function(List<String> groups_by_department)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FacultyGroupsEntity() when $default != null:
        return $default(_that.groups_by_department);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _FacultyGroupsEntity implements FacultyGroupsEntity {
  _FacultyGroupsEntity({required final List<String> groups_by_department})
      : _groups_by_department = groups_by_department;
  factory _FacultyGroupsEntity.fromJson(Map<String, dynamic> json) =>
      _$FacultyGroupsEntityFromJson(json);

  final List<String> _groups_by_department;
  @override
  List<String> get groups_by_department {
    if (_groups_by_department is EqualUnmodifiableListView)
      return _groups_by_department;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_groups_by_department);
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
                .equals(other._groups_by_department, _groups_by_department));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_groups_by_department));

  @override
  String toString() {
    return 'FacultyGroupsEntity(groups_by_department: $groups_by_department)';
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
  $Res call({List<String> groups_by_department});
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
    Object? groups_by_department = null,
  }) {
    return _then(_FacultyGroupsEntity(
      groups_by_department: null == groups_by_department
          ? _self._groups_by_department
          : groups_by_department // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

// dart format on
