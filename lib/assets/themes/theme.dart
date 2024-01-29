import 'package:flutter/material.dart';
import 'package:meditation_app_ui/assets/colors/theme_colors.dart';
import 'package:meditation_app_ui/assets/fonts/default_font.dart';

ThemeData getThemeData(BuildContext context, {bool isDark = false}) {
  if (isDark) {
    return copyThemeData(ThemeData.dark(), darkThemeColors);
  }
  return copyThemeData(ThemeData.light(), lightThemeColors);
}

ThemeData copyThemeData(ThemeData data, ThemeColors themeColors) {
  return data.copyWith(
    extensions: [
      themeColors.tokenColors,
      themeColors.textColors,
      themeColors.inputColors,
      themeColors.otherColors,
    ],
    iconTheme: IconThemeData(color: themeColors.icon),
    colorScheme: ColorScheme.light(
      background: themeColors.backgroundColor,
      primary: ThemeColors.primary,
      secondary: ThemeColors.secondary,
    ),
    textTheme: const TextTheme(
      //* ------ Heading 1-6 ---------
      titleLarge: TextStyle(
        fontSize: 48.0,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        fontSize: 40.0,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: TextStyle(
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
      ),
      displayLarge: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
      displaySmall: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
      ),
      //* ------ Body Xlarge, Large, Medium, Small, XSmall ---------
      headlineLarge: TextStyle(
        fontSize: 18.0,
      ), //? XLarge
      bodyLarge: TextStyle(
        fontSize: 16.0,
      ),
      bodyMedium: TextStyle(
        fontSize: 14.0,
      ),
      bodySmall: TextStyle(
        fontSize: 12.0,
      ),
      headlineSmall: TextStyle(
        fontSize: 10.0,
      ), //? XSmall
    ).apply(
      fontFamily: defaultFont,
      bodyColor: themeColors.textColors.black,
      displayColor: themeColors.textColors.black,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        padding: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 16.0,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        textStyle: const TextStyle(
          color: Colors.white,
          fontFamily: defaultFont,
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      shape: const CircleBorder(),
      side: BorderSide(color: themeColors.textColors.bodyLight),
      fillColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return ThemeColors.primary;
        }
        return null;
      }),
    ),
  );
}
