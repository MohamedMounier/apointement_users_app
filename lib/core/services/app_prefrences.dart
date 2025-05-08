// lib/data/preferences/app_preferences.dart
import 'package:appointment_users/core/utils/resources/app_strings.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AppPreferences {
  final FlutterSecureStorage _secureStorage;

  const AppPreferences(this._secureStorage);

  Future<String> readData({required String keyData}) async {
    return await _secureStorage.read(key:keyData)??"";
  }

  Future<void> deleteKey({required String keyData}) async {
    await _secureStorage.delete(key:keyData);
  }

  Future<void> saveDataToKey({required String keyName,required String keyValue}) async {
    await _secureStorage.write(key: keyName, value: keyValue);

  }
}
