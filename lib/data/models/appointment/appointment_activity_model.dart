import 'package:appointment_users/core/converters/appointment_state_json_converter.dart';
import 'package:appointment_users/core/converters/timestamp_converter.dart';
import 'package:appointment_users/core/converters/user_types_json_converter.dart';
import 'package:appointment_users/core/utils/enums/app_enums.dart';
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
  final String specialistId;
  @UserTypesJsonConverter()
  final UserTypes addedByType;
  final String? reason;
  @JsonKey(name: 'is_admin_reason')
  final bool isAdminReason;
  @TimestampConverter()
  @JsonKey(name: 'current_booked_date')
  final Timestamp currentBookedDate;
  @JsonKey(name: 'old_booked_date')
  @TimestampConverter()
  final Timestamp? oldBookedDate;
  @AppointmentStatusJsonConverter()
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
    required this.addedByType,
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
