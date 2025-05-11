import 'package:appointment_users/core/utils/enums/app_enums.dart';

class AppointmentEntity {
  final String id;
  final String userId;
  final String specialistId;
  final String specialistName;
  final String userName;
  final String? specialistBio;
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
    required this.specialistName,
    required this.userName,

    this.rescheduleRequestedDate,
    this.specialistBio,
  });

  bool get isCancellable =>
      status == AppointmentStatus.confirmed &&
      currentBookedDate.difference(DateTime.now()).inHours >= 2;
  bool get isAbleToReschedule =>
      canRequestReschedule&&
          currentBookedDate.difference(DateTime.now()).inHours >= 12;
  bool get canRequestReschedule =>
      status == AppointmentStatus.confirmed ||
      status == AppointmentStatus.pending||status==AppointmentStatus.rescheduled;



  AppointmentEntity copyWith({
    String? id,
    String? userId,
    String? specialistId,
    String? specialistName,
    String? userName,
    String? specialistBio,
    AppointmentStatus? status,
    DateTime? currentBookedDate,
    DateTime? rescheduleRequestedDate,
    DateTime? createdAt,
  }) {
    return AppointmentEntity(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      specialistId: specialistId ?? this.specialistId,
      specialistName: specialistName ?? this.specialistName,
      userName: userName ?? this.userName,
      specialistBio: specialistBio ?? this.specialistBio,
      status: status ?? this.status,
      currentBookedDate: currentBookedDate ?? this.currentBookedDate,
      rescheduleRequestedDate: rescheduleRequestedDate ?? this.rescheduleRequestedDate,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
