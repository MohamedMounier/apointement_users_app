import 'package:appointment_users/core/utils/enums/app_enums.dart';
import 'package:appointment_users/domain/entities/appointment/appointment_entity.dart';
import 'package:appointment_users/domain/entities/specialist_entity.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'book_appointment_state.freezed.dart';


@freezed
class BookAppointmentState with _$BookAppointmentState {
  const factory BookAppointmentState({
    @Default(BookAppointmentSteps.none) BookAppointmentSteps step,
    @Default(false) bool isLoading,
    String? errorMessage,
    List<String>? availableTimes,
    String? selectedTime,
    DateTime? selectedDate,
    SpecialistEntity? selectedSpecialist,
    AppointmentEntity? bookedAppointment,
  }) = _BookAppointmentState;
}
