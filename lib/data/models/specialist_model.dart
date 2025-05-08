import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/specialist_entity.dart';

part 'specialist_model.g.dart';

@JsonSerializable()
class SpecialistModel {
  final String id;
  final String name;
  final String specialization;
  final List<String> availableDays;
  final List<String> availableTimes;
  final String? bio;

  SpecialistModel({
    required this.id,
    required this.name,
    required this.specialization,
    required this.availableDays,
    required this.availableTimes,
    this.bio,
  });

  factory SpecialistModel.fromJson(Map<String, dynamic> json) => _$SpecialistModelFromJson(json);
  Map<String, dynamic> toJson() => _$SpecialistModelToJson(this);

  SpecialistEntity toEntity() => SpecialistEntity(
    id: id,
    name: name,
    specialization: specialization,
    availableDays: availableDays,
    availableTimes: availableTimes,
    bio: bio,
  );
}