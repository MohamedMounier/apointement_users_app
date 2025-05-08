import 'package:appointment_users/core/local/local_result.dart';


abstract class UserLocalRepository {
  Future<LocalResult<void>> saveUserId(String userId);
  Future<LocalResult<String>> getUserId();
  Future<LocalResult<void>> deleteUserId();
}
