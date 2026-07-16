import 'package:flutter/material.dart';

class ThemeEntity {
  final ThemeMode themeMode;
  final bool isDark;
  final bool isSystem;

  const ThemeEntity({
    required this.themeMode,
    required this.isDark,
    required this.isSystem,
  });

  const ThemeEntity.system()
      : themeMode = ThemeMode.system,
        isDark = false,
        isSystem = true;

  const ThemeEntity.light()
      : themeMode = ThemeMode.light,
        isDark = false,
        isSystem = false;

  const ThemeEntity.dark()
      : themeMode = ThemeMode.dark,
        isDark = true,
        isSystem = false;

  Map<String, dynamic> toJson() => {
        'theme': themeMode.index,
        'isDark': isDark,
        'isSystem': isSystem,
      };

  factory ThemeEntity.fromJson(Map<String, dynamic> json) {
    final int themeModeIndex = json['theme'] as int? ?? ThemeMode.system.index;
    final ThemeMode themeMode =
        themeModeIndex >= 0 && themeModeIndex < ThemeMode.values.length
            ? ThemeMode.values[themeModeIndex]
            : ThemeMode.system;

    return ThemeEntity(
      themeMode: themeMode,
      isDark: json['isDark'] as bool? ?? themeMode == ThemeMode.dark,
      isSystem: json['isSystem'] as bool? ?? themeMode == ThemeMode.system,
    );
  }
}
