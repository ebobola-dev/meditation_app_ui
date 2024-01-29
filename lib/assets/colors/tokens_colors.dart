import 'package:flutter/material.dart';
import 'package:meditation_app_ui/assets/colors/primary_colors.dart';

class TokenColors {
  final Color light;
  final Color dark;

  TokenColors({
    required this.light,
    required this.dark,
  });
}

final tokensBackground = TokenColors(
  light: Colors.white,
  dark: GrayscaleColor.c900,
);
final tokensPrimaryBase = TokenColors(
  light: PrimaryColors.base_,
  dark: PrimaryColors.base_,
);
final tokensPrimary100 = TokenColors(
  light: PrimaryColors.c100,
  dark: GrayscaleColor.c400,
);
final tokensStroke = TokenColors(
  light: GrayscaleColor.c300,
  dark: const Color(0xFFCDB5E1).withOpacity(0),
);

class TextColors {
  static final secondary = TokenColors(
    light: SecondaryColors.base_,
    dark: Colors.white,
  );
  static final black = TokenColors(
    light: GrayscaleColor.c900,
    dark: Colors.white,
  );
  static final body = TokenColors(
    light: GrayscaleColor.c500,
    dark: Colors.white,
  );
  static final bodyLight = TokenColors(
    light: GrayscaleColor.c400,
    dark: Colors.white,
  );
}

class InputColors {
  static final field = TokenColors(
    light: GrayscaleColor.c100,
    dark: GrayscaleColor.c700,
  );
  static final label = TokenColors(
    light: GrayscaleColor.c400,
    dark: GrayscaleColor.c400,
  );
  static final icon = TokenColors(
    light: GrayscaleColor.c500,
    dark: GrayscaleColor.c500,
  );
}

class OtherColors {
  static final primaryToWhite = TokenColors(
    light: PrimaryColors.base_,
    dark: Colors.white,
  );
  static final secondaryToPrimary = TokenColors(
    light: SecondaryColors.base_,
    dark: PrimaryColors.base_,
  );
  static final whiteToSecondary = TokenColors(
    light: Colors.white,
    dark: SecondaryColors.base_,
  );
  static final whiteToPrimary = TokenColors(
    light: Colors.white,
    dark: PrimaryColors.base_,
  );
  static final empty = TokenColors(
    light: GrayscaleColor.c100,
    dark: GrayscaleColor.c500,
  );
  static final selected = TokenColors(
    light: SecondaryColors.base_,
    dark: SecondaryColors.c400,
  );
}
