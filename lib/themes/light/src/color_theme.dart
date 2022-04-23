part of '../light_theme.dart';

class _LightColorThemeData implements MainColorThemeData {
  const _LightColorThemeData();

  @override
  Color get errorToastBackground => _AppColors.red;

  @override
  Color get errorToastForeground => _AppColors.darkRed;

  @override
  Color get primaryBackground => _AppColors.lightBlue;

  @override
  Color get successToastBackground => _AppColors.green;

  @override
  Color get successToastForeground => _AppColors.darkGreen;

  @override
  Color get elementTileBackground => _AppColors.blue;

  @override
  Color get blogPostTileBackground => _AppColors.white;
}
