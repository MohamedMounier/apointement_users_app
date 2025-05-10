import 'package:appointment_users/core/utils/enums/app_enums.dart';

class AppointmentEntity {
  final String id;
  final String userId;
  final String specialistId;
  final AppointmentStatus status;
  final DateTime currentBookedDate;

  final DateTime? rescheduleRequestedDate;
  final DateTime createdAt;

  AppointmentEntity({
    required this.id,
    required this.userId,
    required this.specialistId,
    required this.status,
    required this.currentBookedDate,
    required this.createdAt,

    this.rescheduleRequestedDate,
  });

  bool get isCancellable =>
      status == AppointmentStatus.confirmed &&
      currentBookedDate.difference(DateTime.now()).inHours >= 2;

  bool get canRequestReschedule =>
      status == AppointmentStatus.confirmed ||
      status == AppointmentStatus.pending;

  String get statusLabel {
    switch (status) {
      case AppointmentStatus.pending:
        return 'Pending';
      case AppointmentStatus.confirmed:
        return 'Confirmed';
      case AppointmentStatus.cancelled:
        return 'Cancelled';
      case AppointmentStatus.underReview:
        return 'Under Review';
      case AppointmentStatus.pendingAvailability:
        return 'Pending Availability';
      case AppointmentStatus.requestedReschedule:
        return 'Reschedule Requested';
    }
  }
}
