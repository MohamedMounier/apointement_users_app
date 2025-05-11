import 'package:appointment_users/core/utils/enums/app_enums.dart';
import 'package:appointment_users/domain/entities/appointment/appointment_activity_entity.dart';
import 'package:appointment_users/domain/entities/appointment/appointment_entity.dart';
import 'package:appointment_users/domain/entities/specialist_entity.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_appointment_state.freezed.dart';


@freezed
class EditAppointmentState with _$EditAppointmentState {
  const factory EditAppointmentState({
    @Default(EditAppointmentSteps.none) EditAppointmentSteps editAppointmentStep,
    @Default(RequestState.none) RequestState requestState,
    @Default(AppointmentStatus.confirmed)AppointmentStatus filteredStatus,
    @Default('')String errorMessage,
    List<String>? availableTimes,
    String? selectedTime,
    DateTime? selectedDate,
  @Default([])List<AppointmentActivityEntity> currentAppointmentActivitiesList,
  AppointmentEntity? currentAppointment,
  }) = _EditAppointmentState;
}
