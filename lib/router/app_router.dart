import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'router_name.dart';

@singleton
class AppRouter {
  const AppRouter();

  Route<dynamic>? onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RouterName.login:
        return MaterialPageRoute(builder: (_) => Container());

      default:
        return null;
    }
  }
  String fetchInitialRoute() {
    return RouterName.login;
  }

}
