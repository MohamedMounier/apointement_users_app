import 'package:appointment_users/core/utils/enums/app_enums.dart';
import 'package:appointment_users/core/utils/extensions/enums_extensions.dart';
import 'package:appointment_users/data/data_source/remote/appointments__data_source.dart';
import 'package:appointment_users/data/models/appointment/appointment_activity_model.dart';
import 'package:appointment_users/data/models/appointment/appointment_model.dart';
import 'package:appointment_users/data/models/response_models/response_wrapper.dart';
import 'package:appointment_users/domain/entities/appointment/appointment_activity_entity.dart';
import 'package:appointment_users/domain/entities/appointment/appointment_entity.dart';
import 'package:appointment_users/domain/repository/appointments/appointment_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AppointmentsRepository)
class AppointmentsRepositoryImpl implements AppointmentsRepository {
  final AppointmentsDataSource _dataSource;

  AppointmentsRepositoryImpl(this._dataSource);

  @override
  Future<ResponseWrapper<List<AppointmentEntity>>> getAppointmentsForSpecialist(
    String specialistId,
  ) async {
    final response = await _dataSource.fetchAvailableAppointmentsForSpecialist(
      specialistId: specialistId,
    );

    return response.when(
      success:
          (models) =>
              ResponseWrapper.success(models.map((m) => m.toEntity()).toList()),
      failure: ResponseWrapper.failure,
    );
  }

  @override
  Future<ResponseWrapper<List<AppointmentActivityEntity>>> getAppointmentActivitiesByAppointmentId(
      {required String appointmentId}
      ) async {
    final response = await _dataSource.fetchAppointmentActivitiesByAppointmentId(
      appointmentId: appointmentId,
    );

    return response.when(
      success:
          (models) =>
          ResponseWrapper.success(models.map((m) => m.toEntity()).toList()),
      failure: ResponseWrapper.failure,
    );
  }
  @override
  Future<ResponseWrapper<List<AppointmentEntity>>> getAppointmentsForUser(
    String userId,
  ) async {
    final response = await _dataSource.fetchAppointmentsForUser(userId: userId);

    return response.when(
      success:
          (models) =>
              ResponseWrapper.success(models.map((m) => m.toEntity()).toList()),
      failure: ResponseWrapper.failure,
    );
  }

  @override
  Future<ResponseWrapper<void>> bookAppointment(
    AppointmentEntity appointment,
  ) async {
    final model = AppointmentModel(
      id: appointment.id,
      userId: appointment.userId,
      specialistId: appointment.specialistId,
      currentBookedDate: Timestamp.fromDate(appointment.currentBookedDate),
      status: appointment.status,
      specialistName: appointment.specialistName,
      userName: appointment.userName,
      specialistBio: appointment.specialistBio,
      rescheduleRequestedDate:
          appointment.rescheduleRequestedDate != null
              ? Timestamp.fromDate(appointment.rescheduleRequestedDate!)
              : null,
      createdAt: Timestamp.fromDate(appointment.createdAt),
    );

    return _dataSource.bookAppointment(appointment: model);
  }

  @override
  Future<ResponseWrapper<void>> updateAppointmentStatus({
    required String appointmentId,
    DateTime? newBookedDate,
    required AppointmentStatus newAppointmentStatus,
  }) async {

    return _dataSource.updateAppointmentStatus(
      appointmentId: appointmentId,
      newBookedDate: newBookedDate,
      newAppointmentStatus: newAppointmentStatus.statusName,
    );
  }

  @override
  Future<ResponseWrapper<void>> addAppointmentActivity({
    required AppointmentActivityEntity appointmentActivityEntity,
  }) async {
    final model = AppointmentActivityModel(
      appointmentId: appointmentActivityEntity.appointmentId,
      userId: appointmentActivityEntity.userId,
      specialistId: appointmentActivityEntity.specialistId,
      currentBookedDate: Timestamp.fromDate(
        appointmentActivityEntity.currentBookedDate,
      ),
      status: appointmentActivityEntity.status,
      oldBookedDate: Timestamp.fromDate(
        appointmentActivityEntity.oldBookedDate,
      ),
      isAdminReason: false,
      addedByType: UserTypes.user,
      reason: appointmentActivityEntity.reason,
      createdAt: Timestamp.fromDate(
        appointmentActivityEntity.createdAt ?? DateTime.now(),
      ),
      userName: appointmentActivityEntity.userName,
      specialistName: appointmentActivityEntity.specialistName
    );

    return _dataSource.addAppointmentActivity(appointmentActivityModel: model);
  }
}
