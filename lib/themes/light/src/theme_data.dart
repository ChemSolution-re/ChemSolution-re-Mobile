part of '../light_theme.dart';

ThemeData _createTheme() {
  const textTheme = TextTheme(
    headline1: _headline1,
    headline2: _headline2,
    headline3: _headline3,
    headline4: _headline4,
    headline5: _headline5,
    headline6: _headline6,
    subtitle1: _subtitle1,
    subtitle2: _subtitle2,
    bodyText1: _bodyText1,
    button: _button,
  );

  const _bottomNavigationTheme = BottomNavigationBarThemeData(
    backgroundColor: _AppColors.darkBlue,
    selectedItemColor: _AppColors.green,
    unselectedItemColor: _AppColors.white,
    showSelectedLabels: true,
    showUnselectedLabels: false,
    type: BottomNavigationBarType.fixed,
  );

  final _textButtonThemeData = TextButtonThemeData(
    style: TextButton.styleFrom(
      textStyle: _button,
      primary: _AppColors.darkBlue,
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: VisualDensity.compact,
    ),
  );

  final _outlinedButtonThemeData = OutlinedButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStateProperty.all(_button),
      shadowColor: MaterialStateProperty.all(_AppColors.blue),
      foregroundColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return _AppColors.grey;
          }
          return _AppColors.darkBlue;
        },
      ),
      padding: MaterialStateProperty.all(
        const EdgeInsets.symmetric(
          horizontal: 36,
          vertical: 16,
        ),
      ),
      side: MaterialStateProperty.resolveWith<BorderSide>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return const BorderSide(color: _AppColors.lightGrey);
          }
          return const BorderSide(color: _AppColors.blue);
        },
      ),
    ),
  );

  final inputDecorationTheme = InputDecorationTheme(
    hintStyle: _headline5,
    errorStyle: _bodyText1.copyWith(
      color: _AppColors.red,
    ),
    contentPadding: const EdgeInsets.all(16),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: _AppColors.blue,
      ),
      borderRadius: BorderRadius.circular(4),
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: _AppColors.grey),
      borderRadius: BorderRadius.circular(4),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: _AppColors.darkRed,
      ),
      borderRadius: BorderRadius.circular(4),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: _AppColors.red,
      ),
      borderRadius: BorderRadius.circular(4),
    ),
  );

  const _textSelectionTheme = TextSelectionThemeData(
    cursorColor: _AppColors.blue,
    selectionColor: _AppColors.blue,
    selectionHandleColor: _AppColors.blue,
  );

  final colorScheme = const ColorScheme.light().copyWith(
    primary: _AppColors.darkBlue,
    onPrimary: _AppColors.green,
    error: _AppColors.darkRed,
  );

  final themeData = ThemeData(
    primaryColor: _AppColors.darkBlue,
    colorScheme: colorScheme,
    fontFamily: 'Euclid',
    errorColor: _AppColors.darkRed,
    textTheme: textTheme,
    scaffoldBackgroundColor: _AppColors.lightBlue,
    buttonTheme: const ButtonThemeData(
      buttonColor: _AppColors.blue,
    ),
    textButtonTheme: _textButtonThemeData,
    outlinedButtonTheme: _outlinedButtonThemeData,
    bottomAppBarColor: _AppColors.white,
    bottomNavigationBarTheme: _bottomNavigationTheme,
    inputDecorationTheme: inputDecorationTheme,
    textSelectionTheme: _textSelectionTheme,
  );
  return themeData;
}
