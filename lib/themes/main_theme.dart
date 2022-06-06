import 'package:flutter/material.dart';

part 'theme/main_color_theme_data.dart';
part 'theme/main_text_theme_data.dart';
part 'theme/main_theme_data.dart';

class ChemSolutionAppTheme extends InheritedWidget {
  static ChemSolutionAppThemeData of(BuildContext context) => maybeOf(context)!;
  static ChemSolutionAppThemeData? maybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ChemSolutionAppTheme>()
        ?.theme;
  }

  static ChemSolutionAppTextThemeData text(BuildContext context) =>
      of(context).textTheme;
  static ChemSolutionAppColorThemeData color(BuildContext context) =>
      of(context).colorTheme;

  final ChemSolutionAppThemeData theme;

  const ChemSolutionAppTheme({
    Key? key,
    required this.theme,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(ChemSolutionAppTheme oldWidget) {
    return theme != oldWidget.theme;
  }
}
