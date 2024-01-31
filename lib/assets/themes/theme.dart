import 'package:flutter/material.dart';
import 'package:meditation_app_ui/assets/colors/theme_colors.dart';
import 'package:meditation_app_ui/assets/fonts/default_font.dart';
import 'package:meditation_app_ui/assets/styles/button_styles.dart';

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
      ButtonExtStyles(
        elTextStyle: const TextStyle(
          fontSize: 16.0,
          fontFamily: defaultFont,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        alternativeElTextStyle: TextStyle(
          fontSize: 16.0,
          fontFamily: defaultFont,
          color: themeColors.textColors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
    scaffoldBackgroundColor: themeColors.backgroundColor,
    dividerColor: themeColors.divider,
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
      fillColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.selected)) {
            return ThemeColors.primary;
          }
          return null;
        },
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(
        color: themeColors.inputColors.label,
        fontFamily: defaultFont,
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
      ),
      floatingLabelStyle: TextStyle(
        color: themeColors.inputColors.label,
        fontFamily: defaultFont,
        fontSize: 12.0,
        fontWeight: FontWeight.w400,
      ),
      filled: true,
      fillColor: themeColors.inputColors.field,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 18.0,
        vertical: 19.5,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide.none,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 4.0,
        ),
      ),
    ),
  );
}
