import 'package:appointment_users/data/models/appointment/appointment_model.dart';
import 'package:appointment_users/data/models/response_models/response_wrapper.dart';
import 'package:appointment_users/domain/entities/appointment/appointment_entity.dart';
import 'package:appointment_users/domain/repository/appointments/appointment_repo.dart';
import 'package:injectable/injectable.dart';
@lazySingleton
class BookAppointmentUseCase {
  final AppointmentsRepository repository;

  BookAppointmentUseCase(this.repository);

  Future<ResponseWrapper<void>> call(AppointmentEntity appointment) {
    return repository.bookAppointment(appointment);
  }
}