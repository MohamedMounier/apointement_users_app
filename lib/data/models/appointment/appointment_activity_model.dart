import 'package:appointment_users/core/converters/timestamp_converter.dart';
import 'package:appointment_users/data/models/enums/models_enums.dart';
import 'package:appointment_users/domain/entities/appointment/appointment_activity_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'appointment_activity_model.g.dart';

@JsonSerializable()
class AppointmentActivityModel {
  @JsonKey(name: 'appointment_id')
  final String appointmentId;
  @JsonKey(name: 'user_id')
  final String userId;
  @JsonKey(name: 'specialist_id')
  final String specialistId;
  final String? reason;
  @JsonKey(name: 'is_admin_reason')
  final bool isAdminReason;
  @TimestampConverter()
  @JsonKey(name: 'current_booked_date')
  final Timestamp currentBookedDate;
  @JsonKey(name: 'old_booked_date')
  @TimestampConverter()
  final Timestamp? oldBookedDate;
  final AppointmentStatus status;
  @JsonKey(name: 'created_at')
  @TimestampConverter()
  final Timestamp? createdAt;

  AppointmentActivityModel({
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

  factory AppointmentActivityModel.fromJson(Map<String, dynamic> json) =>
      _$AppointmentActivityModelFromJson(json);

  Map<String, dynamic> toJson() => _$AppointmentActivityModelToJson(this);

  AppointmentActivityEntity toEntity() => AppointmentActivityEntity(
    appointmentId: appointmentId,
    userId: userId,
    specialistId: specialistId,
    isAdminReason: isAdminReason,
    status: status,
    oldBookedDate: oldBookedDate?.toDate() ?? DateTime.now(),
    currentBookedDate: currentBookedDate.toDate(),
    createdAt: createdAt?.toDate(),
    reason: reason,
  );
}
