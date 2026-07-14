import 'package:flutter/material.dart';

class ThemeEntity {
  final ThemeMode theme;
  final bool isDark;
  final bool isSystem;

  const ThemeEntity({
    required this.theme,
    required this.isDark,
    required this.isSystem,
  });

  const ThemeEntity.system()
      : theme = ThemeMode.system,
        isDark = false,
        isSystem = true;

  const ThemeEntity.light()
      : theme = ThemeMode.light,
        isDark = false,
        isSystem = false;

  const ThemeEntity.dark()
      : theme = ThemeMode.dark,
        isDark = true,
        isSystem = false;

  ThemeEntity copyWith({
    ThemeMode? theme,
    bool? isDark,
    bool? isSystem,
  }) {
    return ThemeEntity(
      theme: theme ?? this.theme,
      isDark: isDark ?? this.isDark,
      isSystem: isSystem ?? this.isSystem,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'theme': theme.index,
      'isDark': isDark,
      'isSystem': isSystem,
    };
  }

  factory ThemeEntity.fromJson(Map<String, dynamic> json) {
    final int themeIndex = json['theme'] as int? ?? ThemeMode.system.index;
    final ThemeMode theme =
        themeIndex >= 0 && themeIndex < ThemeMode.values.length
            ? ThemeMode.values[themeIndex]
            : ThemeMode.system;

    return ThemeEntity(
      theme: theme,
      isDark: json['isDark'] as bool? ?? theme == ThemeMode.dark,
      isSystem: json['isSystem'] as bool? ?? theme == ThemeMode.system,
    );
  }
}
