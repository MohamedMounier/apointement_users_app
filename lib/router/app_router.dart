import 'package:appointment_users/presentation/screens/home/home_layout.dart';
import 'package:appointment_users/presentation/screens/login/login_mobile_screen.dart';
import 'package:appointment_users/presentation/screens/sign_up/sign_up_mobile_screen.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'router_name.dart';

@singleton
class AppRouter {
  const AppRouter();

  Route<dynamic>? onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RouterName.login:
        return MaterialPageRoute(builder: (_) => LoginScreen(),settings: settings);
      case RouterName.home:
        return MaterialPageRoute(builder: (_) => HomeLayout(),settings: settings);
      case RouterName.signUp:
        return MaterialPageRoute(builder: (_) => SignUpScreen(),settings: settings);

      default:
        return null;
    }

  }

  String fetchInitialRoute() {
    return RouterName.home;
  }
}
