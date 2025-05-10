import 'package:appointment_users/domain/entities/specialization_category_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'specialization_category_model.g.dart';

@JsonSerializable()
class SpecializationCategoryModel {
  final String id;
  final String name;

  SpecializationCategoryModel({required this.id, required this.name});

  factory SpecializationCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$SpecializationCategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$SpecializationCategoryModelToJson(this);

  SpecializationCategoryEntity toEntity() =>
      SpecializationCategoryEntity(id: id, name: name);
}
