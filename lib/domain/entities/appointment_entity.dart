import 'package:appointment_users/data/models/enums/models_enums.dart';

class AppointmentEntity {
  final String id;
  final String userId;
  final String specialistId;
  final DateTime dateTime;
  final AppointmentStatus status;
  final DateTime? rescheduleRequestedFor;

  AppointmentEntity({
    required this.id,
    required this.userId,
    required this.specialistId,
    required this.dateTime,
    required this.status,
    this.rescheduleRequestedFor,
  });

  bool get isCancellable =>
      status == AppointmentStatus.confirmed &&
      dateTime.difference(DateTime.now()).inHours >= 2;

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
      case AppointmentStatus.requestedReschedule:
        return 'Reschedule Requested';
    }
  }
}
