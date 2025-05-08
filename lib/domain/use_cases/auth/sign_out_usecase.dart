import 'package:appointment_users/core/network/error/local_error_model.dart';
import 'package:injectable/injectable.dart';
import 'package:appointment_users/domain/repository/auth/auth_repo.dart';
import 'package:appointment_users/domain/repository/auth/user_local_repo.dart';
import 'package:appointment_users/data/models/response_models/response_wrapper.dart';

@lazySingleton
class SignOutUseCase {
  final AuthRepository _authRepository;
  final UserLocalRepository _localRepository;

  const SignOutUseCase(this._authRepository, this._localRepository);

  Future<ResponseWrapper<void>> call() async {
    final result = await _authRepository.signOut();

    return result.when(
      success: (_) async {
        final localResult = await _localRepository.deleteUserId();
        return localResult.when(
          success: (_) => const ResponseWrapper.success(null),
          failure: (msg) => ResponseWrapper.failure(LocalErrorModel(message: msg, code: 500)),
        );
      },
      failure: (msg) => ResponseWrapper.failure(msg),
    );
  }
}
