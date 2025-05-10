import 'package:appointment_users/core/converters/timestamp_converter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/specialist_entity.dart';

part 'specialist_model.g.dart';

@JsonSerializable()
class SpecialistModel {
  final String id;
  final String name;
  final String category;
  @JsonKey(name: 'available_days')
  final List<String> availableDays;
  @JsonKey(name: 'available_times')
  final List<String> availableTimes;
  final String? bio;
  @JsonKey(name: 'created_at')
  @TimestampConverter()
  final Timestamp createdAt;

  SpecialistModel({
    required this.id,
    required this.name,
    required this.category,
    required this.availableDays,
    required this.availableTimes,
    required this.createdAt,
    this.bio,
  });

  factory SpecialistModel.fromJson(Map<String, dynamic> json) => _$SpecialistModelFromJson(json);
  Map<String, dynamic> toJson() => _$SpecialistModelToJson(this);

  SpecialistEntity toEntity() => SpecialistEntity(
    id: id,
    name: name,
    category: category,
    availableDays: availableDays,
    availableTimes: availableTimes,
    createdAt: createdAt.toDate(),

    bio: bio,
  );
}