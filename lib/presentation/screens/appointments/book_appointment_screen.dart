import 'package:appointment_users/core/utils/enums/app_enums.dart';
import 'package:appointment_users/core/utils/resources/app_assets.dart';
import 'package:appointment_users/core/utils/resources/app_strings.dart';
import 'package:appointment_users/di/di_container.dart';
import 'package:appointment_users/presentation/blocs/appointments/book_appointment_cubit.dart';
import 'package:appointment_users/presentation/blocs/appointments/book_appointment_state.dart';
import 'package:appointment_users/presentation/blocs/home/home_cubit.dart';
import 'package:appointment_users/presentation/shared/widgets/app_button.dart';
import 'package:appointment_users/presentation/shared/widgets/app_text.dart';
import 'package:appointment_users/router/app_router_helper.dart';
import 'package:appointment_users/router/screen_router_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 60.r,
                        backgroundImage: AssetImage(AppImages.profileDemoImg),
                      ),
                      SizedBox(width: 30.w),
                      Expanded(
                        child: Column(
                          children: [
                            AppText(
                              '${context.read<BookAppointmentCubit>().state.selectedSpecialist?.name}',
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            SizedBox(height: 10.h,),
                            AppText(
                              'Bio :    ${context.read<BookAppointmentCubit>().state.selectedSpecialist?.bio}',
                              fontSize: 12.sp,
                              maxLines: 5,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h,),
                  Row(
                    children: [
                      AppText(
                        "Select Date",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () async {
                            final selected = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime.now().add(
                                const Duration(days: 30),
                              ),
                            );
                            if (selected != null) {
                              context.read<BookAppointmentCubit>().selectDate(
                                selected,
                              );
                            }
                          },
                          child: Text(
                            state.selectedDate != null
                                ? DateFormat.yMMMd().format(state.selectedDate!)
                                : "Choose a date",
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  if (state.availableTimes!.isNotEmpty)
                    SizedBox(
                      child: Column(
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
                    ),
                  SizedBox(height: 20.h,),

                  Visibility(
                    visible:
                        context.read<HomeCubit>().state.currentUser?.name !=
                        AppStrings.anonymous,
                    replacement: AppButton(
                      text: 'Login To Start Booking',
                      suffixIcon: Icons.login,
                      onPressed: () {
                        diContainer<AppRouterHelper>().pop();
                        diContainer<ScreenRouterHelper>().navigateToLogin();
                      },
                    ),
                    child: ElevatedButton(
                      onPressed:
                          state.selectedTime != null &&
                                  state.selectedDate != null
                              ? () => context
                                  .read<BookAppointmentCubit>()
                                  .bookAppointment(
                                    userId:
                                        context
                                            .read<HomeCubit>()
                                            .state
                                            .currentUser!
                                            .uid,
                                    userName:
                                        context
                                            .read<HomeCubit>()
                                            .state
                                            .currentUser!
                                            .name,
                                  )
                              : null,
                      child: const Text("Confirm Appointment"),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
