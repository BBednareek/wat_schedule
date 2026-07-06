import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:wat_schedule/core/network/error/failures.dart';
import 'package:wat_schedule/features/get_faculty_groups/domain/entity/faculty_groups_entity.dart';
import 'package:wat_schedule/features/get_faculty_groups/domain/usecase/faculty_groups_usecase.dart';

part 'faculty_groups_bloc.freezed.dart';
part 'faculty_groups_event.dart';
part 'faculty_groups_state.dart';

/// Bloc for managing faculty groups state.
/// It handles events related to fetching faculty groups
/// and emits states based on the result of the usecase.
@lazySingleton
class FacultyGroupsBloc
    extends HydratedBloc<FacultyGroupsEvent, FacultyGroupsState> {
  final FacultyGroupsUsecase facultyGroupsUsecase;

  FacultyGroupsBloc({required this.facultyGroupsUsecase})
      : super(const FacultyGroupsState.loading()) {
    on<_GetFacultyGroups>(_getFacultyGroups);
    on<_SelectGroup>(_onSelectGroup);
  }

  void _onSelectGroup(_SelectGroup event, Emitter<FacultyGroupsState> emit) {
    emit(FacultyGroupsState.loaded(
      entity: (state as LoadedGroups).entity,
      selectedGroupNam: event.groupName,
    ));
  }

  Future<void> _getFacultyGroups(
      _GetFacultyGroups event, Emitter<FacultyGroupsState> emit) async {
    final Either<Failure, FacultyGroupsEntity> result =
        await facultyGroupsUsecase.call();

    result.fold(
      (l) => emit(ErrorGroups(errorMessage: l.message)),
      (r) => emit(LoadedGroups(entity: r)),
    );
  }

  @override
  FacultyGroupsState? fromJson(Map<String, dynamic> json) {
    try {
      final type = json['type'] as String?;
      switch (type) {
        case 'loaded':
          return FacultyGroupsState.loaded(
            entity: FacultyGroupsEntity.fromJson(
                Map<String, dynamic>.from(json['entity'] as Map)),
            selectedGroupNam: json['selectedGroupName'] as String?,
          );

        default:
          return null;
      }
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(FacultyGroupsState state) {
    return state.maybeWhen(
      loaded: (entity, selectedGroupNam) => {
        'type': 'loaded',
        'entity': entity.toJson(),
        'selectedGroupName': selectedGroupNam,
      },
      orElse: () => null,
    );
  }
}
