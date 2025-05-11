import 'package:flutter/material.dart';
import 'dark_theme.dart';
import 'light_theme.dart';

class AppTheme {
  static ThemeData light = LightTheme.theme;
  static ThemeData dark = DarkTheme.theme;

  // Helper methods to access theme
  static ThemeData getTheme(bool isLight) => isLight ? light : dark;
  //
  // // Add theme mode change listener
  // static final ValueNotifier<ThemeMode> themeNotifier =
  // ValueNotifier(ThemeMode.system);
  //
  // // Methods to change theme mode
  // static void setLightMode() => themeNotifier.value = ThemeMode.light;
  // static void setDarkMode() => themeNotifier.value = ThemeMode.dark;
  // static void setSystemMode() => themeNotifier.value = ThemeMode.system;

  // // Toggle between light and dark mode
  // static void toggleTheme() {
  //   themeNotifier.value =
  //   themeNotifier.value == ThemeMode.light
  //       ? ThemeMode.dark
  //       : ThemeMode.light;
  // }
}