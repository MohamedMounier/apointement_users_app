// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
  uid: json['uid'] as String,
  name: json['name'] as String,
  email: json['email'] as String,
  userType: const UserTypesJsonConverter().fromJson(
    json['user_type'] as Object,
  ),
  createdAt: const TimestampConverter().fromJson(json['created_at'] as Object),
);

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  'uid': instance.uid,
  'name': instance.name,
  'user_type': const UserTypesJsonConverter().toJson(instance.userType),
  'email': instance.email,
  'created_at': const TimestampConverter().toJson(instance.createdAt),
};
