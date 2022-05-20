import 'package:flutter/material.dart';

import '../main_theme.dart';

part 'src/color_theme.dart';
part 'src/constants.dart';
part 'src/text_theme.dart';
part 'src/theme_data.dart';

class LightThemeData extends MainThemeData {
  LightThemeData()
      : super(
          themeData: _createTheme(),
          textTheme: const _LightTextThemeData(),
          colorTheme: const _LightColorThemeData(),
        );
}
