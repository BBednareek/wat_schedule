
import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wat_schedule/core/network/error/failures.dart';
import 'package:wat_schedule/features/faculty_groups/domain/entity/faculty_groups_entity.dart';
import 'package:wat_schedule/features/faculty_groups/domain/usecase/faculty_groups_usecase.dart';

part 'faculty_groups_bloc.freezed.dart';
part 'faculty_groups_event.dart';
part 'faculty_groups_state.dart';

class FacultyGroupsBloc extends Bloc<FacultyGroupsEvent, FacultyGroupsState> {
  final FacultyGroupsUsecase facultyGroupsUsecase;

  FacultyGroupsBloc({required this.facultyGroupsUsecase}) : super(const FacultyGroupsState.loading()) {
    on<_GetFacultyGroups>(_getFacultyGroups);
  }

  _getFacultyGroups(_GetFacultyGroups event, Emitter<FacultyGroupsState> emit) async {
    final Either<Failure, FacultyGroupsEntity> result = await facultyGroupsUsecase.call();

    result.fold(
      (l) => emit(_Error(errorMessage: l.message)),
      (r) => emit(const _Loaded())
    );
  }

}

