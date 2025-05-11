import 'package:appointment_users/core/utils/enums/app_enums.dart';
import 'package:appointment_users/domain/entities/appointment/appointment_entity.dart';
import 'package:appointment_users/domain/entities/specialist_entity.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_appointments_state.freezed.dart';


@freezed
class UserAppointmentsState with _$UserAppointmentsState {
  const factory UserAppointmentsState({
    @Default(UserAppointmentsSteps.none) UserAppointmentsSteps step,
    @Default(RequestState.none) RequestState requestState,
    @Default(AppointmentStatus.confirmed)AppointmentStatus filteredStatus,
    @Default('')String errorMessage,
  @Default([])List<AppointmentEntity> userBookedAppointments,
  @Default([])List<AppointmentEntity> filteredUserBookedAppointments,
  }) = _UserAppointmentsState;
}
