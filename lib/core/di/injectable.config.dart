// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:wat_schedule/core/network/factory/dio_factory.dart' as _i272;
import 'package:wat_schedule/features/get_faculty_groups/data/datasource/faculty_groups_remote_data_source.dart'
    as _i654;
import 'package:wat_schedule/features/get_faculty_groups/data/repository/faculty_groups_repository.dart'
    as _i112;
import 'package:wat_schedule/features/get_faculty_groups/domain/use_cases/get_faculty_groups_use_case.dart'
    as _i1051;
import 'package:wat_schedule/features/get_faculty_groups/presentation/bloc/faculty_groups_bloc.dart'
    as _i688;
import 'package:wat_schedule/features/get_weekly_schedule/data/datasource/get_weekly_schedule_data_source.dart'
    as _i735;
import 'package:wat_schedule/features/get_weekly_schedule/data/repository/get_weekly_schedule_repository.dart'
    as _i905;
import 'package:wat_schedule/features/get_weekly_schedule/domain/use_cases/get_weekly_schedule_use_case.dart'
    as _i73;
import 'package:wat_schedule/features/get_weekly_schedule/presentation/bloc/weekly_schedule_bloc.dart'
    as _i1002;
import 'package:wat_schedule/features/theme_cubit/presentation/theme_cubit.dart'
    as _i454;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i454.ThemeCubit>(() => _i454.ThemeCubit());
    gh.lazySingleton<_i272.DioFactory>(() => _i272.DioFactoryImpl());
    gh.lazySingleton<_i654.FacultyGroupsRemoteDataSource>(() =>
        _i654.FacultyGroupsRemoteDataSourceImpl(
            dioFactory: gh<_i272.DioFactory>()));
    gh.lazySingleton<_i735.GetWeeklyScheduleDataSource>(() =>
        _i735.GetWeeklyScheduleDataSourceImpl(
            dioFactory: gh<_i272.DioFactory>()));
    gh.lazySingleton<_i112.FacultyGroupsRepository>(() =>
        _i112.FacultyGroupsRepositoryImpl(
            facultyGroupsRemoteDataSource:
                gh<_i654.FacultyGroupsRemoteDataSource>()));
    gh.lazySingleton<_i905.GetWeeklyScheduleRepository>(() =>
        _i905.GetWeeklyScheduleRepositoryImpl(
            getWeeklyScheduleDataSource:
                gh<_i735.GetWeeklyScheduleDataSource>()));
    gh.lazySingleton<_i73.GetWeeklyScheduleUseCase>(() =>
        _i73.GetWeeklyScheduleUseCase(
            getWeeklyScheduleRepository:
                gh<_i905.GetWeeklyScheduleRepository>()));
    gh.lazySingleton<_i1051.GetFacultyGroupsUseCase>(() =>
        _i1051.GetFacultyGroupsUseCase(
            facultyGroupsRepository: gh<_i112.FacultyGroupsRepository>()));
    gh.lazySingleton<_i1002.WeeklyScheduleBloc>(() => _i1002.WeeklyScheduleBloc(
        getWeeklyScheduleUseCase: gh<_i73.GetWeeklyScheduleUseCase>()));
    gh.factory<_i688.FacultyGroupsBloc>(() => _i688.FacultyGroupsBloc(
        getFacultyGroupsUseCase: gh<_i1051.GetFacultyGroupsUseCase>()));
    return this;
  }
}
