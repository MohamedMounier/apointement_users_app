import 'package:appointment_users/core/utils/enums/app_enums.dart';

extension UserTypesExtension on UserTypes {
  // Getter for the typeName
  String get typeName {
    switch (this) {
      case UserTypes.admin:
        return "Admin";
      case UserTypes.user:
        return "User";
    }
  }

}
