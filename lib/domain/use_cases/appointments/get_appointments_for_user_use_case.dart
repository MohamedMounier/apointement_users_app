import 'package:appointment_users/data/models/response_models/response_wrapper.dart';
import 'package:appointment_users/domain/entities/appointment/appointment_entity.dart';
import 'package:appointment_users/domain/repository/appointments/appointment_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetAppointmentForUserUseCase {
  final AppointmentsRepository _appointmentsRepository;

  GetAppointmentForUserUseCase(this._appointmentsRepository);

  Future<ResponseWrapper<List<AppointmentEntity>>> call({
    required String userId,
  }) async {
    try {
      return await _appointmentsRepository.getAppointmentsForUser(userId);
    } catch (error) {
      rethrow;
    }
  }
}
