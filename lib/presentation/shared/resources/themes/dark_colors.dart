import 'package:flutter/material.dart';

import '../app_colors.dart';

class DarkColors {
  static Color primary = AppColors.primary;
  static Color secondary = AppColors.buttonOrangeBg;
  static Color scaffoldBackground = const Color(0xFF121212);
  static Color appBarBackground = const Color(0xFF1E1E1E);
  static Color surface = const Color(0xFF1E1E1E);
  static Color error = AppColors.errorColor;

  static Color onBackground = Colors.white;
  static Color onSurface = Colors.white;
  static Color onSurfaceVariant = Colors.white70;
  static Color onPrimary = Colors.white;

  static Color cardBackground = const Color(0xFF2C2C2C);
  static Color divider = Colors.white12;
  static Color inputFillColor = const Color(0xFF2C2C2C);
  static Color inputBorderColor = Colors.white24;
  static Color hintColor = Colors.white38;

  // Status colors
  static Color pendingColor = AppColors.pendingColor.withValues(alpha: 0.8);
  static Color approvedColor = AppColors.approvedColor.withValues(alpha: 0.8);
  static Color rejectedColor = AppColors.rejectedColor.withValues(alpha: 0.8);
  static Color greenStatus = AppColors.greenStatus.withValues(alpha: 0.8);
  static Color darkBlueStatus = AppColors.darkBlueStatus.withValues(alpha: 0.8);
  static Color orangeStatus = AppColors.orangeStatus.withValues(alpha: 0.8);
  static Color purpleStatus = AppColors.purpleStatus.withValues(alpha: 0.8);
}
