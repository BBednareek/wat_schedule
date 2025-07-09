// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'faculty_groups_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FacultyGroupsEntity _$FacultyGroupsEntityFromJson(Map<String, dynamic> json) {
  return _FacultyGroupsEntity.fromJson(json);
}

/// @nodoc
mixin _$FacultyGroupsEntity {
  String get group => throw _privateConstructorUsedError;

  /// Serializes this FacultyGroupsEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FacultyGroupsEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FacultyGroupsEntityCopyWith<FacultyGroupsEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FacultyGroupsEntityCopyWith<$Res> {
  factory $FacultyGroupsEntityCopyWith(
          FacultyGroupsEntity value, $Res Function(FacultyGroupsEntity) then) =
      _$FacultyGroupsEntityCopyWithImpl<$Res, FacultyGroupsEntity>;
  @useResult
  $Res call({String group});
}

/// @nodoc
class _$FacultyGroupsEntityCopyWithImpl<$Res, $Val extends FacultyGroupsEntity>
    implements $FacultyGroupsEntityCopyWith<$Res> {
  _$FacultyGroupsEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FacultyGroupsEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? group = null,
  }) {
    return _then(_value.copyWith(
      group: null == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FacultyGroupsEntityImplCopyWith<$Res>
    implements $FacultyGroupsEntityCopyWith<$Res> {
  factory _$$FacultyGroupsEntityImplCopyWith(_$FacultyGroupsEntityImpl value,
          $Res Function(_$FacultyGroupsEntityImpl) then) =
      __$$FacultyGroupsEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String group});
}

/// @nodoc
class __$$FacultyGroupsEntityImplCopyWithImpl<$Res>
    extends _$FacultyGroupsEntityCopyWithImpl<$Res, _$FacultyGroupsEntityImpl>
    implements _$$FacultyGroupsEntityImplCopyWith<$Res> {
  __$$FacultyGroupsEntityImplCopyWithImpl(_$FacultyGroupsEntityImpl _value,
      $Res Function(_$FacultyGroupsEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of FacultyGroupsEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? group = null,
  }) {
    return _then(_$FacultyGroupsEntityImpl(
      group: null == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FacultyGroupsEntityImpl implements _FacultyGroupsEntity {
  _$FacultyGroupsEntityImpl({required this.group});

  factory _$FacultyGroupsEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$FacultyGroupsEntityImplFromJson(json);

  @override
  final String group;

  @override
  String toString() {
    return 'FacultyGroupsEntity(group: $group)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FacultyGroupsEntityImpl &&
            (identical(other.group, group) || other.group == group));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, group);

  /// Create a copy of FacultyGroupsEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FacultyGroupsEntityImplCopyWith<_$FacultyGroupsEntityImpl> get copyWith =>
      __$$FacultyGroupsEntityImplCopyWithImpl<_$FacultyGroupsEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FacultyGroupsEntityImplToJson(
      this,
    );
  }
}

abstract class _FacultyGroupsEntity implements FacultyGroupsEntity {
  factory _FacultyGroupsEntity({required final String group}) =
      _$FacultyGroupsEntityImpl;

  factory _FacultyGroupsEntity.fromJson(Map<String, dynamic> json) =
      _$FacultyGroupsEntityImpl.fromJson;

  @override
  String get group;

  /// Create a copy of FacultyGroupsEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FacultyGroupsEntityImplCopyWith<_$FacultyGroupsEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
