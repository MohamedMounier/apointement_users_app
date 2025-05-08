import 'package:appointment_users/data/models/response_models/response_wrapper.dart';
import 'package:appointment_users/domain/entities/user_entity.dart';
import 'package:appointment_users/data/models/requests/sign_in_request_model.dart';
import 'package:appointment_users/data/models/requests/sign_up_request_model.dart';

abstract class AuthRepository {
  Future<ResponseWrapper<UserEntity>> signUp(SignUpRequestModel request);
  Future<ResponseWrapper<UserEntity>> signIn(SignInRequestModel request);
  Future<ResponseWrapper<void>> signOut();
  Future<ResponseWrapper<UserEntity>> fetchUserByUid(String userId);
}