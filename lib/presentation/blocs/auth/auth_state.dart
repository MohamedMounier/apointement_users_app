import 'package:appointment_users/data/models/user_model.dart';
import 'package:appointment_users/domain/entities/user_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';


@freezed
 class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = AuthLoading;

  const factory AuthState.logOutSuccess() = AuthLoggedOutSuccessfully;
  const factory AuthState.logOutFailure(String message) = AuthLogoutFailure;

  const factory AuthState.loginSuccess(UserEntity user) = AuthLoginSuccess;
  const factory AuthState.loginFailure(String message) = AuthLoginFailure;
  const factory AuthState.signUpSuccess(UserEntity user) = AuthSignUpSuccess;
  const factory AuthState.signUpFailure(String message) = AuthSignUpFailure;
}


