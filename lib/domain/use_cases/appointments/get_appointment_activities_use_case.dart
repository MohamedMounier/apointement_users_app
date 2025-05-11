import 'package:appointment_users/core/network/error/local_error_model.dart';
import 'package:appointment_users/data/models/response_models/response_wrapper.dart';
import 'package:appointment_users/domain/entities/appointment/appointment_activity_entity.dart';
import 'package:appointment_users/domain/repository/appointments/appointment_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetAppointmentActivitiesUseCase {
  final AppointmentsRepository _appointmentsRepository;

  GetAppointmentActivitiesUseCase(this._appointmentsRepository);

  Future<ResponseWrapper<List<AppointmentActivityEntity>>> call({
    required String appointmentId,
  }) async {
    try {
      return await _appointmentsRepository
          .getAppointmentActivitiesByAppointmentId(
            appointmentId: appointmentId,
          );
    } catch (error) {
      return ResponseWrapper.failure(
        LocalErrorModel(message: error.toString()),
      );
    }
  }
}
