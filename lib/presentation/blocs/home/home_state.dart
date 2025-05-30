import 'package:appointment_users/core/utils/enums/app_enums.dart';
import 'package:appointment_users/data/models/user_model.dart';
import 'package:appointment_users/domain/entities/specialist_entity.dart';
import 'package:appointment_users/domain/entities/specialization_category_entity.dart';
import 'package:appointment_users/domain/entities/user_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';


@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    UserEntity? currentUser,
    @Default(false) bool isLoading,

    String? errorMessage,
    RequestState? requestState,
    UserSteps? userSteps,
    // Specializations Categories
    @Default([]) List<SpecializationCategoryEntity> categories,
    SpecializationCategoryEntity? chosenCategory,
    @Default(false) bool isLoadingCategories,
    @Default(0) int currentIndex,

    // Specialists & Pagination
    @Default([]) List<SpecialistEntity> specialists,
    DocumentSnapshot? lastSpecialistDoc,
    @Default(false) bool hasMoreSpecialists,
    @Default(false) bool isLoadingSpecialists,
  })=_HomeState;
}

