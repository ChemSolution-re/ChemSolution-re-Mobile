part of '../main_theme.dart';

class MainThemeData {
  final ThemeData themeData;

  /// Should not be used directly.
  /// Please, use `MainTheme.text(context)`
  @protected
  final MainTextThemeData textTheme;

  /// Should not be used directly.
  /// Please, use `MainTheme.color(context)`
  @protected
  final MainColorThemeData colorTheme;

  MainThemeData({
    required this.themeData,
    required this.textTheme,
    required this.colorTheme,
  });
}
