import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:wat_schedule/core/network/error/failures.dart';
import 'package:wat_schedule/features/get_faculty_groups/domain/entity/faculty_groups_entity.dart';
import 'package:wat_schedule/features/get_faculty_groups/domain/use_cases/get_faculty_groups_use_case.dart';

part 'faculty_groups_bloc.freezed.dart';
part 'faculty_groups_event.dart';
part 'faculty_groups_state.dart';

/// Bloc for managing faculty groups state.
/// It handles events related to fetching faculty groups
/// and emits states based on the result of the use case.
@injectable
class FacultyGroupsBloc extends Bloc<FacultyGroupsEvent, FacultyGroupsState> {
  final GetFacultyGroupsUseCase getFacultyGroupsUseCase;

  FacultyGroupsBloc({required this.getFacultyGroupsUseCase})
      : super(const FacultyGroupsState.loading()) {
    on<_LoadFacultyGroups>(_loadFacultyGroups);
    on<_SelectGroup>(_onSelectGroup);
  }

  void _onSelectGroup(_SelectGroup event, Emitter<FacultyGroupsState> emit) {
    final FacultyGroupsState currentState = state;

    if (currentState is! FacultyGroupsLoaded) return;

    emit(FacultyGroupsState.loaded(
      entity: currentState.entity,
      selectedGroupName: event.groupName,
    ));
  }

  Future<void> _loadFacultyGroups(
      _LoadFacultyGroups event, Emitter<FacultyGroupsState> emit) async {
    emit(const FacultyGroupsState.loading());

    final Either<Failure, FacultyGroupsEntity> result =
        await getFacultyGroupsUseCase.call(department: event.department);

    result.fold(
      (failure) => emit(
        FacultyGroupsError(errorMessage: failure.errorMessage),
      ),
      (entity) => emit(FacultyGroupsLoaded(entity: entity)),
    );
  }
}
