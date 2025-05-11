import 'package:appointment_users/domain/entities/appointment/appointment_entity.dart';
import 'package:appointment_users/domain/entities/specialist_entity.dart';
import 'package:appointment_users/domain/use_cases/appointments/book_appointment_usecase.dart';
import 'package:appointment_users/domain/use_cases/appointments/get_appointments_for_user_use_case.dart';
import 'package:appointment_users/domain/use_cases/appointments/get_available_times_use_case.dart';
import 'package:appointment_users/presentation/blocs/appointments/user_appointments_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../core/utils/enums/app_enums.dart';
import 'book_appointment_state.dart';

@injectable
class UserAppointmentsCubit extends Cubit<UserAppointmentsState> {
  final GetAppointmentForUserUseCase _getAppointmentForUserUseCase;

  UserAppointmentsCubit(this._getAppointmentForUserUseCase)
    : super(const UserAppointmentsState());

  Future<void> initData({required String userId}) async {
    debugPrint('Called UserAppointmentsCubit initData');

    emit(
      state.copyWith(
        step: UserAppointmentsSteps.gettingUserAppointmentsLoading,
        requestState: RequestState.loading,
      ),
    );
    final result = await _getAppointmentForUserUseCase(userId: userId);
    result.when(
      success: (appointments) {
        emit(
          state.copyWith(
            requestState: RequestState.success,
            step: UserAppointmentsSteps.gettingUserAppointmentsSuccess,
            userBookedAppointments: appointments,
          ),
        );
      },
      failure: (failure) {
        emit(
          state.copyWith(
            requestState: RequestState.error,
            step: UserAppointmentsSteps.gettingUserAppointmentsError,
            userBookedAppointments: [],
          ),
        );
      },
    );
  }
}
