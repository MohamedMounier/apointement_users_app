import 'package:injectable/injectable.dart';
import 'app_router_helper.dart';
import 'router_name.dart';

@singleton
class ScreenRouterHelper {
  final AppRouterHelper _router;

  const ScreenRouterHelper(this._router);

  Future<void> navigateToLogin() => _router.pushNamed(RouterName.login);
  Future<void> navigateToSignUp() => _router.pushNamed(RouterName.signUp);
  void navigateToHome() => _router.popUntil(RouterName.home);
}
