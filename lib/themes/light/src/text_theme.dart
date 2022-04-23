part of '../light_theme.dart';

class _LightTextThemeData implements MainTextThemeData {
  const _LightTextThemeData();

  @override
  TextStyle get appTitle => _headline1.copyWith(
        color: _AppColors.green,
      );

  @override
  TextStyle get profileButtonTitle => _headline1.copyWith(
        fontWeight: FontWeight.w300,
      );
}
