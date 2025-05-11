import 'package:appointment_users/domain/entities/appointment/appointment_entity.dart';
import 'package:appointment_users/domain/entities/specialist_entity.dart';
import 'package:appointment_users/domain/use_cases/appointments/book_appointment_usecase.dart';
import 'package:appointment_users/domain/use_cases/appointments/get_available_times_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../core/utils/enums/app_enums.dart';
import 'book_appointment_state.dart';

@injectable
class BookAppointmentCubit extends Cubit<BookAppointmentState> {
  final GetAvailableTimesUseCase _getAvailableTimesUseCase;
  final BookAppointmentUseCase _bookAppointmentUseCase;

  BookAppointmentCubit(this._getAvailableTimesUseCase,
      this._bookAppointmentUseCase,) : super(const BookAppointmentState());
  Future<void>initData({required SpecialistEntity specialist})async{
    emit(state.copyWith(step:BookAppointmentSteps.none,isLoading: true,selectedSpecialist: specialist,selectedDate: DateTime.now(),selectedTime: TimeOfDay.now().toString()));
  await fetchAvailableTimes();
  }
  void selectSpecialist(SpecialistEntity specialist) {
    emit(state.copyWith(selectedSpecialist: specialist));
  }

  void selectDate(DateTime date) {
    emit(state.copyWith(selectedDate: date));
    fetchAvailableTimes();
  }

  void selectTime(String time) {
    emit(state.copyWith(selectedTime: time));
  }

  Future<void> fetchAvailableTimes() async {
    if (state.selectedSpecialist == null || state.selectedDate == null) return;

    emit(state.copyWith(
      step: BookAppointmentSteps.loadingAvailableTimes,
      isLoading: true,
      errorMessage: null,
    ));

    final result = await _getAvailableTimesUseCase(
      specialistId: state.selectedSpecialist!.id,
      selectedDate: state.selectedDate!,
    );

    result.when(
      success: (times) {
        for(var time in times){
          debugPrint('Available time ${time}');
        }
        emit(state.copyWith(
          availableTimes: times,
          step: BookAppointmentSteps.loadedAvailableTimes,
          isLoading: false,
        ));
      },
      failure: (error) {
        emit(state.copyWith(
          errorMessage: error.message,
          step: BookAppointmentSteps.error,
          isLoading: false,
        ));
      },
    );
  }

  Future<void> bookAppointment(String userId) async {
    if (state.selectedSpecialist == null ||
        state.selectedTime == null ||
        state.selectedDate == null) return;

    emit(state.copyWith(
      step: BookAppointmentSteps.bookingAppointment,
      isLoading: true,
      errorMessage: null,
    ));

    final fullDateTime = DateTime(
      state.selectedDate!.year,
      state.selectedDate!.month,
      state.selectedDate!.day,
      int.parse(state.selectedTime!.split(":")[0]),
      int.parse(state.selectedTime!.split(":")[1]),
    );

    final result = await _bookAppointmentUseCase(
        AppointmentEntity(id: '${userId}_${state.selectedSpecialist!.id}_${fullDateTime.millisecondsSinceEpoch}',
            userId: userId,
            specialistId: state.selectedSpecialist!.id,
            status: AppointmentStatus.confirmed,
            currentBookedDate: fullDateTime,
            createdAt: DateTime.now())
    );

    result.when(
      success: (appointment) {
        emit(state.copyWith(
          step: BookAppointmentSteps.appointmentBooked,
          isLoading: false,
        ));
      },
      failure: (error) {
        emit(state.copyWith(
          errorMessage: error.message,
          step: BookAppointmentSteps.error,
          isLoading: false,
        ));
      },
    );
  }
}
