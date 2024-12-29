import 'package:flutter/material.dart';

extension BuildContextExt on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  TextStyle? textStyle(TextStyle style) =>
      textTheme.headlineSmall?.merge(style);
}