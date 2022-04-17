import 'package:flutter/material.dart';

class MainButtonStyle {
  final Gradient? gradient;
  final ButtonStyle _buttonStyle;

  MainButtonStyle({
    this.gradient,
    required ButtonStyle buttonStyle,
  }) : _buttonStyle = buttonStyle;

  ButtonStyle get buttonStyle {
    return gradient == null
        ? _buttonStyle
        : _buttonStyle.copyWith(
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            overlayColor: MaterialStateProperty.all(Colors.transparent),
          );
  }

  MainButtonStyle copyWith({
    ButtonStyle? buttonStyle,
    Optional<Gradient>? gradient,
  }) {
    return MainButtonStyle(
      buttonStyle: buttonStyle ?? _buttonStyle,
      gradient: gradient != null ? gradient.value : this.gradient,
    );
  }
}

class Optional<T> {
  final T? value;

  Optional(this.value);
  Optional.empty() : value = null;
}
