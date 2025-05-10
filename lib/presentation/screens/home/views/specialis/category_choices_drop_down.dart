import 'package:appointment_users/domain/entities/specialization_category_entity.dart';
import 'package:appointment_users/presentation/blocs/home/home_cubit.dart';
import 'package:appointment_users/presentation/blocs/home/home_cubit.dart';
import 'package:appointment_users/presentation/blocs/home/home_state.dart';
import 'package:appointment_users/presentation/widgets/custom_drop_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryChoicesDropDown extends StatefulWidget {
  const CategoryChoicesDropDown({super.key});

  @override
  State<CategoryChoicesDropDown> createState() => _CategoryChoicesDropDownState();
}

class _CategoryChoicesDropDownState extends State<CategoryChoicesDropDown> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeCubit, HomeState, SpecializationCategoryEntity>(
      selector: (state) =>
          state.chosenCategory!,
      builder: (context, state) {
        return CustomDropDown<SpecializationCategoryEntity>(
          label: 'Choose Category',
          onChanged: (val) {
            context.read<HomeCubit>().chooseCategory(val);
          },
          displayItemName:  (item) => item.name,
          items: context.read<HomeCubit>().state.categories,
          selectedItem:state,
        );
      },
    );
  }
}
