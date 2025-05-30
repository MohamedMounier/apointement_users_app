import 'package:appointment_users/core/utils/enums/app_enums.dart';
import 'package:appointment_users/data/models/appointment/appointment_activity_model.dart';
import 'package:appointment_users/data/models/appointment/appointment_model.dart';
import 'package:appointment_users/data/models/response_models/response_wrapper.dart';
import 'package:appointment_users/domain/entities/appointment/appointment_activity_entity.dart';
import 'package:appointment_users/domain/entities/appointment/appointment_entity.dart';

abstract class AppointmentsRepository {
  Future<ResponseWrapper<List<AppointmentEntity>>> getAppointmentsForSpecialist(
    String specialistId,
  );
  Future<ResponseWrapper<List<AppointmentEntity>>> getAppointmentsForUser(
      String userId
      );
  Future<ResponseWrapper<List<AppointmentActivityEntity>>> getAppointmentActivitiesByAppointmentId(
  {required String appointmentId}
      );
  Future<ResponseWrapper<void>> bookAppointment(AppointmentEntity appointment);
  Future<ResponseWrapper<void>>updateAppointmentStatus({
    required String appointmentId,
     DateTime? newBookedDate,
    required AppointmentStatus newAppointmentStatus
  });
  Future<ResponseWrapper<void>> addAppointmentActivity({
    required AppointmentActivityEntity appointmentActivityEntity,
  });
}
