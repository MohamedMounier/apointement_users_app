
import 'package:appointment_users/data/models/enums/models_enums.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/appointment_entity.dart';

part 'appointment_model.g.dart';

@JsonSerializable()
class AppointmentModel {
  final String id;
  final String userId;
  final String specialistId;
  final DateTime dateTime;
  final AppointmentStatus status;
  final DateTime? rescheduleRequestedFor;

  AppointmentModel({
    required this.id,
    required this.userId,
    required this.specialistId,
    required this.dateTime,
    required this.status,
    this.rescheduleRequestedFor,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) => _$AppointmentModelFromJson(json);
  Map<String, dynamic> toJson() => _$AppointmentModelToJson(this);

  AppointmentEntity toEntity() => AppointmentEntity(
    id: id,
    userId: userId,
    specialistId: specialistId,
    dateTime: dateTime,
    status: status,
    rescheduleRequestedFor: rescheduleRequestedFor,
  );
}

