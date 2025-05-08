// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specialist_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpecialistModel _$SpecialistModelFromJson(Map<String, dynamic> json) =>
    SpecialistModel(
      id: json['id'] as String,
      name: json['name'] as String,
      specialization: json['specialization'] as String,
      availableDays:
          (json['availableDays'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
      availableTimes:
          (json['availableTimes'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
      bio: json['bio'] as String?,
    );

Map<String, dynamic> _$SpecialistModelToJson(SpecialistModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'specialization': instance.specialization,
      'availableDays': instance.availableDays,
      'availableTimes': instance.availableTimes,
      'bio': instance.bio,
    };
