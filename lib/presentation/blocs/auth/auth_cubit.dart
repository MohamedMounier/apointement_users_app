import 'package:appointment_users/data/models/requests/sign_in_request_model.dart';
import 'package:appointment_users/data/models/requests/sign_up_request_model.dart';
import 'package:appointment_users/domain/use_cases/auth/sign_in_usecase.dart';
import 'package:appointment_users/domain/use_cases/auth/sign_up_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._signInUseCase, this._signUpUseCase)
    : super(const AuthState.initial());
  final SignInUseCase _signInUseCase;
  final SignUpUseCase _signUpUseCase;


  Future<void> login(SignInRequestModel signInRequestModel) async {
    emit(AuthState.loading());
    try {
      final result = await _signInUseCase(signInRequestModel);
      result.when(
        success: (success) {
          emit(AuthState.loginSuccess(success));
        },
        failure: (failure) {
          emit(AuthState.loginFailure(failure.message));
        },
      );
    } catch (e) {
      emit(AuthState.loginFailure(e.toString()));
    }
  }

  Future<void> signUp(SignUpRequestModel signUpRequestModel) async {
    emit(AuthState.loading());
    try {
      final result = await _signUpUseCase(signUpRequestModel);
      result.when(
        success: (user) {
          emit(AuthState.signUpSuccess(user));
        },
        failure: (failure) {
          emit(AuthState.signUpFailure(failure.message));
        },
      );
    } catch (e) {
      emit(AuthState.signUpFailure(e.toString()));
    }
  }
}
