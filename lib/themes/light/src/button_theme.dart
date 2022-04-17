part of '../light_theme.dart';

class _LightButtonTheme implements MainButtonThemeData {
  const _LightButtonTheme();

  @override
  MainButtonStyle get primary => MainButtonStyle(
        gradient: null,
        buttonStyle: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
        ),
      );

  @override
  MainButtonStyle get secondaryTextButton => primary.copyWith(
        gradient: null,
        buttonStyle: primary.buttonStyle.copyWith(
          alignment: Alignment.centerRight,
        ),
      );
}
