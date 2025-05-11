import 'package:appointment_users/core/utils/enums/app_enums.dart';
import 'package:flutter/material.dart';

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

  Color get statusColor {
    switch (this) {
      case AppointmentStatus.pending:
        return Colors.orange;
      case AppointmentStatus.confirmed:
        return Colors.green;
      case AppointmentStatus.cancelled:
        return Colors.red;
      case AppointmentStatus.pendingAvailability:
        return Colors.amber;
      case AppointmentStatus.underReview:
        return Colors.purple;
      case AppointmentStatus.rescheduled:
        return Colors.blue;
      case AppointmentStatus.done:
        return Colors.teal;
      case AppointmentStatus.noShow:
        return Colors.grey;
      default:
        return Colors.grey;
    }
  }

  IconData get statusIcon {
    switch (this) {
      case AppointmentStatus.pending:
        return Icons.hourglass_empty;
      case AppointmentStatus.confirmed:
        return Icons.check_circle;
      case AppointmentStatus.cancelled:
        return Icons.cancel;
      case AppointmentStatus.pendingAvailability:
        return Icons.calendar_today;
      case AppointmentStatus.underReview:
        return Icons.rate_review;
      case AppointmentStatus.rescheduled:
        return Icons.event_repeat;
      case AppointmentStatus.done:
        return Icons.task_alt;
      case AppointmentStatus.noShow:
        return Icons.person_off;
      default:
        return Icons.help_outline;
    }
  }
}
