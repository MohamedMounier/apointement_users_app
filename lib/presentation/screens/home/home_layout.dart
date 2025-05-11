import 'package:appointment_users/core/utils/enums/app_enums.dart';
import 'package:appointment_users/core/utils/responsive/responsive_layout.dart';
import 'package:appointment_users/presentation/blocs/home/home_cubit.dart';
import 'package:appointment_users/presentation/blocs/home/home_state.dart';
import 'package:appointment_users/presentation/screens/home/home_mobile.dart';
import 'package:appointment_users/presentation/screens/home/home_tablet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  void initState() {
    // context.read<HomeCubit>().getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state.categories.isEmpty && state.currentUser != null) {
          debugPrint('Calling getCategories in Home Layout listener');
          context.read<HomeCubit>().getCategories();
        }
        if ((state.requestState == RequestState.success) &&
            (state.userSteps == UserSteps.isUserLoggedOut)) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Logged Out Successfully')));
        }
      },
      // buildWhen: (previous, current) {
      //   return (previous.currentUser?.uid != current.currentUser?.uid) &&
      //       (previous.requestState != current.requestState)&&(current.currentUser?.uid !=null);
      // },
      child:
          ResponsiveLayout.isMobile(context)
              ? HomeMobileScreen()
              : HomeTabletScreen(),
    );
  }
}
