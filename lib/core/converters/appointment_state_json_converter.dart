import 'package:appointment_users/core/utils/enums/app_enums.dart';
import 'package:appointment_users/core/utils/extensions/enums_extensions.dart';
import 'package:json_annotation/json_annotation.dart';

class AppointmentStatusJsonConverter
    implements JsonConverter<AppointmentStatus, Object> {
  const AppointmentStatusJsonConverter();

  @override
  AppointmentStatus fromJson(Object statusName) {
    return AppointmentStatus.values.firstWhere(
      (status) => status.statusName == statusName,
      orElse: () => AppointmentStatus.pending,
    );
  }

  @override
  Object toJson(AppointmentStatus object) => object.statusName;
}
