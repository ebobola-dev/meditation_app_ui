import 'package:flutter/material.dart';

class TokenExtColors extends ThemeExtension<TokenExtColors> {
  final Color primaryBase;
  final Color primary100;
  final Color stroke;

  TokenExtColors({
    required this.primaryBase,
    required this.primary100,
    required this.stroke,
  });

  @override
  ThemeExtension<TokenExtColors> copyWith() {
    throw UnimplementedError();
  }

  @override
  ThemeExtension<TokenExtColors> lerp(
      ThemeExtension<TokenExtColors>? other, double t) {
    if (other! is TokenExtColors) {
      return this;
    }
    other as TokenExtColors;
    return TokenExtColors(
      primaryBase: Color.lerp(primaryBase, other.primaryBase, t)!,
      primary100: Color.lerp(primary100, other.primary100, t)!,
      stroke: Color.lerp(stroke, other.stroke, t)!,
    );
  }
}

class TextExtColors extends ThemeExtension<TextExtColors> {
  final Color secondary;
  final Color black;
  final Color body;
  final Color bodyLight;

  TextExtColors({
    required this.secondary,
    required this.black,
    required this.body,
    required this.bodyLight,
  });

  @override
  ThemeExtension<TextExtColors> copyWith() {
    throw UnimplementedError();
  }

  @override
  ThemeExtension<TextExtColors> lerp(
      covariant ThemeExtension<TextExtColors>? other, double t) {
    if (other! is TextExtColors) {
      return this;
    }
    other as TextExtColors;
    return TextExtColors(
      secondary: Color.lerp(secondary, other.secondary, t)!,
      black: Color.lerp(black, other.black, t)!,
      body: Color.lerp(body, other.body, t)!,
      bodyLight: Color.lerp(bodyLight, other.bodyLight, t)!,
    );
  }
}

class InputExtColors extends ThemeExtension<InputExtColors> {
  final Color field;
  final Color label;
  final Color icon;

  InputExtColors({
    required this.field,
    required this.label,
    required this.icon,
  });

  @override
  ThemeExtension<InputExtColors> copyWith() {
    throw UnimplementedError();
  }

  @override
  ThemeExtension<InputExtColors> lerp(
      covariant ThemeExtension<InputExtColors>? other, double t) {
    if (other! is InputExtColors) {
      return this;
    }
    other as InputExtColors;
    return InputExtColors(
      field: Color.lerp(field, other.field, t)!,
      label: Color.lerp(label, other.label, t)!,
      icon: Color.lerp(icon, other.icon, t)!,
    );
  }
}

class OtherExtColors extends ThemeExtension<OtherExtColors> {
  final Color primaryToWhite;
  final Color secondaryToPrimary;
  final Color whiteToSecondary;
  final Color whiteToPrimary;
  final Color empty;
  final Color selected;

  OtherExtColors({
    required this.primaryToWhite,
    required this.secondaryToPrimary,
    required this.whiteToSecondary,
    required this.whiteToPrimary,
    required this.empty,
    required this.selected,
  });

  @override
  ThemeExtension<OtherExtColors> copyWith() {
    throw UnimplementedError();
  }

  @override
  ThemeExtension<OtherExtColors> lerp(
      covariant ThemeExtension<OtherExtColors>? other, double t) {
    if (other! is OtherExtColors) {
      return this;
    }
    other as OtherExtColors;
    return OtherExtColors(
      primaryToWhite: Color.lerp(primaryToWhite, other.primaryToWhite, t)!,
      secondaryToPrimary:
          Color.lerp(secondaryToPrimary, other.secondaryToPrimary, t)!,
      whiteToSecondary:
          Color.lerp(whiteToSecondary, other.whiteToSecondary, t)!,
      whiteToPrimary: Color.lerp(whiteToPrimary, other.whiteToPrimary, t)!,
      empty: Color.lerp(empty, other.empty, t)!,
      selected: Color.lerp(selected, other.selected, t)!,
    );
  }
}
