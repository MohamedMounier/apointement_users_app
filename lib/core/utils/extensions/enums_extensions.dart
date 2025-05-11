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

extension AppointmentStatusExtension on AppointmentStatus {
  // Getter for the typeName
  String get statusName {
    switch (this) {
      case AppointmentStatus.pending:
        return 'Pending';
      case AppointmentStatus.confirmed:
        return 'Confirmed';

      case AppointmentStatus.cancelled:
        return 'Cancelled';

      case AppointmentStatus.pendingAvailability:
        return 'Pending Availability';

      case AppointmentStatus.underReview:
        return 'Under Review';

      case AppointmentStatus.rescheduled:
        return 'Rescheduled';
      case AppointmentStatus.done:
        return 'Done';
      case AppointmentStatus.noShow:
        return 'No Show';
    }
  }
}
