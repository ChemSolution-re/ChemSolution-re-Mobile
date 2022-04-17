part of '../light_theme.dart';

const _textButtonLetterSpacing = 0.02;

const _headline1 = _TextStyle(32, FontWeight.w600, _AppColors.darkBlue);
const _headline2 = _TextStyle(26, FontWeight.w600, _AppColors.darkBlue);
const _headline3 = _TextStyle(22, FontWeight.w600, _AppColors.darkBlue);
const _headline4 = _TextStyle(20, FontWeight.w600, _AppColors.darkBlue);
const _headline5 = _TextStyle(18, FontWeight.w400, _AppColors.darkBlue);
const _headline6 = _TextStyle(16, FontWeight.w400, _AppColors.darkBlue);
const _subtitle1 = _TextStyle(12, FontWeight.w600, _AppColors.blue);
const _subtitle2 = _TextStyle(12, FontWeight.w400, _AppColors.darkGreen);
const _bodyText1 = _TextStyle(16, FontWeight.w400, _AppColors.darkGreen);

const _button = _TextStyle(
  16,
  FontWeight.w600,
  _AppColors.blue,
  _textButtonLetterSpacing,
);

class _TextStyle extends TextStyle {
  const _TextStyle(
    double size,
    FontWeight weight,
    Color color, [
    double? letterSpacing,
  ]) : super(
          fontSize: size,
          fontWeight: weight,
          color: color,
          letterSpacing: letterSpacing,
        );
}

abstract class _AppColors {
  static const white = Colors.white;

  static const darkBlue = Color(0xff2F455C);
  static const blue = Color(0xff1DCDFE);
  static const lightBlue = Color(0xffEBFAFF);

  static const grey = Colors.grey;
  static const lightGrey = Color(0xffe1e7ed);

  static const red = Colors.redAccent;
  static const darkRed = Color(0xff590000);

  static const green = Color(0xff21D0B2);
  static const darkGreen = Color(0xff005c05);
}
