import 'dart:math';

import 'package:appointment_users/core/utils/enums/app_enums.dart';
import 'package:appointment_users/di/di_container.dart';
import 'package:appointment_users/presentation/blocs/home/home_cubit.dart';
import 'package:appointment_users/presentation/blocs/home/home_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpecialistsListView extends StatefulWidget {
  const SpecialistsListView({super.key});

  @override
  State<SpecialistsListView> createState() => _SpecialistsListViewState();
}

class _SpecialistsListViewState extends State<SpecialistsListView> {
  final ScrollController _scrollController = ScrollController();
  final String selectedCategory = 'Dentist'; // example


  @override
  void initState() {
    super.initState();

    //context.read<HomeCubit>().loadInitialSpecialists(selectedCategory);
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 100) {
      context.read<HomeCubit>().loadMoreSpecialists();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,

      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context,state){
          if(state.userSteps==UserSteps.isFetchedCategories){
            context.read<HomeCubit>().loadMoreSpecialists();

          }
        },
        builder: (context, state) {
          if (state.isLoading && state.specialists.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            controller: _scrollController,
            itemCount:
                state.specialists.length + (state.isLoadingSpecialists ? 1 : 0),
            itemBuilder: (context, index) {
              if (index == state.specialists.length) {
                return const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Center(child: CircularProgressIndicator()),
                );
              }

              final specialist = state.specialists[index];
              return ListTile(
                leading: const Icon(Icons.person),
                title: Text(specialist.name),
                subtitle: Text(specialist.category),
              );
            },
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
/*
  Future<void> seedFakeSpecialistsData() async {
    final specialistsRef = diContainer<FirebaseFirestore>().collection('Specialists');
    final now = Timestamp.now();

    final random = Random();

    final firstNames = [
      'John', 'Emily', 'Michael', 'Sarah', 'David', 'Emma', 'Daniel',
      'Sophia', 'Chris', 'Olivia', 'James', 'Ava', 'Robert', 'Mia', 'Mark'
    ];
    final lastNames = [
      'Smith', 'Johnson', 'Brown', 'Taylor', 'Anderson', 'Thomas', 'Jackson',
      'White', 'Harris', 'Martin', 'Thompson', 'Garcia', 'Clark', 'Lewis'
    ];

    final categories = ['Dentist', 'Cardiologist', 'Neurologist', 'Dermatologist'];

    List<String> randomDays() => [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday'
    ]..shuffle(random);

    List<String> randomTimes() => [
      '09:00', '10:30', '13:00', '15:30', '17:00'
    ]..shuffle(random);

    final allDocs = <Map<String, dynamic>>[];

    for (final category in categories) {
      for (int i = 1; i <= 40; i++) {
        final firstName = firstNames[random.nextInt(firstNames.length)];
        final lastName = lastNames[random.nextInt(lastNames.length)];

        allDocs.add({
          'id': '${category.toLowerCase()}_$i',
          'name': 'Dr. $firstName $lastName',
          'category': category,
          'available_days': randomDays().take(3).toList(),
          'available_times': randomTimes().take(3).toList(),
          'bio': 'Experienced $category with over ${5 + random.nextInt(15)} years of practice.',
          'created_at': now,
        });
      }
    }

    for (final doc in allDocs) {
      await specialistsRef.doc(doc['id'] as String).set(doc);
    }

    print('✅ Seeded ${allDocs.length} specialists to Firestore.');
  }

 */
