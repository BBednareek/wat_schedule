// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weekly_schedule_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WeeklyScheduleEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is WeeklyScheduleEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'WeeklyScheduleEvent()';
  }
}

/// @nodoc
class $WeeklyScheduleEventCopyWith<$Res> {
  $WeeklyScheduleEventCopyWith(
      WeeklyScheduleEvent _, $Res Function(WeeklyScheduleEvent) __);
}

/// Adds pattern-matching-related methods to [WeeklyScheduleEvent].
extension WeeklyScheduleEventPatterns on WeeklyScheduleEvent {
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
    TResult Function(LoadWeeklySchedule value)? load,
    TResult Function(ChangeScheduleWeek value)? changeWeek,
    TResult Function(ResetWeeklySchedule value)? reset,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case LoadWeeklySchedule() when load != null:
        return load(_that);
      case ChangeScheduleWeek() when changeWeek != null:
        return changeWeek(_that);
      case ResetWeeklySchedule() when reset != null:
        return reset(_that);
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
    required TResult Function(LoadWeeklySchedule value) load,
    required TResult Function(ChangeScheduleWeek value) changeWeek,
    required TResult Function(ResetWeeklySchedule value) reset,
  }) {
    final _that = this;
    switch (_that) {
      case LoadWeeklySchedule():
        return load(_that);
      case ChangeScheduleWeek():
        return changeWeek(_that);
      case ResetWeeklySchedule():
        return reset(_that);
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
    TResult? Function(LoadWeeklySchedule value)? load,
    TResult? Function(ChangeScheduleWeek value)? changeWeek,
    TResult? Function(ResetWeeklySchedule value)? reset,
  }) {
    final _that = this;
    switch (_that) {
      case LoadWeeklySchedule() when load != null:
        return load(_that);
      case ChangeScheduleWeek() when changeWeek != null:
        return changeWeek(_that);
      case ResetWeeklySchedule() when reset != null:
        return reset(_that);
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
    TResult Function(String group)? load,
    TResult Function(bool forward)? changeWeek,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case LoadWeeklySchedule() when load != null:
        return load(_that.group);
      case ChangeScheduleWeek() when changeWeek != null:
        return changeWeek(_that.forward);
      case ResetWeeklySchedule() when reset != null:
        return reset();
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
    required TResult Function(String group) load,
    required TResult Function(bool forward) changeWeek,
    required TResult Function() reset,
  }) {
    final _that = this;
    switch (_that) {
      case LoadWeeklySchedule():
        return load(_that.group);
      case ChangeScheduleWeek():
        return changeWeek(_that.forward);
      case ResetWeeklySchedule():
        return reset();
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
    TResult? Function(String group)? load,
    TResult? Function(bool forward)? changeWeek,
    TResult? Function()? reset,
  }) {
    final _that = this;
    switch (_that) {
      case LoadWeeklySchedule() when load != null:
        return load(_that.group);
      case ChangeScheduleWeek() when changeWeek != null:
        return changeWeek(_that.forward);
      case ResetWeeklySchedule() when reset != null:
        return reset();
      case _:
        return null;
    }
  }
}

/// @nodoc

class LoadWeeklySchedule implements WeeklyScheduleEvent {
  const LoadWeeklySchedule({required this.group});

  final String group;

  /// Create a copy of WeeklyScheduleEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoadWeeklyScheduleCopyWith<LoadWeeklySchedule> get copyWith =>
      _$LoadWeeklyScheduleCopyWithImpl<LoadWeeklySchedule>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoadWeeklySchedule &&
            (identical(other.group, group) || other.group == group));
  }

  @override
  int get hashCode => Object.hash(runtimeType, group);

  @override
  String toString() {
    return 'WeeklyScheduleEvent.load(group: $group)';
  }
}

/// @nodoc
abstract mixin class $LoadWeeklyScheduleCopyWith<$Res>
    implements $WeeklyScheduleEventCopyWith<$Res> {
  factory $LoadWeeklyScheduleCopyWith(
          LoadWeeklySchedule value, $Res Function(LoadWeeklySchedule) _then) =
      _$LoadWeeklyScheduleCopyWithImpl;
  @useResult
  $Res call({String group});
}

/// @nodoc
class _$LoadWeeklyScheduleCopyWithImpl<$Res>
    implements $LoadWeeklyScheduleCopyWith<$Res> {
  _$LoadWeeklyScheduleCopyWithImpl(this._self, this._then);

  final LoadWeeklySchedule _self;
  final $Res Function(LoadWeeklySchedule) _then;

  /// Create a copy of WeeklyScheduleEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? group = null,
  }) {
    return _then(LoadWeeklySchedule(
      group: null == group
          ? _self.group
          : group // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class ChangeScheduleWeek implements WeeklyScheduleEvent {
  const ChangeScheduleWeek({required this.forward});

  final bool forward;

  /// Create a copy of WeeklyScheduleEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChangeScheduleWeekCopyWith<ChangeScheduleWeek> get copyWith =>
      _$ChangeScheduleWeekCopyWithImpl<ChangeScheduleWeek>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChangeScheduleWeek &&
            (identical(other.forward, forward) || other.forward == forward));
  }

  @override
  int get hashCode => Object.hash(runtimeType, forward);

  @override
  String toString() {
    return 'WeeklyScheduleEvent.changeWeek(forward: $forward)';
  }
}

/// @nodoc
abstract mixin class $ChangeScheduleWeekCopyWith<$Res>
    implements $WeeklyScheduleEventCopyWith<$Res> {
  factory $ChangeScheduleWeekCopyWith(
          ChangeScheduleWeek value, $Res Function(ChangeScheduleWeek) _then) =
      _$ChangeScheduleWeekCopyWithImpl;
  @useResult
  $Res call({bool forward});
}

/// @nodoc
class _$ChangeScheduleWeekCopyWithImpl<$Res>
    implements $ChangeScheduleWeekCopyWith<$Res> {
  _$ChangeScheduleWeekCopyWithImpl(this._self, this._then);

  final ChangeScheduleWeek _self;
  final $Res Function(ChangeScheduleWeek) _then;

  /// Create a copy of WeeklyScheduleEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? forward = null,
  }) {
    return _then(ChangeScheduleWeek(
      forward: null == forward
          ? _self.forward
          : forward // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class ResetWeeklySchedule implements WeeklyScheduleEvent {
  const ResetWeeklySchedule();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ResetWeeklySchedule);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'WeeklyScheduleEvent.reset()';
  }
}

/// @nodoc
mixin _$WeeklyScheduleState {
  bool get isLoading;
  WeeklyScheduleEntity? get schedule;
  String get groupName;
  String? get errorMessage;
  DateTime? get currentDate;

  /// Create a copy of WeeklyScheduleState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WeeklyScheduleStateCopyWith<WeeklyScheduleState> get copyWith =>
      _$WeeklyScheduleStateCopyWithImpl<WeeklyScheduleState>(
          this as WeeklyScheduleState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WeeklyScheduleState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.schedule, schedule) ||
                other.schedule == schedule) &&
            (identical(other.groupName, groupName) ||
                other.groupName == groupName) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.currentDate, currentDate) ||
                other.currentDate == currentDate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isLoading, schedule, groupName, errorMessage, currentDate);

  @override
  String toString() {
    return 'WeeklyScheduleState(isLoading: $isLoading, schedule: $schedule, groupName: $groupName, errorMessage: $errorMessage, currentDate: $currentDate)';
  }
}

/// @nodoc
abstract mixin class $WeeklyScheduleStateCopyWith<$Res> {
  factory $WeeklyScheduleStateCopyWith(
          WeeklyScheduleState value, $Res Function(WeeklyScheduleState) _then) =
      _$WeeklyScheduleStateCopyWithImpl;
  @useResult
  $Res call(
      {bool isLoading,
      WeeklyScheduleEntity? schedule,
      String groupName,
      String? errorMessage,
      DateTime? currentDate});

  $WeeklyScheduleEntityCopyWith<$Res>? get schedule;
}

/// @nodoc
class _$WeeklyScheduleStateCopyWithImpl<$Res>
    implements $WeeklyScheduleStateCopyWith<$Res> {
  _$WeeklyScheduleStateCopyWithImpl(this._self, this._then);

  final WeeklyScheduleState _self;
  final $Res Function(WeeklyScheduleState) _then;

  /// Create a copy of WeeklyScheduleState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? schedule = freezed,
    Object? groupName = null,
    Object? errorMessage = freezed,
    Object? currentDate = freezed,
  }) {
    return _then(_self.copyWith(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      schedule: freezed == schedule
          ? _self.schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as WeeklyScheduleEntity?,
      groupName: null == groupName
          ? _self.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      currentDate: freezed == currentDate
          ? _self.currentDate
          : currentDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  /// Create a copy of WeeklyScheduleState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WeeklyScheduleEntityCopyWith<$Res>? get schedule {
    if (_self.schedule == null) {
      return null;
    }

    return $WeeklyScheduleEntityCopyWith<$Res>(_self.schedule!, (value) {
      return _then(_self.copyWith(schedule: value));
    });
  }
}

/// Adds pattern-matching-related methods to [WeeklyScheduleState].
extension WeeklyScheduleStatePatterns on WeeklyScheduleState {
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
    TResult Function(_WeeklyScheduleState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WeeklyScheduleState() when $default != null:
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
    TResult Function(_WeeklyScheduleState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WeeklyScheduleState():
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
    TResult? Function(_WeeklyScheduleState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WeeklyScheduleState() when $default != null:
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
    TResult Function(bool isLoading, WeeklyScheduleEntity? schedule,
            String groupName, String? errorMessage, DateTime? currentDate)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WeeklyScheduleState() when $default != null:
        return $default(_that.isLoading, _that.schedule, _that.groupName,
            _that.errorMessage, _that.currentDate);
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
    TResult Function(bool isLoading, WeeklyScheduleEntity? schedule,
            String groupName, String? errorMessage, DateTime? currentDate)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WeeklyScheduleState():
        return $default(_that.isLoading, _that.schedule, _that.groupName,
            _that.errorMessage, _that.currentDate);
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
    TResult? Function(bool isLoading, WeeklyScheduleEntity? schedule,
            String groupName, String? errorMessage, DateTime? currentDate)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WeeklyScheduleState() when $default != null:
        return $default(_that.isLoading, _that.schedule, _that.groupName,
            _that.errorMessage, _that.currentDate);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _WeeklyScheduleState implements WeeklyScheduleState {
  const _WeeklyScheduleState(
      {this.isLoading = false,
      this.schedule = null,
      this.groupName = '',
      this.errorMessage = null,
      this.currentDate = null});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final WeeklyScheduleEntity? schedule;
  @override
  @JsonKey()
  final String groupName;
  @override
  @JsonKey()
  final String? errorMessage;
  @override
  @JsonKey()
  final DateTime? currentDate;

  /// Create a copy of WeeklyScheduleState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WeeklyScheduleStateCopyWith<_WeeklyScheduleState> get copyWith =>
      __$WeeklyScheduleStateCopyWithImpl<_WeeklyScheduleState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WeeklyScheduleState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.schedule, schedule) ||
                other.schedule == schedule) &&
            (identical(other.groupName, groupName) ||
                other.groupName == groupName) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.currentDate, currentDate) ||
                other.currentDate == currentDate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isLoading, schedule, groupName, errorMessage, currentDate);

  @override
  String toString() {
    return 'WeeklyScheduleState(isLoading: $isLoading, schedule: $schedule, groupName: $groupName, errorMessage: $errorMessage, currentDate: $currentDate)';
  }
}

/// @nodoc
abstract mixin class _$WeeklyScheduleStateCopyWith<$Res>
    implements $WeeklyScheduleStateCopyWith<$Res> {
  factory _$WeeklyScheduleStateCopyWith(_WeeklyScheduleState value,
          $Res Function(_WeeklyScheduleState) _then) =
      __$WeeklyScheduleStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      WeeklyScheduleEntity? schedule,
      String groupName,
      String? errorMessage,
      DateTime? currentDate});

  @override
  $WeeklyScheduleEntityCopyWith<$Res>? get schedule;
}

/// @nodoc
class __$WeeklyScheduleStateCopyWithImpl<$Res>
    implements _$WeeklyScheduleStateCopyWith<$Res> {
  __$WeeklyScheduleStateCopyWithImpl(this._self, this._then);

  final _WeeklyScheduleState _self;
  final $Res Function(_WeeklyScheduleState) _then;

  /// Create a copy of WeeklyScheduleState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isLoading = null,
    Object? schedule = freezed,
    Object? groupName = null,
    Object? errorMessage = freezed,
    Object? currentDate = freezed,
  }) {
    return _then(_WeeklyScheduleState(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      schedule: freezed == schedule
          ? _self.schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as WeeklyScheduleEntity?,
      groupName: null == groupName
          ? _self.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      currentDate: freezed == currentDate
          ? _self.currentDate
          : currentDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  /// Create a copy of WeeklyScheduleState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WeeklyScheduleEntityCopyWith<$Res>? get schedule {
    if (_self.schedule == null) {
      return null;
    }

    return $WeeklyScheduleEntityCopyWith<$Res>(_self.schedule!, (value) {
      return _then(_self.copyWith(schedule: value));
    });
  }
}

// dart format on
