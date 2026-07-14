import 'package:flutter/material.dart';
import 'package:wat_schedule/core/theme/theme.dart';

extension BuildContextExt on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get colorScheme => theme.colorScheme;
  TextTheme get textTheme => theme.textTheme;
  ScheduleThemeColors get scheduleColors =>
      theme.extension<ScheduleThemeColors>()!;
  TextStyle? textStyle(TextStyle style) =>
      textTheme.headlineSmall?.merge(style);
}
