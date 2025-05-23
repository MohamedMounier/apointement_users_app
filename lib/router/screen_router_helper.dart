import 'package:appointment_users/domain/entities/appointment/appointment_entity.dart';
import 'package:appointment_users/domain/entities/specialist_entity.dart';
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
  Future<void> navigateToBookAppointmentScreen({required SpecialistEntity specialist}) => _router.pushNamed(RouterName.bookAppointment,arguments: specialist);
  Future<void> navigateToEditAppointmentScreen({required AppointmentEntity appointmentEntity}) => _router.pushNamed(RouterName.editAppointment,arguments: appointmentEntity);
}
