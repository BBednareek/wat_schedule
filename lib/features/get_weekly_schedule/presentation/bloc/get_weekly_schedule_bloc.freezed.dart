// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_weekly_schedule_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GetWeeklyScheduleEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is GetWeeklyScheduleEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'GetWeeklyScheduleEvent()';
  }
}

/// @nodoc
class $GetWeeklyScheduleEventCopyWith<$Res> {
  $GetWeeklyScheduleEventCopyWith(
      GetWeeklyScheduleEvent _, $Res Function(GetWeeklyScheduleEvent) __);
}

/// Adds pattern-matching-related methods to [GetWeeklyScheduleEvent].
extension GetWeeklyScheduleEventPatterns on GetWeeklyScheduleEvent {
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
    TResult Function(GetSchedules value)? getSchedules,
    TResult Function(AnotherWeeklySchedule value)? anotherWeeklySchedule,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case GetSchedules() when getSchedules != null:
        return getSchedules(_that);
      case AnotherWeeklySchedule() when anotherWeeklySchedule != null:
        return anotherWeeklySchedule(_that);
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
    required TResult Function(GetSchedules value) getSchedules,
    required TResult Function(AnotherWeeklySchedule value)
        anotherWeeklySchedule,
  }) {
    final _that = this;
    switch (_that) {
      case GetSchedules():
        return getSchedules(_that);
      case AnotherWeeklySchedule():
        return anotherWeeklySchedule(_that);
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
    TResult? Function(GetSchedules value)? getSchedules,
    TResult? Function(AnotherWeeklySchedule value)? anotherWeeklySchedule,
  }) {
    final _that = this;
    switch (_that) {
      case GetSchedules() when getSchedules != null:
        return getSchedules(_that);
      case AnotherWeeklySchedule() when anotherWeeklySchedule != null:
        return anotherWeeklySchedule(_that);
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
    TResult Function(String group)? getSchedules,
    TResult Function(bool isForward)? anotherWeeklySchedule,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case GetSchedules() when getSchedules != null:
        return getSchedules(_that.group);
      case AnotherWeeklySchedule() when anotherWeeklySchedule != null:
        return anotherWeeklySchedule(_that.isForward);
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
    required TResult Function(String group) getSchedules,
    required TResult Function(bool isForward) anotherWeeklySchedule,
  }) {
    final _that = this;
    switch (_that) {
      case GetSchedules():
        return getSchedules(_that.group);
      case AnotherWeeklySchedule():
        return anotherWeeklySchedule(_that.isForward);
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
    TResult? Function(String group)? getSchedules,
    TResult? Function(bool isForward)? anotherWeeklySchedule,
  }) {
    final _that = this;
    switch (_that) {
      case GetSchedules() when getSchedules != null:
        return getSchedules(_that.group);
      case AnotherWeeklySchedule() when anotherWeeklySchedule != null:
        return anotherWeeklySchedule(_that.isForward);
      case _:
        return null;
    }
  }
}

/// @nodoc

class GetSchedules implements GetWeeklyScheduleEvent {
  const GetSchedules({required this.group});

  final String group;

  /// Create a copy of GetWeeklyScheduleEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetSchedulesCopyWith<GetSchedules> get copyWith =>
      _$GetSchedulesCopyWithImpl<GetSchedules>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetSchedules &&
            (identical(other.group, group) || other.group == group));
  }

  @override
  int get hashCode => Object.hash(runtimeType, group);

  @override
  String toString() {
    return 'GetWeeklyScheduleEvent.getSchedules(group: $group)';
  }
}

/// @nodoc
abstract mixin class $GetSchedulesCopyWith<$Res>
    implements $GetWeeklyScheduleEventCopyWith<$Res> {
  factory $GetSchedulesCopyWith(
          GetSchedules value, $Res Function(GetSchedules) _then) =
      _$GetSchedulesCopyWithImpl;
  @useResult
  $Res call({String group});
}

/// @nodoc
class _$GetSchedulesCopyWithImpl<$Res> implements $GetSchedulesCopyWith<$Res> {
  _$GetSchedulesCopyWithImpl(this._self, this._then);

  final GetSchedules _self;
  final $Res Function(GetSchedules) _then;

  /// Create a copy of GetWeeklyScheduleEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? group = null,
  }) {
    return _then(GetSchedules(
      group: null == group
          ? _self.group
          : group // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class AnotherWeeklySchedule implements GetWeeklyScheduleEvent {
  const AnotherWeeklySchedule({required this.isForward});

  final bool isForward;

  /// Create a copy of GetWeeklyScheduleEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AnotherWeeklyScheduleCopyWith<AnotherWeeklySchedule> get copyWith =>
      _$AnotherWeeklyScheduleCopyWithImpl<AnotherWeeklySchedule>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AnotherWeeklySchedule &&
            (identical(other.isForward, isForward) ||
                other.isForward == isForward));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isForward);

  @override
  String toString() {
    return 'GetWeeklyScheduleEvent.anotherWeeklySchedule(isForward: $isForward)';
  }
}

/// @nodoc
abstract mixin class $AnotherWeeklyScheduleCopyWith<$Res>
    implements $GetWeeklyScheduleEventCopyWith<$Res> {
  factory $AnotherWeeklyScheduleCopyWith(AnotherWeeklySchedule value,
          $Res Function(AnotherWeeklySchedule) _then) =
      _$AnotherWeeklyScheduleCopyWithImpl;
  @useResult
  $Res call({bool isForward});
}

/// @nodoc
class _$AnotherWeeklyScheduleCopyWithImpl<$Res>
    implements $AnotherWeeklyScheduleCopyWith<$Res> {
  _$AnotherWeeklyScheduleCopyWithImpl(this._self, this._then);

  final AnotherWeeklySchedule _self;
  final $Res Function(AnotherWeeklySchedule) _then;

  /// Create a copy of GetWeeklyScheduleEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isForward = null,
  }) {
    return _then(AnotherWeeklySchedule(
      isForward: null == isForward
          ? _self.isForward
          : isForward // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$GetWeeklyScheduleState {
  bool get isLoading;
  ScheduleEntity? get schedules;
  String get groupName;
  String? get message;
  DateTime? get currentDate;

  /// Create a copy of GetWeeklyScheduleState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetWeeklyScheduleStateCopyWith<GetWeeklyScheduleState> get copyWith =>
      _$GetWeeklyScheduleStateCopyWithImpl<GetWeeklyScheduleState>(
          this as GetWeeklyScheduleState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetWeeklyScheduleState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.schedules, schedules) ||
                other.schedules == schedules) &&
            (identical(other.groupName, groupName) ||
                other.groupName == groupName) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.currentDate, currentDate) ||
                other.currentDate == currentDate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isLoading, schedules, groupName, message, currentDate);

  @override
  String toString() {
    return 'GetWeeklyScheduleState(isLoading: $isLoading, schedules: $schedules, groupName: $groupName, message: $message, currentDate: $currentDate)';
  }
}

/// @nodoc
abstract mixin class $GetWeeklyScheduleStateCopyWith<$Res> {
  factory $GetWeeklyScheduleStateCopyWith(GetWeeklyScheduleState value,
          $Res Function(GetWeeklyScheduleState) _then) =
      _$GetWeeklyScheduleStateCopyWithImpl;
  @useResult
  $Res call(
      {bool isLoading,
      ScheduleEntity? schedules,
      String groupName,
      String? message,
      DateTime? currentDate});

  $ScheduleEntityCopyWith<$Res>? get schedules;
}

/// @nodoc
class _$GetWeeklyScheduleStateCopyWithImpl<$Res>
    implements $GetWeeklyScheduleStateCopyWith<$Res> {
  _$GetWeeklyScheduleStateCopyWithImpl(this._self, this._then);

  final GetWeeklyScheduleState _self;
  final $Res Function(GetWeeklyScheduleState) _then;

  /// Create a copy of GetWeeklyScheduleState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? schedules = freezed,
    Object? groupName = null,
    Object? message = freezed,
    Object? currentDate = freezed,
  }) {
    return _then(_self.copyWith(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      schedules: freezed == schedules
          ? _self.schedules
          : schedules // ignore: cast_nullable_to_non_nullable
              as ScheduleEntity?,
      groupName: null == groupName
          ? _self.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      currentDate: freezed == currentDate
          ? _self.currentDate
          : currentDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  /// Create a copy of GetWeeklyScheduleState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ScheduleEntityCopyWith<$Res>? get schedules {
    if (_self.schedules == null) {
      return null;
    }

    return $ScheduleEntityCopyWith<$Res>(_self.schedules!, (value) {
      return _then(_self.copyWith(schedules: value));
    });
  }
}

/// Adds pattern-matching-related methods to [GetWeeklyScheduleState].
extension GetWeeklyScheduleStatePatterns on GetWeeklyScheduleState {
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
    TResult Function(_GetWeeklyScheduleState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GetWeeklyScheduleState() when $default != null:
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
    TResult Function(_GetWeeklyScheduleState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GetWeeklyScheduleState():
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
    TResult? Function(_GetWeeklyScheduleState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GetWeeklyScheduleState() when $default != null:
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
    TResult Function(bool isLoading, ScheduleEntity? schedules,
            String groupName, String? message, DateTime? currentDate)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GetWeeklyScheduleState() when $default != null:
        return $default(_that.isLoading, _that.schedules, _that.groupName,
            _that.message, _that.currentDate);
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
    TResult Function(bool isLoading, ScheduleEntity? schedules,
            String groupName, String? message, DateTime? currentDate)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GetWeeklyScheduleState():
        return $default(_that.isLoading, _that.schedules, _that.groupName,
            _that.message, _that.currentDate);
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
    TResult? Function(bool isLoading, ScheduleEntity? schedules,
            String groupName, String? message, DateTime? currentDate)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GetWeeklyScheduleState() when $default != null:
        return $default(_that.isLoading, _that.schedules, _that.groupName,
            _that.message, _that.currentDate);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _GetWeeklyScheduleState implements GetWeeklyScheduleState {
  const _GetWeeklyScheduleState(
      {this.isLoading = false,
      this.schedules = null,
      this.groupName = '',
      this.message = null,
      this.currentDate = null});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final ScheduleEntity? schedules;
  @override
  @JsonKey()
  final String groupName;
  @override
  @JsonKey()
  final String? message;
  @override
  @JsonKey()
  final DateTime? currentDate;

  /// Create a copy of GetWeeklyScheduleState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GetWeeklyScheduleStateCopyWith<_GetWeeklyScheduleState> get copyWith =>
      __$GetWeeklyScheduleStateCopyWithImpl<_GetWeeklyScheduleState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GetWeeklyScheduleState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.schedules, schedules) ||
                other.schedules == schedules) &&
            (identical(other.groupName, groupName) ||
                other.groupName == groupName) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.currentDate, currentDate) ||
                other.currentDate == currentDate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isLoading, schedules, groupName, message, currentDate);

  @override
  String toString() {
    return 'GetWeeklyScheduleState(isLoading: $isLoading, schedules: $schedules, groupName: $groupName, message: $message, currentDate: $currentDate)';
  }
}

/// @nodoc
abstract mixin class _$GetWeeklyScheduleStateCopyWith<$Res>
    implements $GetWeeklyScheduleStateCopyWith<$Res> {
  factory _$GetWeeklyScheduleStateCopyWith(_GetWeeklyScheduleState value,
          $Res Function(_GetWeeklyScheduleState) _then) =
      __$GetWeeklyScheduleStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      ScheduleEntity? schedules,
      String groupName,
      String? message,
      DateTime? currentDate});

  @override
  $ScheduleEntityCopyWith<$Res>? get schedules;
}

/// @nodoc
class __$GetWeeklyScheduleStateCopyWithImpl<$Res>
    implements _$GetWeeklyScheduleStateCopyWith<$Res> {
  __$GetWeeklyScheduleStateCopyWithImpl(this._self, this._then);

  final _GetWeeklyScheduleState _self;
  final $Res Function(_GetWeeklyScheduleState) _then;

  /// Create a copy of GetWeeklyScheduleState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isLoading = null,
    Object? schedules = freezed,
    Object? groupName = null,
    Object? message = freezed,
    Object? currentDate = freezed,
  }) {
    return _then(_GetWeeklyScheduleState(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      schedules: freezed == schedules
          ? _self.schedules
          : schedules // ignore: cast_nullable_to_non_nullable
              as ScheduleEntity?,
      groupName: null == groupName
          ? _self.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      currentDate: freezed == currentDate
          ? _self.currentDate
          : currentDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  /// Create a copy of GetWeeklyScheduleState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ScheduleEntityCopyWith<$Res>? get schedules {
    if (_self.schedules == null) {
      return null;
    }

    return $ScheduleEntityCopyWith<$Res>(_self.schedules!, (value) {
      return _then(_self.copyWith(schedules: value));
    });
  }
}

// dart format on
