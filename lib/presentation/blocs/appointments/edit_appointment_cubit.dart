import 'package:appointment_users/domain/entities/appointment/appointment_entity.dart';
import 'package:appointment_users/domain/use_cases/appointments/cancel_appintment_use_case.dart';
import 'package:appointment_users/domain/use_cases/appointments/get_appointment_activities_use_case.dart';
import 'package:appointment_users/domain/use_cases/appointments/get_available_times_use_case.dart';
import 'package:appointment_users/domain/use_cases/appointments/reschedule_appointment_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../core/utils/enums/app_enums.dart';
import 'edit_appointment_state.dart';

@injectable
class EditAppointmentCubit extends Cubit<EditAppointmentState> {
  final CancelAppointmentUseCase _cancelAppointmentUseCase;
  final GetAppointmentActivitiesUseCase _getAppointmentActivitiesUseCase;
  final GetAvailableTimesUseCase _getAvailableTimesUseCase;
  final RescheduleAppointmentUseCase _rescheduleAppointmentUseCase;

  EditAppointmentCubit(
    this._cancelAppointmentUseCase,
    this._getAppointmentActivitiesUseCase,
    this._getAvailableTimesUseCase,
    this._rescheduleAppointmentUseCase,
  ) : super(const EditAppointmentState());

  Future<void> getAppointmentActivities({
    required AppointmentEntity appointment,
  }) async {
    emit(
      state.copyWith(
        selectedDate: DateTime.now(),
        currentAppointment: appointment,
        editAppointmentStep:
            EditAppointmentSteps.isGettingAppointmentActivitiesLoading,
        requestState: RequestState.loading,
      ),
    );
    final result = await _getAppointmentActivitiesUseCase(
      appointmentId: state.currentAppointment!.id,
    );
    result.when(
      success: (appointmentsActivities) {
        emit(
          state.copyWith(
            requestState: RequestState.success,
            editAppointmentStep:
                EditAppointmentSteps.isGettingAppointmentActivitiesSuccess,
            currentAppointmentActivitiesList: appointmentsActivities,
          ),
        );
      },
      failure: (failure) {
        emit(
          state.copyWith(
            requestState: RequestState.error,
            editAppointmentStep:
                EditAppointmentSteps.isGettingAppointmentActivitiesError,
            errorMessage: failure.message,
            currentAppointmentActivitiesList: [],
          ),
        );
      },
    );
  }

  Future<void> cancelAppointment({required String reason}) async {
    emit(
      state.copyWith(
        editAppointmentStep:
            EditAppointmentSteps.isCancellingUserAppointmentsLoading,
        requestState: RequestState.loading,
      ),
    );
    final result = await _cancelAppointmentUseCase((
      state.currentAppointment!,
      reason,
    ));
    result.when(
      success: (appointmentsActivities) {
        emit(
          state.copyWith(
            requestState: RequestState.success,
            editAppointmentStep:
                EditAppointmentSteps.isCancellingUserAppointmentsSuccess,
          ),
        );
      },
      failure: (failure) {
        emit(
          state.copyWith(
            requestState: RequestState.error,
            editAppointmentStep:
                EditAppointmentSteps.isCancellingUserAppointmentsError,
            errorMessage: failure.message,
          ),
        );
      },
    );
  }

  Future<void> rescheduleAppointment({required String reason}) async {
    if(state.selectedTime==null||state.selectedDate==null){
      emit(state.copyWith(requestState: RequestState.error,errorMessage: 'You Should Choose New Date And Time'));
      return;
    }
    emit(
      state.copyWith(
        editAppointmentStep:
            EditAppointmentSteps.isReschedulingAppointmentTimeLoading,
        requestState: RequestState.loading,
      ),
    );
    final fullDateTime = DateTime(
      state.selectedDate!.year,
      state.selectedDate!.month,
      state.selectedDate!.day,
      int.parse(state.selectedTime!.split(":")[0]),
      int.parse(state.selectedTime!.split(":")[1]),
    );
    final result = await _rescheduleAppointmentUseCase((
      state.currentAppointment!.copyWith(rescheduleRequestedDate: fullDateTime),
      reason,
    ));
    result.when(
      success: (appointmentsActivities) {
        emit(
          state.copyWith(
            requestState: RequestState.success,
            editAppointmentStep:
                EditAppointmentSteps.isReschedulingAppointmentTimeSuccess,
          ),
        );
      },
      failure: (failure) {
        emit(
          state.copyWith(
            requestState: RequestState.error,
            editAppointmentStep:
                EditAppointmentSteps.isReschedulingAppointmentTimeError,
            errorMessage: failure.message,
          ),
        );
      },
    );
  }

  Future<void> fetchAvailableTimes() async {
    if (state.selectedDate == null) return;

    emit(
      state.copyWith(
        editAppointmentStep:
            EditAppointmentSteps.isGettingSpecialistAvailableTimeLoading,
        requestState: RequestState.loading,
      ),
    );

    final result = await _getAvailableTimesUseCase(
      specialistId: state.currentAppointment!.specialistId,
      selectedDate: state.selectedDate!,
    );

    result.when(
      success: (times) {
        for (var time in times) {
          debugPrint('Available time ${time}');
        }
        emit(
          state.copyWith(
            availableTimes: times,
            editAppointmentStep:
                EditAppointmentSteps.isGettingSpecialistAvailableTimeSuccess,
            requestState: RequestState.success,
          ),
        );
      },
      failure: (error) {
        emit(
          state.copyWith(
            errorMessage: error.message,
            editAppointmentStep:
                EditAppointmentSteps.isGettingSpecialistAvailableTimeError,
            requestState: RequestState.error,
          ),
        );
      },
    );
  }

  void testBackAndRefresh() {
    emit(
      state.copyWith(
        requestState: RequestState.loading,
        editAppointmentStep:
            EditAppointmentSteps.isCancellingUserAppointmentsLoading,
      ),
    );
    emit(
      state.copyWith(
        requestState: RequestState.success,
        editAppointmentStep: EditAppointmentSteps.isTestGoBackAndRefresh,
      ),
    );
  }

  void selectDate(DateTime date) {
    emit(state.copyWith(selectedDate: date, requestState: RequestState.none));
    fetchAvailableTimes();
  }

  void selectTime(String time) {
    emit(state.copyWith(selectedTime: time, requestState: RequestState.none));
  }
}
