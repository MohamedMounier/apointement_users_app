import 'package:appointment_users/core/utils/enums/app_enums.dart';
import 'package:appointment_users/core/utils/extensions/enums_extensions.dart';
import 'package:appointment_users/core/utils/resources/app_strings.dart';
import 'package:appointment_users/di/di_container.dart';
import 'package:appointment_users/domain/entities/appointment/appointment_entity.dart';
import 'package:appointment_users/presentation/blocs/appointments/user_appointments_cubit.dart';
import 'package:appointment_users/presentation/blocs/appointments/user_appointments_state.dart';
import 'package:appointment_users/presentation/blocs/home/home_cubit.dart';
import 'package:appointment_users/presentation/shared/widgets/app_button.dart';
import 'package:appointment_users/presentation/shared/widgets/app_text.dart';
import 'package:appointment_users/presentation/shared/widgets/loading_lottie.dart';
import 'package:appointment_users/router/screen_router_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class UserAppointmentsNavBarScreen extends StatefulWidget {
  const UserAppointmentsNavBarScreen({super.key});

  @override
  State<UserAppointmentsNavBarScreen> createState() =>
      _UserAppointmentsNavBarScreenState();
}

class _UserAppointmentsNavBarScreenState
    extends State<UserAppointmentsNavBarScreen> {
  @override
  void initState() {
    context.read<UserAppointmentsCubit>().initData(
      userId: context.read<HomeCubit>().state.currentUser!.uid,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<UserAppointmentsCubit, UserAppointmentsState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (context.read<HomeCubit>().state.currentUser?.name ==
              AppStrings.anonymous) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: AppButton(
                  text: 'Login To Start Your Journey',
                  suffixIcon: Icons.login,
                  onPressed: () {
                    diContainer<ScreenRouterHelper>().navigateToLogin();
                  },
                ),
              ),
            );
          }
          if ((state.requestState == RequestState.loading) &&
              (state.step ==
                  UserAppointmentsSteps.gettingUserAppointmentsLoading)) {
            return Center(child: LoadingLottie(height: 100, width: 100));
          } else {
            if (state.userBookedAppointments.isEmpty) {
              return Center(child: AppText('No Bookings yet',
                alignment: Alignment.center,
                fontSize: 24.sp,));
            } else {
              return ListView.builder(
                itemCount: state.userBookedAppointments.length,
                itemBuilder: (context, index) {
                  final AppointmentEntity appointment = state.userBookedAppointments[index];
                  return Card(
                    child: ListTile(
                      title: AppText('${appointment.specialistName}',fontWeight: FontWeight.bold),
                      trailing: TextButton(
                        onPressed: () {
                          diContainer<ScreenRouterHelper>()
                              .navigateToEditAppointmentScreen(
                                appointmentEntity: appointment,
                              );
                        },
                        child: Text('Edit'),
                      ),
                      subtitle: Column(
                        children: [
                          Row(
                            children: [
                              AppText('Status :'),
                              AppText(' ${appointment.status.statusName}',color:appointment.status.statusColor ,fontWeight: FontWeight.bold,),
                            ],
                          ),
                          AppText('Booking Date : ${DateFormat.yMMMEd().format(appointment.currentBookedDate)}'),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          }
        },
      ),
    );
  }
}
