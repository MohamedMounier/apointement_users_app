import 'package:appointment_users/core/local/local_result.dart';
import 'package:appointment_users/di/di_container.dart';
import 'package:appointment_users/domain/repository/auth/user_local_repo.dart';
import 'package:injectable/injectable.dart';
@lazySingleton
class SaveUserIdUseCase {
  const SaveUserIdUseCase(this._userLocalRepository);
  final UserLocalRepository _userLocalRepository;

  Future<LocalResult<void>> call(String userId) {
    return _userLocalRepository.saveUserId(userId);
  }
}
