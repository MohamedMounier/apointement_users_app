import 'package:appointment_users/core/utils/enums/app_enums.dart';
import 'package:appointment_users/core/utils/extensions/enums_extensions.dart';
import 'package:appointment_users/di/di_container.dart';
import 'package:appointment_users/domain/entities/appointment/appointment_entity.dart';
import 'package:appointment_users/presentation/blocs/appointments/edit_appointment_cubit.dart';
import 'package:appointment_users/presentation/blocs/appointments/edit_appointment_state.dart';
import 'package:appointment_users/presentation/blocs/appointments/user_appointments_cubit.dart';
import 'package:appointment_users/presentation/blocs/home/home_cubit.dart';
import 'package:appointment_users/presentation/shared/widgets/loading_lottie.dart';
import 'package:appointment_users/router/app_router_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class EditAppointmentScreen extends StatefulWidget {
  const EditAppointmentScreen({super.key});

  @override
  State<EditAppointmentScreen> createState() => _EditAppointmentScreenState();
}

class _EditAppointmentScreenState extends State<EditAppointmentScreen> {
  final TextEditingController _reasonCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EditAppointmentCubit>(
      create:
          (_) => EditAppointmentCubit(
            diContainer(),
            diContainer(),
            diContainer(),
            diContainer(),
          )..getAppointmentActivities(
            appointment:
                (ModalRoute.of(context)?.settings.arguments)
                    as AppointmentEntity,
          ),
      child: Scaffold(
        appBar: AppBar(title: Text('Edit Appointment')),
        body: Builder(
          builder: (ctx) {
            return BlocConsumer<EditAppointmentCubit, EditAppointmentState>(
              listener: (context, state) {
                if (state.requestState == RequestState.success) {
                  if (state.editAppointmentStep ==
                      EditAppointmentSteps
                          .isCancellingUserAppointmentsSuccess) {
                    context.read<UserAppointmentsCubit>().initData(
                      userId: context.read<HomeCubit>().state.currentUser!.uid,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Successfully Canceled')),
                    );
                    diContainer<AppRouterHelper>().pop();
                  }
                  if (state.editAppointmentStep ==
                      EditAppointmentSteps
                          .isReschedulingAppointmentTimeSuccess) {
                    context.read<UserAppointmentsCubit>().initData(
                      userId: context.read<HomeCubit>().state.currentUser!.uid,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Successfully Rescheduled')),
                    );
                    diContainer<AppRouterHelper>().pop();
                  }
                }
                if (state.requestState == RequestState.error) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
                }
              },
              builder: (context, state) {
                if ((state.requestState == RequestState.loading) &&
                    (state.editAppointmentStep ==
                        EditAppointmentSteps
                            .isGettingAppointmentActivitiesLoading)) {
                  return Center(child: LoadingLottie(height: 100, width: 100));
                } else {
                  if (state.currentAppointmentActivitiesList.isEmpty) {
                    return ListView(children: [Text('No Data')]);
                  } else {
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 200.h,
                            child: ListView.builder(
                              itemCount:
                                  state.currentAppointmentActivitiesList.length,
                              itemBuilder: (context, index) {
                                final appointment =
                                    state
                                        .currentAppointmentActivitiesList[index];
                                return ListTile(
                                  title: Text('${appointment.appointmentId}'),
                                  subtitle: Text(
                                    'Status ${appointment.status.statusName}',
                                  ),
                                );
                              },
                            ),
                          ),
                          TextFormField(
                            controller: _reasonCtrl,
                            decoration: InputDecoration(
                              label: Text('Canceling Reason'),
                            ),
                          ),
                          if (state.availableTimes?.isNotEmpty ?? false)
                            Container(
                              height: 500.h,
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Select Date",
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  const SizedBox(height: 10),
                                  ElevatedButton(
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
                                        context
                                            .read<EditAppointmentCubit>()
                                            .selectDate(selected);
                                      }
                                    },
                                    child: Text(
                                      state.selectedDate != null
                                          ? DateFormat.yMMMd().format(
                                            state.selectedDate!,
                                          )
                                          : "Choose a date",
                                    ),
                                  ),
                                  const SizedBox(height: 20),

                                  if (state.availableTimes!.isNotEmpty)
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Select Time",
                                          style:
                                              Theme.of(
                                                context,
                                              ).textTheme.bodyMedium,
                                        ),
                                        SingleChildScrollView(
                                          child: Wrap(
                                            spacing: 10,
                                            children:
                                                state.availableTimes!.map((
                                                  time,
                                                ) {
                                                  final isSelected =
                                                      state.selectedTime ==
                                                      time;
                                                  return ChoiceChip(
                                                    label: Text(time),
                                                    selected: isSelected,
                                                    onSelected:
                                                        (_) => context
                                                            .read<
                                                              EditAppointmentCubit
                                                            >()
                                                            .selectTime(time),
                                                  );
                                                }).toList(),
                                          ),
                                        ),
                                      ],
                                    ),

                                  const Spacer(),

                                  ElevatedButton(
                                    onPressed:
                                        state.selectedTime != null &&
                                                state.selectedDate != null
                                            ? () => context
                                                .read<EditAppointmentCubit>()
                                                .rescheduleAppointment(
                                                  reason: _reasonCtrl.text,
                                                )
                                            : null,
                                    child: const Text("Confirm Appointment"),
                                  ),
                                ],
                              ),
                            ),
                          ElevatedButton(
                            onPressed: () {
                              context
                                  .read<EditAppointmentCubit>()
                                  .cancelAppointment(reason: _reasonCtrl.text);
                            },
                            child: Text('Cancel'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              context
                                  .read<EditAppointmentCubit>()
                                  .fetchAvailableTimes();
                            },
                            child: Text('Check Availability'),
                          ),
                        ],
                      ),
                    );
                  }
                }
              },
            );
          },
        ),
      ),
    );
  }
}
