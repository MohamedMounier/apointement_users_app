import 'package:appointment_users/domain/entities/appointment/appointment_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppointmentsHelper {
  static List<String> getAvailableTimes({
    required DateTime selectedDate,
    required List<AppointmentEntity> bookedAppointments,
  }) {
    // Logic to filter out booked times
    // Example: Return times between 9:00 AM and 5:00 PM excluding booked ones.
    List<String> allTimes = _generateTimeSlots(selectedDate);

    // Filter out booked times
    bookedAppointments.forEach((appointment) {
      final bookedTime = appointment.currentBookedDate;
      final timeSlot = "${bookedTime.hour.toString().padLeft(2, '0')}:${bookedTime.minute.toString().padLeft(2, '0')}";
      debugPrint('timeSlot ${timeSlot}');

      allTimes.remove(timeSlot);  // Remove booked time from available slots
    });
debugPrint('All times ${allTimes}');
    return allTimes;
  }

  static List<String> _generateTimeSlots(DateTime selectedDate) {
    // Generate all possible time slots for the selected date (e.g., 9:00 AM to 5:00 PM)
    List<String> times = [];
    for (int hour = 9; hour <= 17; hour++) {
      for (int minute = 0; minute < 60; minute += 30) {
        times.add("${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}");
      }
    }
    return times;
  }
  /// Converts a string like "14:30" to a TimeOfDay object
  static TimeOfDay timeOfDayFromString(String time) {
    final parts = time.split(':');
    final hour = int.parse(parts[0]);
    final minute = int.parse(parts[1]);
    return TimeOfDay(hour: hour, minute: minute);
  }

  /// Converts a TimeOfDay object to a string like "14:30"
  static String stringFromTimeOfDay(TimeOfDay time) {
    final hour = time.hour.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

}
