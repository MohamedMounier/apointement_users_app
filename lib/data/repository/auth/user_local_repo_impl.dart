import 'package:appointment_users/core/local/local_result.dart';
import 'package:appointment_users/domain/repository/auth/user_local_repo.dart';
import 'package:injectable/injectable.dart';

import '../../data_source/local/user_local_data_source.dart';

@LazySingleton(as: UserLocalRepository)
class UserLocalRepositoryImpl implements UserLocalRepository {
  final UserLocalDataSource _localDataSource;

  UserLocalRepositoryImpl(this._localDataSource);

  @override
  Future<LocalResult<void>> saveUserId(String userId) async {
    try {
      await _localDataSource.saveUserId(userId: userId);
      return const LocalResult.success(null);
    } catch (e) {
      return LocalResult.failure('Failed to save user ID');
    }
  }

  @override
  Future<LocalResult<String>> getUserId() async {
    try {
      final id = await _localDataSource.getUserToken();
      if (id.isEmpty) {
        return LocalResult.failure('No user ID found');
      }
      return LocalResult.success(id);
    } catch (e) {
      return LocalResult.failure('Failed to get user ID');
    }
  }

  @override
  Future<LocalResult<void>> deleteUserId() async {
    try {
      await _localDataSource.deleteUserToken();
      return const LocalResult.success(null);
    } catch (e) {
      return LocalResult.failure('Failed to delete user ID');
    }
  }
}
