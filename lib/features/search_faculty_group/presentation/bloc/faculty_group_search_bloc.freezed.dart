// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'faculty_group_search_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FacultyGroupSearchEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is FacultyGroupSearchEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FacultyGroupSearchEvent()';
  }
}

/// @nodoc
class $FacultyGroupSearchEventCopyWith<$Res> {
  $FacultyGroupSearchEventCopyWith(
      FacultyGroupSearchEvent _, $Res Function(FacultyGroupSearchEvent) __);
}

/// Adds pattern-matching-related methods to [FacultyGroupSearchEvent].
extension FacultyGroupSearchEventPatterns on FacultyGroupSearchEvent {
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
    TResult Function(_SetGroups value)? setGroups,
    TResult Function(_QueryChanged value)? queryChanged,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SetGroups() when setGroups != null:
        return setGroups(_that);
      case _QueryChanged() when queryChanged != null:
        return queryChanged(_that);
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
    required TResult Function(_SetGroups value) setGroups,
    required TResult Function(_QueryChanged value) queryChanged,
  }) {
    final _that = this;
    switch (_that) {
      case _SetGroups():
        return setGroups(_that);
      case _QueryChanged():
        return queryChanged(_that);
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
    TResult? Function(_SetGroups value)? setGroups,
    TResult? Function(_QueryChanged value)? queryChanged,
  }) {
    final _that = this;
    switch (_that) {
      case _SetGroups() when setGroups != null:
        return setGroups(_that);
      case _QueryChanged() when queryChanged != null:
        return queryChanged(_that);
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
    TResult Function(List<String> groups)? setGroups,
    TResult Function(String query)? queryChanged,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SetGroups() when setGroups != null:
        return setGroups(_that.groups);
      case _QueryChanged() when queryChanged != null:
        return queryChanged(_that.query);
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
    required TResult Function(List<String> groups) setGroups,
    required TResult Function(String query) queryChanged,
  }) {
    final _that = this;
    switch (_that) {
      case _SetGroups():
        return setGroups(_that.groups);
      case _QueryChanged():
        return queryChanged(_that.query);
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
    TResult? Function(List<String> groups)? setGroups,
    TResult? Function(String query)? queryChanged,
  }) {
    final _that = this;
    switch (_that) {
      case _SetGroups() when setGroups != null:
        return setGroups(_that.groups);
      case _QueryChanged() when queryChanged != null:
        return queryChanged(_that.query);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _SetGroups implements FacultyGroupSearchEvent {
  const _SetGroups({required final List<String> groups}) : _groups = groups;

  final List<String> _groups;
  List<String> get groups {
    if (_groups is EqualUnmodifiableListView) return _groups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_groups);
  }

  /// Create a copy of FacultyGroupSearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SetGroupsCopyWith<_SetGroups> get copyWith =>
      __$SetGroupsCopyWithImpl<_SetGroups>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SetGroups &&
            const DeepCollectionEquality().equals(other._groups, _groups));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_groups));

  @override
  String toString() {
    return 'FacultyGroupSearchEvent.setGroups(groups: $groups)';
  }
}

/// @nodoc
abstract mixin class _$SetGroupsCopyWith<$Res>
    implements $FacultyGroupSearchEventCopyWith<$Res> {
  factory _$SetGroupsCopyWith(
          _SetGroups value, $Res Function(_SetGroups) _then) =
      __$SetGroupsCopyWithImpl;
  @useResult
  $Res call({List<String> groups});
}

/// @nodoc
class __$SetGroupsCopyWithImpl<$Res> implements _$SetGroupsCopyWith<$Res> {
  __$SetGroupsCopyWithImpl(this._self, this._then);

  final _SetGroups _self;
  final $Res Function(_SetGroups) _then;

  /// Create a copy of FacultyGroupSearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? groups = null,
  }) {
    return _then(_SetGroups(
      groups: null == groups
          ? _self._groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _QueryChanged implements FacultyGroupSearchEvent {
  const _QueryChanged({required this.query});

  final String query;

  /// Create a copy of FacultyGroupSearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$QueryChangedCopyWith<_QueryChanged> get copyWith =>
      __$QueryChangedCopyWithImpl<_QueryChanged>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QueryChanged &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @override
  String toString() {
    return 'FacultyGroupSearchEvent.queryChanged(query: $query)';
  }
}

/// @nodoc
abstract mixin class _$QueryChangedCopyWith<$Res>
    implements $FacultyGroupSearchEventCopyWith<$Res> {
  factory _$QueryChangedCopyWith(
          _QueryChanged value, $Res Function(_QueryChanged) _then) =
      __$QueryChangedCopyWithImpl;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$QueryChangedCopyWithImpl<$Res>
    implements _$QueryChangedCopyWith<$Res> {
  __$QueryChangedCopyWithImpl(this._self, this._then);

  final _QueryChanged _self;
  final $Res Function(_QueryChanged) _then;

  /// Create a copy of FacultyGroupSearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? query = null,
  }) {
    return _then(_QueryChanged(
      query: null == query
          ? _self.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$FacultyGroupSearchState {
  List<String> get filteredGroups;

  /// Create a copy of FacultyGroupSearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FacultyGroupSearchStateCopyWith<FacultyGroupSearchState> get copyWith =>
      _$FacultyGroupSearchStateCopyWithImpl<FacultyGroupSearchState>(
          this as FacultyGroupSearchState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FacultyGroupSearchState &&
            const DeepCollectionEquality()
                .equals(other.filteredGroups, filteredGroups));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(filteredGroups));

  @override
  String toString() {
    return 'FacultyGroupSearchState(filteredGroups: $filteredGroups)';
  }
}

/// @nodoc
abstract mixin class $FacultyGroupSearchStateCopyWith<$Res> {
  factory $FacultyGroupSearchStateCopyWith(FacultyGroupSearchState value,
          $Res Function(FacultyGroupSearchState) _then) =
      _$FacultyGroupSearchStateCopyWithImpl;
  @useResult
  $Res call({List<String> filteredGroups});
}

/// @nodoc
class _$FacultyGroupSearchStateCopyWithImpl<$Res>
    implements $FacultyGroupSearchStateCopyWith<$Res> {
  _$FacultyGroupSearchStateCopyWithImpl(this._self, this._then);

  final FacultyGroupSearchState _self;
  final $Res Function(FacultyGroupSearchState) _then;

  /// Create a copy of FacultyGroupSearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filteredGroups = null,
  }) {
    return _then(_self.copyWith(
      filteredGroups: null == filteredGroups
          ? _self.filteredGroups
          : filteredGroups // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// Adds pattern-matching-related methods to [FacultyGroupSearchState].
extension FacultyGroupSearchStatePatterns on FacultyGroupSearchState {
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
    TResult Function(_SearchResults value)? results,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchResults() when results != null:
        return results(_that);
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
    required TResult Function(_SearchResults value) results,
  }) {
    final _that = this;
    switch (_that) {
      case _SearchResults():
        return results(_that);
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
    TResult? Function(_SearchResults value)? results,
  }) {
    final _that = this;
    switch (_that) {
      case _SearchResults() when results != null:
        return results(_that);
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
    TResult Function(List<String> filteredGroups)? results,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchResults() when results != null:
        return results(_that.filteredGroups);
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
    required TResult Function(List<String> filteredGroups) results,
  }) {
    final _that = this;
    switch (_that) {
      case _SearchResults():
        return results(_that.filteredGroups);
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
    TResult? Function(List<String> filteredGroups)? results,
  }) {
    final _that = this;
    switch (_that) {
      case _SearchResults() when results != null:
        return results(_that.filteredGroups);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _SearchResults implements FacultyGroupSearchState {
  const _SearchResults({required final List<String> filteredGroups})
      : _filteredGroups = filteredGroups;

  final List<String> _filteredGroups;
  @override
  List<String> get filteredGroups {
    if (_filteredGroups is EqualUnmodifiableListView) return _filteredGroups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filteredGroups);
  }

  /// Create a copy of FacultyGroupSearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchResultsCopyWith<_SearchResults> get copyWith =>
      __$SearchResultsCopyWithImpl<_SearchResults>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchResults &&
            const DeepCollectionEquality()
                .equals(other._filteredGroups, _filteredGroups));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_filteredGroups));

  @override
  String toString() {
    return 'FacultyGroupSearchState.results(filteredGroups: $filteredGroups)';
  }
}

/// @nodoc
abstract mixin class _$SearchResultsCopyWith<$Res>
    implements $FacultyGroupSearchStateCopyWith<$Res> {
  factory _$SearchResultsCopyWith(
          _SearchResults value, $Res Function(_SearchResults) _then) =
      __$SearchResultsCopyWithImpl;
  @override
  @useResult
  $Res call({List<String> filteredGroups});
}

/// @nodoc
class __$SearchResultsCopyWithImpl<$Res>
    implements _$SearchResultsCopyWith<$Res> {
  __$SearchResultsCopyWithImpl(this._self, this._then);

  final _SearchResults _self;
  final $Res Function(_SearchResults) _then;

  /// Create a copy of FacultyGroupSearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? filteredGroups = null,
  }) {
    return _then(_SearchResults(
      filteredGroups: null == filteredGroups
          ? _self._filteredGroups
          : filteredGroups // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

// dart format on
