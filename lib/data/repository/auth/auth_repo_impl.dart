import 'package:appointment_users/data/data_source/remote/auth_data_source.dart';
import 'package:appointment_users/data/models/response_models/response_wrapper.dart';
import 'package:appointment_users/data/models/requests/sign_in_request_model.dart';
import 'package:appointment_users/data/models/requests/sign_up_request_model.dart';
import 'package:appointment_users/domain/entities/user_entity.dart';
import 'package:appointment_users/domain/repository/auth/auth_repo.dart';
import 'package:injectable/injectable.dart';
@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource _dataSource;

  AuthRepositoryImpl(this._dataSource);

  @override
  Future<ResponseWrapper<UserEntity>> signIn(SignInRequestModel request) async {
    final result = await _dataSource.signIn(request);
    return result.when(
      success: (model) => ResponseWrapper.success(model.toEntity()),
      failure: (error) => ResponseWrapper.failure(error),
    );
  }
  @override
  Future<ResponseWrapper<UserEntity>> signUp(SignUpRequestModel request) async {
    final result = await _dataSource.signUp(request);
    return result.when(
      success: (model) => ResponseWrapper.success(model.toEntity()),
      failure: (error) => ResponseWrapper.failure(error),
    );
  }
  @override
  Future<ResponseWrapper<UserEntity>> fetchUserByUid(String userId) async {
    final result = await _dataSource.fetchUserByUid(userId);
    return result.when(
      success: (model) => ResponseWrapper.success(model.toEntity()),
      failure: (error) => ResponseWrapper.failure(error),
    );
  }
  @override
  Future<ResponseWrapper<void>> signOut() async {
    final result = await _dataSource.signOut();
    return result.when(
      success: (model) => ResponseWrapper.success(null),
      failure: (error) => ResponseWrapper.failure(error),
    );
  }
}