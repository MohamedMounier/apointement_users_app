import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:appointment_users/core/utils/enums/app_enums.dart';
import 'package:appointment_users/presentation/blocs/home/home_cubit.dart';
import 'package:appointment_users/presentation/blocs/home/home_state.dart';
import 'package:appointment_users/presentation/blocs/ui_control/uicontrol_cubit.dart';
import 'package:appointment_users/presentation/screens/home/nav_bar_screens/categories_and_specialists_nav_bar_screen.dart';
import 'package:appointment_users/presentation/screens/home/nav_bar_screens/user_appointments_nav_bar_screen.dart';
import 'package:appointment_users/presentation/shared/resources/app_colors.dart';
import 'package:appointment_users/presentation/shared/widgets/loading_lottie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeMobileScreen extends StatelessWidget {
  const HomeMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        debugPrint(
          'Current State Request State ${context.read<HomeCubit>().state.requestState} and current user ${context.read<HomeCubit>().state.currentUser} And Current Category${context.read<HomeCubit>().state.chosenCategory?.name}',
        );
        if ((context.read<HomeCubit>().state.requestState ==
            RequestState.loading)
        // &&
        // (context.read<HomeCubit>().state.currentUser == null)&&(state.categories.isEmpty)
        ) {
          return Scaffold(
            body: const Center(child: LoadingLottie(width: 100, height: 100)),
          );
        } else {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              //params
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: AnimatedBottomNavigationBar(
              icons: [
                Icons.home,
                Icons.calendar_month,
                Icons.person,
                Icons.settings,
              ],
              activeIndex: context.read<HomeCubit>().state.currentIndex,
              gapLocation: GapLocation.center,
              activeColor: AppColors.primary,
              inactiveColor: Colors.white,
              notchSmoothness: NotchSmoothness.softEdge,
              backgroundColor: AppColors.navBarWaveColor,
              leftCornerRadius: 32,
              rightCornerRadius: 32,
              onTap:
                  (index) => context
                      .read<HomeCubit>()
                      .changeCurrentScreenNavIndex(index),
              //other params
            ),
            appBar: AppBar(
              title: const Text('Home Screen'),
              actions: [
                IconButton(onPressed: (){
                  context.read<UiControlCubit>().changeTheme();
                }, icon: Icon(Icons.color_lens_outlined)),
                IconButton(
                  icon: const Icon(Icons.logout),
                  onPressed: () {
                    context.read<HomeCubit>().logout();
                    //diContainer<ScreenRouterHelper>().navigateToLogin();
                  },
                ),
              ],
            ),
            body: fetchScreenByIndex(state.currentIndex),
          );
        }
      },
    );
  }

  fetchScreenByIndex(index) {
    if (index == 0) {
      return CategoriesAndSpecialistsNavBarScreen();
    }
    if (index == 1) {
      return UserAppointmentsNavBarScreen();
    }
    if (index == 2) {
      return Container(color: Colors.yellow);
    } else {
      return Container(color: Colors.grey);
    }
  }
}
