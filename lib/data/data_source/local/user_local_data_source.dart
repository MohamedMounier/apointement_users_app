import 'package:appointment_users/core/services/app_prefrences.dart';
import 'package:appointment_users/core/utils/resources/app_strings.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UserLocalDataSource {
  final AppPreferences _appPref;

  const UserLocalDataSource(this._appPref);

  Future<void> saveUserId({required String userId}) async {
    await _appPref.saveDataToKey(keyName: AppStrings.userId, keyValue: userId);
  }

  Future<String> getUserToken() async {
    return await _appPref.readData(keyData: AppStrings.userId);
  }

  Future<void> deleteUserToken() async {
    await _appPref.deleteKey(keyData: AppStrings.userId);
  }
}
