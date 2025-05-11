import 'package:appointment_users/core/utils/enums/app_enums.dart';

class AppointmentActivityEntity {
  final String appointmentId;
  final String userId;
  final String specialistId;
  final String? reason;
  final bool isAdminReason;
  final DateTime currentBookedDate;
  final DateTime oldBookedDate;
  final AppointmentStatus status;
  final DateTime? createdAt;

  AppointmentActivityEntity({
    required this.appointmentId,
    required this.userId,
    required this.specialistId,
    required this.isAdminReason,
    required this.status,
    required this.oldBookedDate,
    required this.currentBookedDate,
    this.createdAt,
    this.reason,
  });

  bool get isCancellable =>
      status == AppointmentStatus.confirmed &&
      currentBookedDate.difference(DateTime.now()).inHours >= 2;

  bool get canRequestReschedule =>
      status == AppointmentStatus.confirmed ||
      status == AppointmentStatus.pending;
}
