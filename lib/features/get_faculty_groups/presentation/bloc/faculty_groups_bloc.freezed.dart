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
    TResult Function(_GetFacultyGroups value)? getFacultyGroups,
    TResult Function(_SelectGroup value)? selectGroup,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GetFacultyGroups() when getFacultyGroups != null:
        return getFacultyGroups(_that);
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
    required TResult Function(_GetFacultyGroups value) getFacultyGroups,
    required TResult Function(_SelectGroup value) selectGroup,
  }) {
    final _that = this;
    switch (_that) {
      case _GetFacultyGroups():
        return getFacultyGroups(_that);
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
    TResult? Function(_GetFacultyGroups value)? getFacultyGroups,
    TResult? Function(_SelectGroup value)? selectGroup,
  }) {
    final _that = this;
    switch (_that) {
      case _GetFacultyGroups() when getFacultyGroups != null:
        return getFacultyGroups(_that);
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
    TResult Function()? getFacultyGroups,
    TResult Function(String groupName)? selectGroup,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GetFacultyGroups() when getFacultyGroups != null:
        return getFacultyGroups();
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
    required TResult Function() getFacultyGroups,
    required TResult Function(String groupName) selectGroup,
  }) {
    final _that = this;
    switch (_that) {
      case _GetFacultyGroups():
        return getFacultyGroups();
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
    TResult? Function()? getFacultyGroups,
    TResult? Function(String groupName)? selectGroup,
  }) {
    final _that = this;
    switch (_that) {
      case _GetFacultyGroups() when getFacultyGroups != null:
        return getFacultyGroups();
      case _SelectGroup() when selectGroup != null:
        return selectGroup(_that.groupName);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _GetFacultyGroups implements FacultyGroupsEvent {
  const _GetFacultyGroups();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _GetFacultyGroups);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FacultyGroupsEvent.getFacultyGroups()';
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
    TResult Function(LoadingGroups value)? loading,
    TResult Function(LoadedGroups value)? loaded,
    TResult Function(ErrorGroups value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case LoadingGroups() when loading != null:
        return loading(_that);
      case LoadedGroups() when loaded != null:
        return loaded(_that);
      case ErrorGroups() when error != null:
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
    required TResult Function(LoadingGroups value) loading,
    required TResult Function(LoadedGroups value) loaded,
    required TResult Function(ErrorGroups value) error,
  }) {
    final _that = this;
    switch (_that) {
      case LoadingGroups():
        return loading(_that);
      case LoadedGroups():
        return loaded(_that);
      case ErrorGroups():
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
    TResult? Function(LoadingGroups value)? loading,
    TResult? Function(LoadedGroups value)? loaded,
    TResult? Function(ErrorGroups value)? error,
  }) {
    final _that = this;
    switch (_that) {
      case LoadingGroups() when loading != null:
        return loading(_that);
      case LoadedGroups() when loaded != null:
        return loaded(_that);
      case ErrorGroups() when error != null:
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
    TResult Function(FacultyGroupsEntity entity, String? selectedGroupNam)?
        loaded,
    TResult Function(String errorMessage)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case LoadingGroups() when loading != null:
        return loading();
      case LoadedGroups() when loaded != null:
        return loaded(_that.entity, _that.selectedGroupNam);
      case ErrorGroups() when error != null:
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
            FacultyGroupsEntity entity, String? selectedGroupNam)
        loaded,
    required TResult Function(String errorMessage) error,
  }) {
    final _that = this;
    switch (_that) {
      case LoadingGroups():
        return loading();
      case LoadedGroups():
        return loaded(_that.entity, _that.selectedGroupNam);
      case ErrorGroups():
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
    TResult? Function(FacultyGroupsEntity entity, String? selectedGroupNam)?
        loaded,
    TResult? Function(String errorMessage)? error,
  }) {
    final _that = this;
    switch (_that) {
      case LoadingGroups() when loading != null:
        return loading();
      case LoadedGroups() when loaded != null:
        return loaded(_that.entity, _that.selectedGroupNam);
      case ErrorGroups() when error != null:
        return error(_that.errorMessage);
      case _:
        return null;
    }
  }
}

/// @nodoc

class LoadingGroups implements FacultyGroupsState {
  const LoadingGroups();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoadingGroups);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FacultyGroupsState.loading()';
  }
}

/// @nodoc

class LoadedGroups implements FacultyGroupsState {
  const LoadedGroups({required this.entity, this.selectedGroupNam});

  final FacultyGroupsEntity entity;
  final String? selectedGroupNam;

  /// Create a copy of FacultyGroupsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoadedGroupsCopyWith<LoadedGroups> get copyWith =>
      _$LoadedGroupsCopyWithImpl<LoadedGroups>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoadedGroups &&
            (identical(other.entity, entity) || other.entity == entity) &&
            (identical(other.selectedGroupNam, selectedGroupNam) ||
                other.selectedGroupNam == selectedGroupNam));
  }

  @override
  int get hashCode => Object.hash(runtimeType, entity, selectedGroupNam);

  @override
  String toString() {
    return 'FacultyGroupsState.loaded(entity: $entity, selectedGroupNam: $selectedGroupNam)';
  }
}

/// @nodoc
abstract mixin class $LoadedGroupsCopyWith<$Res>
    implements $FacultyGroupsStateCopyWith<$Res> {
  factory $LoadedGroupsCopyWith(
          LoadedGroups value, $Res Function(LoadedGroups) _then) =
      _$LoadedGroupsCopyWithImpl;
  @useResult
  $Res call({FacultyGroupsEntity entity, String? selectedGroupNam});

  $FacultyGroupsEntityCopyWith<$Res> get entity;
}

/// @nodoc
class _$LoadedGroupsCopyWithImpl<$Res> implements $LoadedGroupsCopyWith<$Res> {
  _$LoadedGroupsCopyWithImpl(this._self, this._then);

  final LoadedGroups _self;
  final $Res Function(LoadedGroups) _then;

  /// Create a copy of FacultyGroupsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? entity = null,
    Object? selectedGroupNam = freezed,
  }) {
    return _then(LoadedGroups(
      entity: null == entity
          ? _self.entity
          : entity // ignore: cast_nullable_to_non_nullable
              as FacultyGroupsEntity,
      selectedGroupNam: freezed == selectedGroupNam
          ? _self.selectedGroupNam
          : selectedGroupNam // ignore: cast_nullable_to_non_nullable
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

class ErrorGroups implements FacultyGroupsState {
  const ErrorGroups({required this.errorMessage});

  final String errorMessage;

  /// Create a copy of FacultyGroupsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ErrorGroupsCopyWith<ErrorGroups> get copyWith =>
      _$ErrorGroupsCopyWithImpl<ErrorGroups>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ErrorGroups &&
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
abstract mixin class $ErrorGroupsCopyWith<$Res>
    implements $FacultyGroupsStateCopyWith<$Res> {
  factory $ErrorGroupsCopyWith(
          ErrorGroups value, $Res Function(ErrorGroups) _then) =
      _$ErrorGroupsCopyWithImpl;
  @useResult
  $Res call({String errorMessage});
}

/// @nodoc
class _$ErrorGroupsCopyWithImpl<$Res> implements $ErrorGroupsCopyWith<$Res> {
  _$ErrorGroupsCopyWithImpl(this._self, this._then);

  final ErrorGroups _self;
  final $Res Function(ErrorGroups) _then;

  /// Create a copy of FacultyGroupsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? errorMessage = null,
  }) {
    return _then(ErrorGroups(
      errorMessage: null == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
