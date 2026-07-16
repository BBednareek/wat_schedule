// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'faculty_groups_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FacultyGroupsEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is FacultyGroupsEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FacultyGroupsEvent()';
  }
}

/// @nodoc
class $FacultyGroupsEventCopyWith<$Res> {
  $FacultyGroupsEventCopyWith(
      FacultyGroupsEvent _, $Res Function(FacultyGroupsEvent) __);
}

/// Adds pattern-matching-related methods to [FacultyGroupsEvent].
extension FacultyGroupsEventPatterns on FacultyGroupsEvent {
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
    TResult Function(_LoadFacultyGroups value)? load,
    TResult Function(_SelectGroup value)? selectGroup,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LoadFacultyGroups() when load != null:
        return load(_that);
      case _SelectGroup() when selectGroup != null:
        return selectGroup(_that);
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
    required TResult Function(_LoadFacultyGroups value) load,
    required TResult Function(_SelectGroup value) selectGroup,
  }) {
    final _that = this;
    switch (_that) {
      case _LoadFacultyGroups():
        return load(_that);
      case _SelectGroup():
        return selectGroup(_that);
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
    TResult? Function(_LoadFacultyGroups value)? load,
    TResult? Function(_SelectGroup value)? selectGroup,
  }) {
    final _that = this;
    switch (_that) {
      case _LoadFacultyGroups() when load != null:
        return load(_that);
      case _SelectGroup() when selectGroup != null:
        return selectGroup(_that);
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
    TResult Function(String department)? load,
    TResult Function(String groupName)? selectGroup,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LoadFacultyGroups() when load != null:
        return load(_that.department);
      case _SelectGroup() when selectGroup != null:
        return selectGroup(_that.groupName);
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
    required TResult Function(String department) load,
    required TResult Function(String groupName) selectGroup,
  }) {
    final _that = this;
    switch (_that) {
      case _LoadFacultyGroups():
        return load(_that.department);
      case _SelectGroup():
        return selectGroup(_that.groupName);
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
    TResult? Function(String department)? load,
    TResult? Function(String groupName)? selectGroup,
  }) {
    final _that = this;
    switch (_that) {
      case _LoadFacultyGroups() when load != null:
        return load(_that.department);
      case _SelectGroup() when selectGroup != null:
        return selectGroup(_that.groupName);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _LoadFacultyGroups implements FacultyGroupsEvent {
  const _LoadFacultyGroups({required this.department});

  final String department;

  /// Create a copy of FacultyGroupsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoadFacultyGroupsCopyWith<_LoadFacultyGroups> get copyWith =>
      __$LoadFacultyGroupsCopyWithImpl<_LoadFacultyGroups>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoadFacultyGroups &&
            (identical(other.department, department) ||
                other.department == department));
  }

  @override
  int get hashCode => Object.hash(runtimeType, department);

  @override
  String toString() {
    return 'FacultyGroupsEvent.load(department: $department)';
  }
}

/// @nodoc
abstract mixin class _$LoadFacultyGroupsCopyWith<$Res>
    implements $FacultyGroupsEventCopyWith<$Res> {
  factory _$LoadFacultyGroupsCopyWith(
          _LoadFacultyGroups value, $Res Function(_LoadFacultyGroups) _then) =
      __$LoadFacultyGroupsCopyWithImpl;
  @useResult
  $Res call({String department});
}

/// @nodoc
class __$LoadFacultyGroupsCopyWithImpl<$Res>
    implements _$LoadFacultyGroupsCopyWith<$Res> {
  __$LoadFacultyGroupsCopyWithImpl(this._self, this._then);

  final _LoadFacultyGroups _self;
  final $Res Function(_LoadFacultyGroups) _then;

  /// Create a copy of FacultyGroupsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? department = null,
  }) {
    return _then(_LoadFacultyGroups(
      department: null == department
          ? _self.department
          : department // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _SelectGroup implements FacultyGroupsEvent {
  const _SelectGroup({required this.groupName});

  final String groupName;

  /// Create a copy of FacultyGroupsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SelectGroupCopyWith<_SelectGroup> get copyWith =>
      __$SelectGroupCopyWithImpl<_SelectGroup>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SelectGroup &&
            (identical(other.groupName, groupName) ||
                other.groupName == groupName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, groupName);

  @override
  String toString() {
    return 'FacultyGroupsEvent.selectGroup(groupName: $groupName)';
  }
}

/// @nodoc
abstract mixin class _$SelectGroupCopyWith<$Res>
    implements $FacultyGroupsEventCopyWith<$Res> {
  factory _$SelectGroupCopyWith(
          _SelectGroup value, $Res Function(_SelectGroup) _then) =
      __$SelectGroupCopyWithImpl;
  @useResult
  $Res call({String groupName});
}

/// @nodoc
class __$SelectGroupCopyWithImpl<$Res> implements _$SelectGroupCopyWith<$Res> {
  __$SelectGroupCopyWithImpl(this._self, this._then);

  final _SelectGroup _self;
  final $Res Function(_SelectGroup) _then;

  /// Create a copy of FacultyGroupsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? groupName = null,
  }) {
    return _then(_SelectGroup(
      groupName: null == groupName
          ? _self.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$FacultyGroupsState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is FacultyGroupsState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FacultyGroupsState()';
  }
}

/// @nodoc
class $FacultyGroupsStateCopyWith<$Res> {
  $FacultyGroupsStateCopyWith(
      FacultyGroupsState _, $Res Function(FacultyGroupsState) __);
}

/// Adds pattern-matching-related methods to [FacultyGroupsState].
extension FacultyGroupsStatePatterns on FacultyGroupsState {
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
    TResult Function(FacultyGroupsLoading value)? loading,
    TResult Function(FacultyGroupsLoaded value)? loaded,
    TResult Function(FacultyGroupsError value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case FacultyGroupsLoading() when loading != null:
        return loading(_that);
      case FacultyGroupsLoaded() when loaded != null:
        return loaded(_that);
      case FacultyGroupsError() when error != null:
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
    required TResult Function(FacultyGroupsLoading value) loading,
    required TResult Function(FacultyGroupsLoaded value) loaded,
    required TResult Function(FacultyGroupsError value) error,
  }) {
    final _that = this;
    switch (_that) {
      case FacultyGroupsLoading():
        return loading(_that);
      case FacultyGroupsLoaded():
        return loaded(_that);
      case FacultyGroupsError():
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
    TResult? Function(FacultyGroupsLoading value)? loading,
    TResult? Function(FacultyGroupsLoaded value)? loaded,
    TResult? Function(FacultyGroupsError value)? error,
  }) {
    final _that = this;
    switch (_that) {
      case FacultyGroupsLoading() when loading != null:
        return loading(_that);
      case FacultyGroupsLoaded() when loaded != null:
        return loaded(_that);
      case FacultyGroupsError() when error != null:
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
    TResult Function(FacultyGroupsEntity entity, String? selectedGroupName)?
        loaded,
    TResult Function(String errorMessage)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case FacultyGroupsLoading() when loading != null:
        return loading();
      case FacultyGroupsLoaded() when loaded != null:
        return loaded(_that.entity, _that.selectedGroupName);
      case FacultyGroupsError() when error != null:
        return error(_that.errorMessage);
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
    required TResult Function(
            FacultyGroupsEntity entity, String? selectedGroupName)
        loaded,
    required TResult Function(String errorMessage) error,
  }) {
    final _that = this;
    switch (_that) {
      case FacultyGroupsLoading():
        return loading();
      case FacultyGroupsLoaded():
        return loaded(_that.entity, _that.selectedGroupName);
      case FacultyGroupsError():
        return error(_that.errorMessage);
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
    TResult? Function(FacultyGroupsEntity entity, String? selectedGroupName)?
        loaded,
    TResult? Function(String errorMessage)? error,
  }) {
    final _that = this;
    switch (_that) {
      case FacultyGroupsLoading() when loading != null:
        return loading();
      case FacultyGroupsLoaded() when loaded != null:
        return loaded(_that.entity, _that.selectedGroupName);
      case FacultyGroupsError() when error != null:
        return error(_that.errorMessage);
      case _:
        return null;
    }
  }
}

/// @nodoc

class FacultyGroupsLoading implements FacultyGroupsState {
  const FacultyGroupsLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is FacultyGroupsLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FacultyGroupsState.loading()';
  }
}

/// @nodoc

class FacultyGroupsLoaded implements FacultyGroupsState {
  const FacultyGroupsLoaded({required this.entity, this.selectedGroupName});

  final FacultyGroupsEntity entity;
  final String? selectedGroupName;

  /// Create a copy of FacultyGroupsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FacultyGroupsLoadedCopyWith<FacultyGroupsLoaded> get copyWith =>
      _$FacultyGroupsLoadedCopyWithImpl<FacultyGroupsLoaded>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FacultyGroupsLoaded &&
            (identical(other.entity, entity) || other.entity == entity) &&
            (identical(other.selectedGroupName, selectedGroupName) ||
                other.selectedGroupName == selectedGroupName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, entity, selectedGroupName);

  @override
  String toString() {
    return 'FacultyGroupsState.loaded(entity: $entity, selectedGroupName: $selectedGroupName)';
  }
}

/// @nodoc
abstract mixin class $FacultyGroupsLoadedCopyWith<$Res>
    implements $FacultyGroupsStateCopyWith<$Res> {
  factory $FacultyGroupsLoadedCopyWith(
          FacultyGroupsLoaded value, $Res Function(FacultyGroupsLoaded) _then) =
      _$FacultyGroupsLoadedCopyWithImpl;
  @useResult
  $Res call({FacultyGroupsEntity entity, String? selectedGroupName});

  $FacultyGroupsEntityCopyWith<$Res> get entity;
}

/// @nodoc
class _$FacultyGroupsLoadedCopyWithImpl<$Res>
    implements $FacultyGroupsLoadedCopyWith<$Res> {
  _$FacultyGroupsLoadedCopyWithImpl(this._self, this._then);

  final FacultyGroupsLoaded _self;
  final $Res Function(FacultyGroupsLoaded) _then;

  /// Create a copy of FacultyGroupsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? entity = null,
    Object? selectedGroupName = freezed,
  }) {
    return _then(FacultyGroupsLoaded(
      entity: null == entity
          ? _self.entity
          : entity // ignore: cast_nullable_to_non_nullable
              as FacultyGroupsEntity,
      selectedGroupName: freezed == selectedGroupName
          ? _self.selectedGroupName
          : selectedGroupName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of FacultyGroupsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FacultyGroupsEntityCopyWith<$Res> get entity {
    return $FacultyGroupsEntityCopyWith<$Res>(_self.entity, (value) {
      return _then(_self.copyWith(entity: value));
    });
  }
}

/// @nodoc

class FacultyGroupsError implements FacultyGroupsState {
  const FacultyGroupsError({required this.errorMessage});

  final String errorMessage;

  /// Create a copy of FacultyGroupsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FacultyGroupsErrorCopyWith<FacultyGroupsError> get copyWith =>
      _$FacultyGroupsErrorCopyWithImpl<FacultyGroupsError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FacultyGroupsError &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage);

  @override
  String toString() {
    return 'FacultyGroupsState.error(errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class $FacultyGroupsErrorCopyWith<$Res>
    implements $FacultyGroupsStateCopyWith<$Res> {
  factory $FacultyGroupsErrorCopyWith(
          FacultyGroupsError value, $Res Function(FacultyGroupsError) _then) =
      _$FacultyGroupsErrorCopyWithImpl;
  @useResult
  $Res call({String errorMessage});
}

/// @nodoc
class _$FacultyGroupsErrorCopyWithImpl<$Res>
    implements $FacultyGroupsErrorCopyWith<$Res> {
  _$FacultyGroupsErrorCopyWithImpl(this._self, this._then);

  final FacultyGroupsError _self;
  final $Res Function(FacultyGroupsError) _then;

  /// Create a copy of FacultyGroupsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? errorMessage = null,
  }) {
    return _then(FacultyGroupsError(
      errorMessage: null == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
