import 'package:appointment_users/core/utils/enums/app_enums.dart';
import 'package:appointment_users/domain/entities/user_entity.dart';
import 'package:appointment_users/domain/use_cases/auth/fetch_user_by_uid_usecase.dart';
import 'package:appointment_users/domain/use_cases/auth/get_user_id_use_case.dart';
import 'package:appointment_users/domain/use_cases/auth/save_user_id_usecase.dart';
import 'package:appointment_users/domain/use_cases/auth/sign_out_usecase.dart';
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

  HomeCubit(
    this._signOutUseCase,
    this._fetchUserByIdCase,
    this._getUserIdUseCase,
    this._saveUserIdUseCase,
  ) : super(
        HomeState(
          requestState: RequestState.none,
          errorMessage: '',
          isLoading: false,
          currentUser: null,
          userSteps: UserSteps.none,
        ),
      );

  Future<void> getUserBySavedLocalUid() async {
    emit(state.copyWith(requestState: RequestState.loading));

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
    emit(state.copyWith(requestState: RequestState.loading));
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
}
