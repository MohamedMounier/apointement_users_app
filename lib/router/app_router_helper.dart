import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';


@singleton
class AppRouterHelper {
  final GlobalKey<NavigatorState> navigatorKey ;

  AppRouterHelper(this.navigatorKey);

  NavigatorState? get _state => navigatorKey.currentState;

  Future<T?> pushNamed<T extends Object?>(
      String routeName, {
        Object? arguments,
      }) {
    final state = _state;
    if (state == null) return Future.value(null);
    return state.pushNamed<T>(routeName, arguments: arguments);
  }

  Future<T?> push<T extends Object?>(Route<T> route) {
    final state = _state;
    if (state == null) return Future.value(null);
    return state.push(route);
  }

  void pop<T extends Object?>([T? result]) {
    _state?.pop(result);
  }

  bool canPop() => _state?.canPop() ?? false;

  void popUntil(String routeName) {
    _state?.popUntil(ModalRoute.withName(routeName));
  }
}

