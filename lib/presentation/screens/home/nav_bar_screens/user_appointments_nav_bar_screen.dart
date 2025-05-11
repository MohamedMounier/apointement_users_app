import 'package:appointment_users/core/utils/enums/app_enums.dart';
import 'package:appointment_users/core/utils/extensions/enums_extensions.dart';
import 'package:appointment_users/di/di_container.dart';
import 'package:appointment_users/presentation/blocs/appointments/user_appointments_cubit.dart';
import 'package:appointment_users/presentation/blocs/appointments/user_appointments_state.dart';
import 'package:appointment_users/presentation/blocs/home/home_cubit.dart';
import 'package:appointment_users/presentation/widgets/loading_lottie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserAppointmentsNavBarScreen extends StatelessWidget {
  const UserAppointmentsNavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserAppointmentsCubit>(
      create: (_) => UserAppointmentsCubit(diContainer())..initData(userId: context.read<HomeCubit>().state.currentUser!.uid),
      child: Scaffold(
        body: Builder(
          builder: (context) {
            return BlocConsumer<UserAppointmentsCubit, UserAppointmentsState>(
              listener: (context, state) {},
              builder: (context, state) {
                if ((state.requestState == RequestState.loading) &&
                    (state.step ==
                        UserAppointmentsSteps.gettingUserAppointmentsLoading)) {
                  return Center(child: LoadingLottie(height: 100, width: 100));
                } else {
                  if (state.userBookedAppointments.isEmpty) {
                    return ListView(children: [Text('No Data')]);
                  } else {
                    return ListView.builder(
                      itemCount: state.userBookedAppointments.length,
                      itemBuilder: (context, index) {
                        final appointment = state.userBookedAppointments[index];
                        return ListTile(
                          title: Text('${appointment.id}'),
                          subtitle: Text(
                            'Status ${appointment.status.statusName}',
                          ),
                        );
                      },
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
