import 'package:appointment_users/di/di_container.dart';
import 'package:appointment_users/presentation/blocs/home/home_cubit.dart';
import 'package:appointment_users/presentation/screens/home/views/specialis/category_choices_drop_down.dart';
import 'package:appointment_users/presentation/screens/home/views/specialis/specialists_list_view.dart';
import 'package:appointment_users/router/screen_router_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesAndSpecialistsNavBarScreen extends StatelessWidget {
  const CategoriesAndSpecialistsNavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child:
          context.read<HomeCubit>().state.categories.isNotEmpty
              ? Column(
                children: [
                  Text('${context.read<HomeCubit>().state.currentUser!.name}'),
                  TextButton(
                    child: Text('MobileScreen Home Screen'),
                    onPressed: () {
                      diContainer<ScreenRouterHelper>().navigateToLogin();
                    },
                  ),
                  SizedBox(height: 60.h, child: CategoryChoicesDropDown()),
                  Expanded(child: SpecialistsListView()),
                ],
              )
              : Center(child: CircularProgressIndicator()),
    );
  }
}
