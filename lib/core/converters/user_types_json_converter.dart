import 'package:appointment_users/core/utils/enums/app_enums.dart';
import 'package:appointment_users/core/utils/extensions/enums_extensions.dart';
import 'package:json_annotation/json_annotation.dart';

class UserTypesJsonConverter implements JsonConverter<UserTypes, Object> {
  const UserTypesJsonConverter();

  @override
  UserTypes fromJson(Object typeName) {
    return UserTypes.values.firstWhere(
      (type) => type.typeName == typeName,
      orElse: () => UserTypes.user,
    );
  }

  @override
  Object toJson(UserTypes object) => object.typeName;
}
