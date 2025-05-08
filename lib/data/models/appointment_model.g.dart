// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppointmentModel _$AppointmentModelFromJson(Map<String, dynamic> json) =>
    AppointmentModel(
      id: json['id'] as String,
      userId: json['userId'] as String,
      specialistId: json['specialistId'] as String,
      dateTime: DateTime.parse(json['dateTime'] as String),
      status: $enumDecode(_$AppointmentStatusEnumMap, json['status']),
      rescheduleRequestedFor:
          json['rescheduleRequestedFor'] == null
              ? null
              : DateTime.parse(json['rescheduleRequestedFor'] as String),
    );

Map<String, dynamic> _$AppointmentModelToJson(
  AppointmentModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'specialistId': instance.specialistId,
  'dateTime': instance.dateTime.toIso8601String(),
  'status': _$AppointmentStatusEnumMap[instance.status]!,
  'rescheduleRequestedFor': instance.rescheduleRequestedFor?.toIso8601String(),
};

const _$AppointmentStatusEnumMap = {
  AppointmentStatus.pending: 'pending',
  AppointmentStatus.confirmed: 'confirmed',
  AppointmentStatus.cancelled: 'cancelled',
  AppointmentStatus.requestedReschedule: 'requestedReschedule',
};
