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
import 'package:wat_schedule/features/get_faculty_groups/data/datasource/faculty_groups_datasource.dart'
    as _i19;
import 'package:wat_schedule/features/get_faculty_groups/data/repository/faculty_groups_repository.dart'
    as _i112;
import 'package:wat_schedule/features/get_faculty_groups/domain/usecase/faculty_groups_usecase.dart'
    as _i741;
import 'package:wat_schedule/features/get_faculty_groups/presentation/bloc/faculty_groups_bloc.dart'
    as _i688;
import 'package:wat_schedule/features/get_weekly_schedule/data/datasource/get_weekly_schedule_datasource.dart'
    as _i548;
import 'package:wat_schedule/features/get_weekly_schedule/data/repository/get_weekly_schedule_repository.dart'
    as _i905;
import 'package:wat_schedule/features/get_weekly_schedule/domain/usecases/get_weekly_schedule_usecase.dart'
    as _i762;
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
    gh.lazySingleton<_i548.GetWeeklyScheduleDatasource>(
        () => _i548.GetWeeklyScheduleImpl(dioFactory: gh<_i272.DioFactory>()));
    gh.lazySingleton<_i19.FacultyGroupsRemoteDatasource>(() =>
        _i19.FacultyGroupsRemoteDatasourceImpl(
            dioFactory: gh<_i272.DioFactory>()));
    gh.lazySingleton<_i905.GetWeeklyScheduleRepository>(() =>
        _i905.GetWeeklyScheduleRepositoryImpl(
            getWeeklyScheduleDatasource:
                gh<_i548.GetWeeklyScheduleDatasource>()));
    gh.lazySingleton<_i112.FacultyGroupsRepository>(() =>
        _i112.FacultyGroupsRepositoryImpl(
            facultyGroupsRemoteDatasource:
                gh<_i19.FacultyGroupsRemoteDatasource>()));
    gh.lazySingleton<_i762.GetWeeklyScheduleUsecase>(() =>
        _i762.GetWeeklyScheduleUsecase(
            getWeeklyScheduleRepository:
                gh<_i905.GetWeeklyScheduleRepository>()));
    gh.lazySingleton<_i741.FacultyGroupsUsecase>(() =>
        _i741.FacultyGroupsUsecase(
            scheduleRepository: gh<_i112.FacultyGroupsRepository>()));
    gh.lazySingleton<_i688.FacultyGroupsBloc>(() => _i688.FacultyGroupsBloc(
        facultyGroupsUsecase: gh<_i741.FacultyGroupsUsecase>()));
    return this;
  }
}
