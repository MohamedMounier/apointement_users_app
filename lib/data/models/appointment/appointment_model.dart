import 'package:appointment_users/core/converters/appointment_state_json_converter.dart';
import 'package:appointment_users/core/converters/timestamp_converter.dart';
import 'package:appointment_users/core/utils/enums/app_enums.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/appointment/appointment_entity.dart';

part 'appointment_model.g.dart';

@JsonSerializable()
class AppointmentModel {
  final String id;
  final String userId;
  final String specialistId;
  final String userName;
  final String specialistName;
  final String? specialistBio;
  @JsonKey(name: 'current_booked_date')
  @TimestampConverter()
  final Timestamp currentBookedDate;
  @AppointmentStatusJsonConverter()
  final AppointmentStatus status;
  @JsonKey(name: 'reschedule_requested_date')
  @TimestampConverter()
  final Timestamp? rescheduleRequestedDate;
  @JsonKey(name: 'created_at')
  @TimestampConverter()
  final Timestamp createdAt;

  AppointmentModel({
    required this.id,
    required this.userId,
    required this.specialistId,
    required this.currentBookedDate,
    required this.status,
    required this.createdAt,
    required this.userName,
    required this.specialistName,
    this.rescheduleRequestedDate,
    this.specialistBio,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) =>
      _$AppointmentModelFromJson(json);

  Map<String, dynamic> toJson() => _$AppointmentModelToJson(this);

  AppointmentEntity toEntity() => AppointmentEntity(
    id: id,
    userId: userId,
    specialistId: specialistId,
    currentBookedDate: currentBookedDate.toDate(),
    status: status,
    specialistBio: specialistBio,
    specialistName: specialistName,
    userName: userName,
    rescheduleRequestedDate: rescheduleRequestedDate?.toDate(),
    createdAt: createdAt.toDate(),
  );
}
