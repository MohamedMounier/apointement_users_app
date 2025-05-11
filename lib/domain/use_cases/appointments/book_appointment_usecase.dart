import 'package:appointment_users/data/models/response_models/response_wrapper.dart';
import 'package:appointment_users/domain/entities/appointment/appointment_activity_entity.dart';
import 'package:appointment_users/domain/entities/appointment/appointment_entity.dart';
import 'package:appointment_users/domain/repository/appointments/appointment_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class BookAppointmentUseCase {
  final AppointmentsRepository repository;

  BookAppointmentUseCase(this.repository);

  Future<ResponseWrapper<void>> call(AppointmentEntity appointment) async {
    final result = await repository.bookAppointment(appointment);
    return result.when(
      success: (val) async {
        return await repository.addAppointmentActivity(
          appointmentActivityEntity: AppointmentActivityEntity(
            appointmentId: appointment.id,
            userId: appointment.userId,
            specialistId: appointment.specialistId,
            isAdminReason: false,
            status: appointment.status,
            userName: appointment.userName,
            specialistName: appointment.specialistName,
            oldBookedDate: appointment.currentBookedDate,
            currentBookedDate: appointment.currentBookedDate,
          ),
        );
      },
      failure: (failure) {
        return ResponseWrapper.failure(failure);
      },
    );
  }
}
