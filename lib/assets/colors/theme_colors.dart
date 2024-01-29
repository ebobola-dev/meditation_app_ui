import 'package:flutter/material.dart';
import 'package:meditation_app_ui/assets/colors/ext_colors.dart';
import 'package:meditation_app_ui/assets/colors/tokens_colors.dart';

class ThemeColors {
  final TokenExtColors tokenColors;
  final TextExtColors textColors;
  final InputExtColors inputColors;
  final OtherExtColors otherColors;

  final Color backgroundColor;
  static const Color primary = Color(0xFF22C55E);
  static const Color secondary = Color(0xFF03314B);
  final Color icon;
  static const Color divider = Color(0xFFF1F5F9);
  static const Color buttonColor1 = Color(0xFF1DAC92);
  static const Color buttonColor2 = Color(0xFF228E8E);

  ThemeColors({
    required this.tokenColors,
    required this.textColors,
    required this.inputColors,
    required this.otherColors,
    required this.backgroundColor,
    required this.icon,
  });
}

final lightThemeColors = ThemeColors(
  backgroundColor: tokensBackground.light,
  icon: TextColors.black.light,
  tokenColors: TokenExtColors(
    tokensPrimaryBase: tokensPrimaryBase.light,
    tokensPrimary100: tokensPrimary100.light,
    tokensStroke: tokensStroke.light,
  ),
  textColors: TextExtColors(
    secondary: TextColors.secondary.light,
    black: TextColors.black.light,
    body: TextColors.body.light,
    bodyLight: TextColors.bodyLight.light,
  ),
  inputColors: InputExtColors(
    field: InputColors.field.light,
    label: InputColors.label.light,
    icon: InputColors.icon.light,
  ),
  otherColors: OtherExtColors(
    primaryToWhite: OtherColors.primaryToWhite.light,
    secondaryToPrimary: OtherColors.secondaryToPrimary.light,
    whiteToSecondary: OtherColors.whiteToSecondary.light,
    whiteToPrimary: OtherColors.whiteToPrimary.light,
    empty: OtherColors.empty.light,
    selected: OtherColors.selected.light,
  ),
);

final darkThemeColors = ThemeColors(
  backgroundColor: tokensBackground.dark,
  icon: TextColors.black.dark,
  tokenColors: TokenExtColors(
    tokensPrimaryBase: tokensPrimaryBase.dark,
    tokensPrimary100: tokensPrimary100.dark,
    tokensStroke: tokensStroke.dark,
  ),
  textColors: TextExtColors(
    secondary: TextColors.secondary.dark,
    black: TextColors.black.dark,
    body: TextColors.body.dark,
    bodyLight: TextColors.bodyLight.dark,
  ),
  inputColors: InputExtColors(
    field: InputColors.field.dark,
    label: InputColors.label.dark,
    icon: InputColors.icon.dark,
  ),
  otherColors: OtherExtColors(
    primaryToWhite: OtherColors.primaryToWhite.dark,
    secondaryToPrimary: OtherColors.secondaryToPrimary.dark,
    whiteToSecondary: OtherColors.whiteToSecondary.dark,
    whiteToPrimary: OtherColors.whiteToPrimary.dark,
    empty: OtherColors.empty.dark,
    selected: OtherColors.selected.dark,
  ),
);
