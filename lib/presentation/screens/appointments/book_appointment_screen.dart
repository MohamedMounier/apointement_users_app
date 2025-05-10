import 'package:appointment_users/core/utils/enums/app_enums.dart';
import 'package:appointment_users/presentation/blocs/appointments/book_appointment_cubit.dart';
import 'package:appointment_users/presentation/blocs/appointments/book_appointment_state.dart';
import 'package:appointment_users/presentation/blocs/home/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class AppointmentBookingScreen extends StatelessWidget {
  const AppointmentBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Book Appointment")),
      body: BlocConsumer<BookAppointmentCubit, BookAppointmentState>(
        listener: (context, state) {
          if (state.step == BookAppointmentSteps.error &&
              state.errorMessage != null) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.errorMessage!)));
          }
          if (state.step == BookAppointmentSteps.appointmentBooked) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Appointment booked successfully!")),
            );
            Navigator.pop(context); // Or navigate to confirmation screen
          }
        },
        builder: (context, state) {
          if (state.isLoading &&
              state.step == BookAppointmentSteps.loadingAvailableTimes) {
            return const Center(child: CircularProgressIndicator());
          }

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Select Date",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () async {
                    final selected = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(const Duration(days: 30)),
                    );
                    if (selected != null) {
                      context.read<BookAppointmentCubit>().selectDate(selected);
                    }
                  },
                  child: Text(
                    state.selectedDate != null
                        ? DateFormat.yMMMd().format(state.selectedDate!)
                        : "Choose a date",
                  ),
                ),
                const SizedBox(height: 20),

                if (state.availableTimes!.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Select Time",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Wrap(
                        spacing: 10,
                        children:
                            state.availableTimes!.map((time) {
                              final isSelected = state.selectedTime == time;
                              return ChoiceChip(
                                label: Text(time),
                                selected: isSelected,
                                onSelected:
                                    (_) => context
                                        .read<BookAppointmentCubit>()
                                        .selectTime(time),
                              );
                            }).toList(),
                      ),
                    ],
                  ),

                const Spacer(),

                ElevatedButton(
                  onPressed:
                      state.selectedTime != null && state.selectedDate != null
                          ? () => context
                              .read<BookAppointmentCubit>()
                              .bookAppointment(
                                context
                                    .read<HomeCubit>()
                                    .state
                                    .currentUser!
                                    .uid,
                              )
                          : null,
                  child: const Text("Confirm Appointment"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
