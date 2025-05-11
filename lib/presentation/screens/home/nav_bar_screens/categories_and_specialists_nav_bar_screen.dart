import 'package:appointment_users/core/utils/resources/app_strings.dart';
import 'package:appointment_users/di/di_container.dart';
import 'package:appointment_users/presentation/blocs/home/home_cubit.dart';
import 'package:appointment_users/presentation/blocs/ui_control/uicontrol_cubit.dart';
import 'package:appointment_users/presentation/screens/home/views/specialis/category_choices_drop_down.dart';
import 'package:appointment_users/presentation/screens/home/views/specialis/specialists_list_view.dart';
import 'package:appointment_users/presentation/shared/resources/app_colors.dart';
import 'package:appointment_users/presentation/shared/widgets/app_text.dart';
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
              ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Visibility(
                      visible: context.read<HomeCubit>().state.currentUser?.name!=AppStrings.anonymous,
                      child: Row(
                        children: [
                          AppText(
                            'Welcome ',
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                            color:
                                context.read<UiControlCubit>().state.isLightTheme
                                    ? AppColors.blackColor
                                    : Colors.white,
                          ),
                          AppText(
                            '${context.read<HomeCubit>().state.currentUser!.name}',
                            fontWeight: FontWeight.w500,
                            fontSize: 18.sp,
                            color:
                            context.read<UiControlCubit>().state.isLightTheme
                                ? AppColors.blackColor
                                : Colors.white,
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 60.h, child: CategoryChoicesDropDown()),
                    Expanded(child: SpecialistsListView()),
                  ],
                ),
              )
              : Center(child: CircularProgressIndicator()),
    );
  }
}
