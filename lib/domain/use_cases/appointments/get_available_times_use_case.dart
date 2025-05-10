import 'package:appointment_users/data/models/response_models/response_wrapper.dart';
import 'package:appointment_users/domain/helpers/appointment_helper.dart';
import 'package:appointment_users/domain/repository/appointments/appointment_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
@lazySingleton
class GetAvailableTimesUseCase {
  final AppointmentsRepository _appointmentsRepository;

  GetAvailableTimesUseCase(this._appointmentsRepository);

  Future<ResponseWrapper<List<String>>> call({
    required String specialistId,
    required DateTime selectedDate,
  }) async {
    // Fetch booked appointments for the specialist on the selected date
    try{
      final response = await _appointmentsRepository.getAppointmentsForSpecialist(specialistId);

      return response.when(
        success: (appointments) {
          // Assuming `AppointmentsHelper.getAvailableTimes` takes `DateTime` and the list of appointments
          final times = AppointmentsHelper.getAvailableTimes(
            selectedDate: selectedDate,
            bookedAppointments: appointments,
          );
          return ResponseWrapper.success(times);
        },
        failure: ResponseWrapper.failure,
      );
    }catch(error){
      rethrow;
    }
  }
}


