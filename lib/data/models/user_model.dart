import 'package:appointment_users/core/converters/user_types_json_converter.dart';
import 'package:appointment_users/core/utils/enums/app_enums.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../core/converters/timestamp_converter.dart';
import '../../domain/entities/user_entity.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String uid;
  final String name;
  @JsonKey(name: 'user_type')
  @UserTypesJsonConverter()
  final UserTypes userType;
  final String email;

  @JsonKey(name: 'created_at')
  @TimestampConverter()
  final Timestamp createdAt;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.userType,
    required this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  UserEntity toEntity() => UserEntity(
    uid: uid,
    name: name,
    userType: userType,
    email: email,
    createdAt: createdAt.toDate(),
  );

  factory UserModel.fromEntity(UserEntity entity) => UserModel(
    uid: entity.uid,
    name: entity.name,
    email: entity.email,
    userType: entity.userType,
    createdAt: Timestamp.fromDate(entity.createdAt),
  );
}
