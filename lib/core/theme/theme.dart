import 'package:flutter/material.dart';
import 'package:wat_schedule/core/theme/colors.dart';

ThemeData lightTheme() => _buildTheme(
      brightness: Brightness.light,
      background: ProjectColors.lightBackground,
      surface: ProjectColors.lightSurface,
      surfaceMuted: ProjectColors.lightSurfaceMuted,
      text: ProjectColors.lightText,
      mutedText: ProjectColors.lightTextMuted,
      outline: ProjectColors.lightOutline,
    );

ThemeData darkTheme() => _buildTheme(
      brightness: Brightness.dark,
      background: ProjectColors.darkBackground,
      surface: ProjectColors.darkSurface,
      surfaceMuted: ProjectColors.darkSurfaceMuted,
      text: ProjectColors.darkText,
      mutedText: ProjectColors.darkTextMuted,
      outline: ProjectColors.darkOutline,
    );

ThemeData _buildTheme({
  required Brightness brightness,
  required Color background,
  required Color surface,
  required Color surfaceMuted,
  required Color text,
  required Color mutedText,
  required Color outline,
}) {
  final colorScheme = ColorScheme.fromSeed(
    seedColor: ProjectColors.blue,
    brightness: brightness,
  ).copyWith(
    primary: ProjectColors.blue,
    onPrimary: Colors.white,
    secondary: ProjectColors.red,
    onSecondary: Colors.white,
    tertiary: ProjectColors.green,
    onTertiary: Colors.white,
    surface: surface,
    onSurface: text,
    error: ProjectColors.red,
    onError: Colors.white,
    outline: outline,
    outlineVariant: outline,
  );

  return ThemeData(
    useMaterial3: true,
    brightness: brightness,
    scaffoldBackgroundColor: background,
    colorScheme: colorScheme,
    dividerColor: outline,
    textTheme: _textTheme(text: text, mutedText: mutedText),
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: background,
      foregroundColor: text,
      surfaceTintColor: Colors.transparent,
    ),
    cardTheme: CardThemeData(
      elevation: 0,
      color: surface,
      surfaceTintColor: Colors.transparent,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: outline),
      ),
    ),
    listTileTheme: ListTileThemeData(
      iconColor: mutedText,
      textColor: text,
      selectedColor: colorScheme.primary,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        minimumSize: const Size(double.infinity, 48),
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        disabledBackgroundColor: surfaceMuted,
        disabledForegroundColor: mutedText,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        foregroundColor: text,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith(
        (states) => states.contains(WidgetState.selected)
            ? colorScheme.primary
            : mutedText,
      ),
      trackColor: WidgetStateProperty.resolveWith(
        (states) => states.contains(WidgetState.selected)
            ? colorScheme.primary.withAlpha(82)
            : surfaceMuted,
      ),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: surfaceMuted,
      selectedColor: colorScheme.primary.withAlpha(28),
      labelStyle: TextStyle(color: text),
      secondaryLabelStyle: TextStyle(color: colorScheme.primary),
      side: BorderSide(color: outline),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
    ),
    extensions: [
      ScheduleThemeColors(
        surfaceMuted: surfaceMuted,
        mutedText: mutedText,
        outline: outline,
      ),
    ],
  );
}

TextTheme _textTheme({
  required Color text,
  required Color mutedText,
}) {
  return TextTheme(
    headlineMedium: TextStyle(
      color: text,
      fontSize: 28,
      fontWeight: FontWeight.w700,
      height: 1.2,
    ),
    titleLarge: TextStyle(
      color: text,
      fontSize: 22,
      fontWeight: FontWeight.w700,
      height: 1.25,
    ),
    titleMedium: TextStyle(
      color: text,
      fontSize: 18,
      fontWeight: FontWeight.w600,
      height: 1.3,
    ),
    bodyLarge: TextStyle(
      color: text,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      height: 1.45,
    ),
    bodyMedium: TextStyle(
      color: text,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 1.45,
    ),
    bodySmall: TextStyle(
      color: mutedText,
      fontSize: 12,
      fontWeight: FontWeight.w500,
      height: 1.35,
    ),
    labelLarge: TextStyle(
      color: text,
      fontSize: 14,
      fontWeight: FontWeight.w700,
      height: 1.2,
    ),
    labelMedium: TextStyle(
      color: mutedText,
      fontSize: 12,
      fontWeight: FontWeight.w600,
      height: 1.2,
    ),
  );
}

@immutable
class ScheduleThemeColors extends ThemeExtension<ScheduleThemeColors> {
  final Color surfaceMuted;
  final Color mutedText;
  final Color outline;

  const ScheduleThemeColors({
    required this.surfaceMuted,
    required this.mutedText,
    required this.outline,
  });

  @override
  ScheduleThemeColors copyWith({
    Color? surfaceMuted,
    Color? mutedText,
    Color? outline,
  }) {
    return ScheduleThemeColors(
      surfaceMuted: surfaceMuted ?? this.surfaceMuted,
      mutedText: mutedText ?? this.mutedText,
      outline: outline ?? this.outline,
    );
  }

  @override
  ScheduleThemeColors lerp(
    ThemeExtension<ScheduleThemeColors>? other,
    double t,
  ) {
    if (other is! ScheduleThemeColors) return this;

    return ScheduleThemeColors(
      surfaceMuted: Color.lerp(surfaceMuted, other.surfaceMuted, t)!,
      mutedText: Color.lerp(mutedText, other.mutedText, t)!,
      outline: Color.lerp(outline, other.outline, t)!,
    );
  }
}
