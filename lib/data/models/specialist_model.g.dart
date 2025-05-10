// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specialist_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpecialistModel _$SpecialistModelFromJson(Map<String, dynamic> json) =>
    SpecialistModel(
      id: json['id'] as String,
      name: json['name'] as String,
      category: json['category'] as String,
      availableDays:
          (json['available_days'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
      availableTimes:
          (json['available_times'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
      createdAt: const TimestampConverter().fromJson(
        json['created_at'] as Object,
      ),
      bio: json['bio'] as String?,
    );

Map<String, dynamic> _$SpecialistModelToJson(SpecialistModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category': instance.category,
      'available_days': instance.availableDays,
      'available_times': instance.availableTimes,
      'bio': instance.bio,
      'created_at': const TimestampConverter().toJson(instance.createdAt),
    };
