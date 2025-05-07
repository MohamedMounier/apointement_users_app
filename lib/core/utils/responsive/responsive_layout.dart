import 'package:appointment_users/core/utils/resources/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

 // iPad Pro 11"

class ResponsiveLayout {
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < AppConstants.mobileMaxDesignValue;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= AppConstants.mobileMaxDesignValue &&
          MediaQuery.of(context).size.width < AppConstants.tabletMaxDesignValue;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= AppConstants.tabletMaxDesignValue;

  /// Returns the appropriate design size for the current layout
  static Size getDesignSize(BuildContext context) {
    if (isMobile(context)) {
      return AppConstants.designMobileSize;
    } else {
      return AppConstants.designTabletSize;
    }
  }

  /// Wrap your `MaterialApp` in this to initialize `ScreenUtil`
  static Widget builder({
    required Widget Function(BuildContext, Widget?) builder,
  }) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final designSize = getDesignSize(context);
        return ScreenUtilInit(
          designSize: designSize,
          minTextAdapt: true,
          splitScreenMode: true,
          builder: builder,
        );
      },
    );
  }
}
