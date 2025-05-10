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
      currentBookedDate: const TimestampConverter().fromJson(
        json['current_booked_date'] as Object,
      ),
      status: $enumDecode(_$AppointmentStatusEnumMap, json['status']),
      createdAt: const TimestampConverter().fromJson(
        json['created_at'] as Object,
      ),
      rescheduleRequestedDate: _$JsonConverterFromJson<Object, Timestamp>(
        json['reschedule_requested_date'],
        const TimestampConverter().fromJson,
      ),
    );

Map<String, dynamic> _$AppointmentModelToJson(AppointmentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'specialistId': instance.specialistId,
      'current_booked_date': const TimestampConverter().toJson(
        instance.currentBookedDate,
      ),
      'status': _$AppointmentStatusEnumMap[instance.status]!,
      'reschedule_requested_date': _$JsonConverterToJson<Object, Timestamp>(
        instance.rescheduleRequestedDate,
        const TimestampConverter().toJson,
      ),
      'created_at': const TimestampConverter().toJson(instance.createdAt),
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
