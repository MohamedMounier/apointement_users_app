// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_activity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppointmentActivityModel _$AppointmentActivityModelFromJson(
  Map<String, dynamic> json,
) => AppointmentActivityModel(
  appointmentId: json['appointment_id'] as String,
  userId: json['user_id'] as String,
  specialistId: json['specialist_id'] as String,
  isAdminReason: json['is_admin_reason'] as bool,
  status: $enumDecode(_$AppointmentStatusEnumMap, json['status']),
  oldBookedDate: _$JsonConverterFromJson<Object, Timestamp>(
    json['old_booked_date'],
    const TimestampConverter().fromJson,
  ),
  currentBookedDate: const TimestampConverter().fromJson(
    json['current_booked_date'] as Object,
  ),
  createdAt: _$JsonConverterFromJson<Object, Timestamp>(
    json['created_at'],
    const TimestampConverter().fromJson,
  ),
  reason: json['reason'] as String?,
);

Map<String, dynamic> _$AppointmentActivityModelToJson(
  AppointmentActivityModel instance,
) => <String, dynamic>{
  'appointment_id': instance.appointmentId,
  'user_id': instance.userId,
  'specialist_id': instance.specialistId,
  'reason': instance.reason,
  'is_admin_reason': instance.isAdminReason,
  'current_booked_date': const TimestampConverter().toJson(
    instance.currentBookedDate,
  ),
  'old_booked_date': _$JsonConverterToJson<Object, Timestamp>(
    instance.oldBookedDate,
    const TimestampConverter().toJson,
  ),
  'status': _$AppointmentStatusEnumMap[instance.status]!,
  'created_at': _$JsonConverterToJson<Object, Timestamp>(
    instance.createdAt,
    const TimestampConverter().toJson,
  ),
};

const _$AppointmentStatusEnumMap = {
  AppointmentStatus.pending: 'pending',
  AppointmentStatus.confirmed: 'confirmed',
  AppointmentStatus.cancelled: 'cancelled',
  AppointmentStatus.pendingAvailability: 'pendingAvailability',
  AppointmentStatus.underReview: 'underReview',
  AppointmentStatus.requestedReschedule: 'requestedReschedule',
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
