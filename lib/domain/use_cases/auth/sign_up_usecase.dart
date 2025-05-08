import 'package:appointment_users/data/models/response_models/response_wrapper.dart';
import 'package:appointment_users/domain/entities/user_entity.dart';
import 'package:appointment_users/data/models/requests/sign_in_request_model.dart';
import 'package:appointment_users/data/models/requests/sign_up_request_model.dart';
import 'package:appointment_users/domain/repository/auth/auth_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SignUpUseCase {
  final AuthRepository _repository;

  SignUpUseCase(this._repository);

  Future<ResponseWrapper<UserEntity>> call(SignUpRequestModel request) {
    return _repository.signUp(request);
  }


}