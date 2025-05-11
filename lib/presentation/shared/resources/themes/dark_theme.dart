import 'package:flutter/material.dart';

import 'dark_colors.dart';

class DarkTheme {
  static ThemeData get theme => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: DarkColors.primary,
    scaffoldBackgroundColor: DarkColors.scaffoldBackground,
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: DarkColors.primary,
      onPrimary: Colors.white,
      secondary: DarkColors.secondary,
      onSecondary: Colors.white,
      error: DarkColors.error,
      onError: Colors.white,
      background: DarkColors.scaffoldBackground,
      onBackground: DarkColors.onBackground,
      surface: DarkColors.surface,
      onSurface: DarkColors.onSurface,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: DarkColors.appBarBackground,
      foregroundColor: DarkColors.onBackground,
      elevation: 0,
      centerTitle: true,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: DarkColors.primary,
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: DarkColors.inputFillColor,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      hintStyle: TextStyle(color: DarkColors.hintColor),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: DarkColors.inputBorderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: DarkColors.primary),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: DarkColors.error),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: DarkColors.error),
      ),
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        color: DarkColors.onBackground,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: TextStyle(
        color: DarkColors.onBackground,
        fontWeight: FontWeight.bold,
      ),
      displaySmall: TextStyle(
        color: DarkColors.onBackground,
        fontWeight: FontWeight.bold,
      ),
      headlineLarge: TextStyle(
        color: DarkColors.onBackground,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: TextStyle(
        color: DarkColors.onBackground,
        fontWeight: FontWeight.bold,
      ),
      headlineSmall: TextStyle(
        color: DarkColors.onBackground,
        fontWeight: FontWeight.w600,
      ),
      titleLarge: TextStyle(
        color: DarkColors.onBackground,
        fontWeight: FontWeight.w600,
      ),
      titleMedium: TextStyle(
        color: DarkColors.onSurfaceVariant,
        fontWeight: FontWeight.w500,
      ),
      titleSmall: TextStyle(
        color: DarkColors.onSurfaceVariant,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: TextStyle(color: DarkColors.onBackground),
      bodyMedium: TextStyle(color: DarkColors.onSurfaceVariant),
      bodySmall: TextStyle(color: DarkColors.onSurfaceVariant),
      labelLarge: TextStyle(
        color: DarkColors.onBackground,
        fontWeight: FontWeight.w500,
      ),
      labelMedium: TextStyle(color: DarkColors.onSurfaceVariant),
      labelSmall: TextStyle(color: DarkColors.onSurfaceVariant),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: DarkColors.surface,
      selectedItemColor: DarkColors.primary,
      unselectedItemColor: DarkColors.onSurfaceVariant,
    ),
    dividerTheme: DividerThemeData(color: DarkColors.divider, thickness: 1),
  );
}
