import 'package:appointment_users/core/utils/enums/app_enums.dart';
import 'package:appointment_users/di/di_container.dart';
import 'package:appointment_users/presentation/blocs/home/home_cubit.dart';
import 'package:appointment_users/presentation/blocs/home/home_state.dart';
import 'package:appointment_users/presentation/widgets/loading_lottie.dart';
import 'package:appointment_users/router/screen_router_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeMobileScreen extends StatelessWidget {
  const HomeMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if((state.requestState==RequestState.success)&&(state.userSteps==UserSteps.isUserLoggedOut)){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Logged Out Successfully')));

        }
      },
      buildWhen: (previous, current) {
        return (previous.currentUser?.uid != current.currentUser?.uid)&&(previous.requestState != current.requestState);
      },
      builder: (context, state) {
       if((state.requestState==RequestState.loading)||state.currentUser==null){
          return const Center(
            child: LoadingLottie(
              width: 100,
              height: 100,
            ),
          );
       }else{
         return Scaffold(
           appBar: AppBar(
             title: const Text('Home Screen'),
             actions: [
               IconButton(
                 icon: const Icon(Icons.logout),
                 onPressed: () {
                   context.read<HomeCubit>().logout();
                   //diContainer<ScreenRouterHelper>().navigateToLogin();
                 },
               ),
             ],
           ),
           body: Center(
             child: Column(
               children: [
                 Text('${context.read<HomeCubit>().state.currentUser!.name}'),
                 TextButton(
                   child: Text('MobileScreen Home Screen'),
                   onPressed: () {
                     diContainer<ScreenRouterHelper>().navigateToLogin();
                   },
                 ),
               ],
             ),
           ),
         );
       }
      },
    );
  }
}
