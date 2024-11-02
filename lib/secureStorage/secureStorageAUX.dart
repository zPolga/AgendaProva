import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageAux {
  static final _storage = FlutterSecureStorage();
  static const _tokenKey = 'userToken';

  static Future<void> saveToken(String token) async {
    try {
      await _storage.write(key: _tokenKey, value: token);
    } catch (e) {
      print('Error saving token: $e');
    }
  }

  static Future<String?> getToken() async {
    try {
      return await _storage.read(key: _tokenKey);
    } catch (e) {
      print('Error retrieving token: $e');
      return null;
    }
  }
}
