import 'package:appointment_users/core/utils/resources/app_strings.dart';
import 'package:appointment_users/core/utils/responsive/responsive_layout.dart';
import 'package:appointment_users/di/di_container.dart';
import 'package:appointment_users/presentation/blocs/appointments/user_appointments_cubit.dart';
import 'package:appointment_users/presentation/blocs/home/home_cubit.dart';
import 'package:appointment_users/presentation/blocs/ui_control/uicontrol_cubit.dart';
import 'package:appointment_users/presentation/shared/resources/themes/app_theme.dart';
import 'package:appointment_users/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UiControlCubit>(
          lazy: true,
          create: (_) => UiControlCubit(),
        ),
        BlocProvider<HomeCubit>(
          lazy: true,
          create:
              (_) => HomeCubit(
                diContainer(),
                diContainer(),
                diContainer(),
                diContainer(),
                diContainer(),
                diContainer(),
              )..getUserBySavedLocalUid(),
        ),
        BlocProvider<UserAppointmentsCubit>(
          lazy: true,
          create: (_) => UserAppointmentsCubit(diContainer()),
        ),
      ],
      child: ResponsiveLayout.builder(
        builder: (context, child) {
          return BlocBuilder<UiControlCubit, UiControlState>(
            buildWhen:
                (previous, current) =>
                    previous.isLightTheme != current.isLightTheme,
            builder: (context, state) {
              return MaterialApp(
                title: AppStrings.appName,
                debugShowCheckedModeBanner: false,
                theme: AppTheme.getTheme(state.isLightTheme),

                navigatorKey: diContainer(),
                onGenerateRoute: diContainer<AppRouter>().onGenerateRoutes,
                initialRoute: diContainer<AppRouter>().fetchInitialRoute(),
              );
            },
          );
        },
      ),
    );
  }
}
