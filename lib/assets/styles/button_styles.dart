import 'package:flutter/material.dart';

class ButtonExtStyles extends ThemeExtension<ButtonExtStyles> {
  final TextStyle elTextStyle;
  final TextStyle alternativeElTextStyle;

  ButtonExtStyles({
    required this.elTextStyle,
    required this.alternativeElTextStyle,
  });

  @override
  ThemeExtension<ButtonExtStyles> copyWith() {
    throw UnimplementedError();
  }

  @override
  ThemeExtension<ButtonExtStyles> lerp(
      ThemeExtension<ButtonExtStyles>? other, double t) {
    if (other! is ButtonExtStyles) {
      return this;
    }
    other as ButtonExtStyles;
    return ButtonExtStyles(
      elTextStyle: TextStyle.lerp(
        elTextStyle,
        other.elTextStyle,
        t,
      )!,
      alternativeElTextStyle: TextStyle.lerp(
        alternativeElTextStyle,
        other.alternativeElTextStyle,
        t,
      )!,
    );
  }
}
