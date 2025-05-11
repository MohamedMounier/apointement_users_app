import 'package:appointment_users/core/utils/enums/app_enums.dart';
import 'package:appointment_users/data/data_source/remote/const_collections.dart';
import 'package:appointment_users/domain/entities/specialization_category_entity.dart';
import 'package:appointment_users/domain/entities/user_entity.dart';
import 'package:appointment_users/domain/use_cases/auth/fetch_user_by_uid_usecase.dart';
import 'package:appointment_users/domain/use_cases/auth/get_user_id_use_case.dart';
import 'package:appointment_users/domain/use_cases/auth/save_user_id_usecase.dart';
import 'package:appointment_users/domain/use_cases/auth/sign_out_usecase.dart';
import 'package:appointment_users/domain/use_cases/specialists/get_specialists_by_category_usecase.dart';
import 'package:appointment_users/domain/use_cases/specialists/get_specializations_categories_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final SignOutUseCase _signOutUseCase;
  final GetUserIdUseCase _getUserIdUseCase;
  final SaveUserIdUseCase _saveUserIdUseCase;
  final FetchUserByIdCase _fetchUserByIdCase;
  final GetSpecialistsByCategoryUseCase _getSpecialistsByCategory;
  final GetSpecializationCategoriesUseCase _getCategories;

  HomeCubit(
    this._signOutUseCase,
    this._fetchUserByIdCase,
    this._getUserIdUseCase,
    this._saveUserIdUseCase, this._getSpecialistsByCategory, this._getCategories,
  ) : super(
        HomeState(
          requestState: RequestState.none,
          errorMessage: '',
          isLoading: false,
          currentUser: null,
          userSteps: UserSteps.none,
        ),
      );


  Future<void> loadMoreSpecialists() async {
    if (!state.hasMoreSpecialists || state.isLoadingSpecialists) return;

    emit(state.copyWith(isLoadingSpecialists: true));

    final result = await _getSpecialistsByCategory(
      categoryName: state.chosenCategory!.name,
      startAfter: state.lastSpecialistDoc,
    );

    result.when(
      success: (page) {
        emit(state.copyWith(
          specialists: [...state.specialists, ...page.data],
          lastSpecialistDoc: page.lastDoc,
          hasMoreSpecialists: page.data.length == ConstFirebaseData.itemsCountPerPage,
          isLoadingSpecialists: false,
        ));
      },
      failure: (err) => emit(state.copyWith(
        errorMessage: err.message,
        isLoadingSpecialists: false,
      )),
    );
  }
  Future<void> loadInitialSpecialists(String categoryName) async {
    debugPrint('Called loadInitialSpecialists');
    emit(state.copyWith(
      isLoadingSpecialists: true,
      specialists: [],
      lastSpecialistDoc: null,
      hasMoreSpecialists: true,
      requestState: RequestState.loading
    ));

    final result = await _getSpecialistsByCategory(
      categoryName: categoryName,
    );

    result.when(
      success: (page) {
        debugPrint('Result loadInitialSpecialists Success and data is ${page.data} Current user is ${state.currentUser}');

        emit(state.copyWith(
          specialists: page.data,
          lastSpecialistDoc: page.lastDoc,
          hasMoreSpecialists: page.data.length == ConstFirebaseData.itemsCountPerPage,
          userSteps: UserSteps.isLoadedSpecialists,
          requestState: RequestState.success,
          isLoadingSpecialists: false,
        ));
      },
      failure: (err){
        debugPrint('Result loadInitialSpecialists Error and error  is ${err.message}');
        emit(state.copyWith(
          errorMessage: err.message,
          isLoadingSpecialists: false,
          specialists: [],
          requestState: RequestState.error,
          userSteps: UserSteps.isLoadedSpecialists,

        ));
      },
    );
  }
  Future<void> getUserBySavedLocalUid() async {
    emit(state.copyWith(requestState: RequestState.loading,currentUser: null));

    final localResult = await _getUserIdUseCase();
    localResult.when(
      success: (right) async {
        debugPrint('getUserBySavedLocalUid Success and uid is ${right}');
        if (right.isNotEmpty) {
          debugPrint('getUserBySavedLocalUid Success and uid is ${right}');
          final result = await _fetchUserByIdCase(right);
          result.when(
            success: (user) {
              debugPrint(
                'getUserBySavedLocalUid Success and Fetched User by uid is name  ${user.name}',
              );
              setUser(user);
            },
            failure: (failure) {
              debugPrint(
                'getUserBySavedLocalUid Success and Fetched User by uid Failed  ${failure.message}',
              );
              clearUser();
            },
          );
        }
      },
      failure: (failureMsg) {
        debugPrint('getUserBySavedLocalUid Failed   ${failureMsg}');

        emit(
          state.copyWith(
            errorMessage: failureMsg,
            requestState: RequestState.error,
            currentUser: UserEntity.anonymous(),
          ),
        );
      },
    );
  }

  Future<void> logout() async {
    emit(state.copyWith(requestState: RequestState.loading));
    try {
      final result = await _signOutUseCase();
      result.when(
        success: (success) async{
         final resultLocal=await _saveUserIdUseCase('');
          resultLocal.when(
            success: (success) {
              emit(
                state.copyWith(
                  userSteps: UserSteps.isUserLoggedOut,
                  requestState: RequestState.success,
                  currentUser: UserEntity.anonymous(),
                ),
              );
            },
            failure: (failureMessage) {
              emit(
                state.copyWith(
                  userSteps: UserSteps.none,
                  requestState: RequestState.error,
                  currentUser: UserEntity.anonymous(),
                  errorMessage: failureMessage,
                ),
              );
            },
          );
        },
        failure: (failure) {
          emit(
            state.copyWith(
              userSteps: UserSteps.none,
              requestState: RequestState.error,
              errorMessage: failure.message,
            ),
          );
        },
      );
    } catch (e) {
      emit(
        state.copyWith(
          userSteps: UserSteps.none,
          requestState: RequestState.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  void setUser(UserEntity user) {
    emit(
      state.copyWith(
        currentUser: user,
        userSteps: UserSteps.isFetchedUser,
        requestState: RequestState.success,
      ),
    );
  }

  Future<void> setUserAndSaveUid(UserEntity user) async {
    emit(state.copyWith(requestState: RequestState.loading));
    final result = await _saveUserIdUseCase(user.uid);
    result.when(
      success: (success) {
        emit(
          state.copyWith(
            currentUser: user,
            userSteps: UserSteps.isFetchedUser,
            requestState: RequestState.success,
          ),
        );
      },
      failure: (failureMsg) {
        emit(
          state.copyWith(
            currentUser: user,
            errorMessage: failureMsg,
            userSteps: UserSteps.none,
            requestState: RequestState.error,
          ),
        );
      },
    );
  }

  void clearUser() {
    emit(state.copyWith(requestState: RequestState.loading));

    emit(
      state.copyWith(
        currentUser: UserEntity.anonymous(),
        userSteps: UserSteps.isResettingUser,
        requestState: RequestState.success,
        errorMessage: '',
      ),
    );
  }
  Future<void> getCategories() async {
    emit(state.copyWith(requestState: RequestState.loading,
        userSteps: UserSteps.isLoadingCategories));
    final result = await _getCategories();
    debugPrint('Called getCategories');
    result.when(
      success: (categories) {
        debugPrint('Success getCategories');

        emit(state.copyWith(
          categories: categories,
          chosenCategory: categories.first,
          requestState: RequestState.success,
          userSteps: UserSteps.isFetchedCategories,
        ));
        loadInitialSpecialists(categories.first.name);
      },
      failure: (failure) {
        debugPrint('Failed getCategories');

        emit(state.copyWith(
          categories: [],
          errorMessage: failure.message,
          requestState: RequestState.error,
          userSteps: UserSteps.isFetchedCategories,

        ));
      },
    );
  }
  void chooseCategory(SpecializationCategoryEntity category) {
    emit(state.copyWith(
      chosenCategory: category,
      userSteps: UserSteps.isChangedCategory,
      requestState: RequestState.none,
    ));
    loadInitialSpecialists(category.name);
  }
  void changeCurrentScreenNavIndex(int index){
    emit(state.copyWith(isLoading: false,userSteps: UserSteps.none,requestState: RequestState.none,currentIndex:index));
  }
}
