import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:wat_schedule/features/theme_cubit/entity/theme_entity.dart';

@injectable
class ThemeCubit extends HydratedCubit<ThemeEntity> {
  ThemeCubit() : super(const ThemeEntity.system());

  void setSystemTheme() => emit(const ThemeEntity.system());

  void setLightTheme() => emit(const ThemeEntity.light());

  void setDarkTheme() => emit(const ThemeEntity.dark());

  void toggleDarkMode(bool isDark) => isDark ? setDarkTheme() : setLightTheme();

  @override
  ThemeEntity? fromJson(Map<String, dynamic> json) {
    try {
      return ThemeEntity.fromJson(json);
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(ThemeEntity state) => state.toJson();
}
