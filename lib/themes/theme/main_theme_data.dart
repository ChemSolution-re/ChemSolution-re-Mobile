part of '../main_theme.dart';

class ChemSolutionAppThemeData {
  final ThemeData themeData;

  /// Should not be used directly.
  /// Please, use `ChemSolutionAppTheme.text(context)`
  @protected
  final ChemSolutionAppTextThemeData textTheme;

  /// Should not be used directly.
  /// Please, use `ChemSolutionAppTheme.color(context)`
  @protected
  final ChemSolutionAppColorThemeData colorTheme;

  ChemSolutionAppThemeData({
    required this.themeData,
    required this.textTheme,
    required this.colorTheme,
  });
}
