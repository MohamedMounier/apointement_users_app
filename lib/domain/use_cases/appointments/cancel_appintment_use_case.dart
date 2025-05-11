import 'package:appointment_users/core/network/error/local_error_model.dart';
import 'package:appointment_users/core/utils/enums/app_enums.dart';
import 'package:appointment_users/data/models/response_models/response_wrapper.dart';
import 'package:appointment_users/domain/entities/appointment/appointment_activity_entity.dart';
import 'package:appointment_users/domain/entities/appointment/appointment_entity.dart';
import 'package:appointment_users/domain/repository/appointments/appointment_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CancelAppointmentUseCase {
  final AppointmentsRepository repository;

  CancelAppointmentUseCase(this.repository);

  Future<ResponseWrapper<void>> call(
    (AppointmentEntity, String?) appointmentWithReason,
  ) async {
    final appointment = appointmentWithReason.$1;
    if (appointment.isCancellable) {
      final result = await repository.addAppointmentActivity(
        appointmentActivityEntity: AppointmentActivityEntity(
          appointmentId: appointment.id,
          userId: appointment.userId,
          specialistId: appointment.specialistId,
          isAdminReason: false,
          reason: appointmentWithReason.$2,
          status: AppointmentStatus.cancelled,
          specialistName: appointment.specialistName,
          userName: appointment.userName,
          oldBookedDate: appointment.currentBookedDate,
          currentBookedDate: appointment.currentBookedDate,
          createdAt: DateTime.now()
        ),
      );
      return result.when(
        success: (val) async {
          return await repository.updateAppointmentStatus(
            appointmentId: appointment.id,
            newAppointmentStatus: AppointmentStatus.cancelled,
          );
        },
        failure: (failure) {
          return ResponseWrapper.failure(failure);
        },
      );
    } else {
      return ResponseWrapper.failure(
        LocalErrorModel(
          message: "Unfortunately Your Appointment can't be cancelled now !",
        ),
      );
    }
  }
}
