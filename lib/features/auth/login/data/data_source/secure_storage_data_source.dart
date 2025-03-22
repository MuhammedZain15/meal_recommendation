import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class SecureStorageDataSource {
  Future<void> saveToken(String token);
  Future<String?> getToken();
  Future<void> deleteToken();
}

class SecureStorageDataSourceImpl implements SecureStorageDataSource {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  @override
  Future<void> saveToken(String token) async {
    await _storage.write(key: "auth_token", value: token);
  }

  @override
  Future<String?> getToken() async {
    return await _storage.read(key: "auth_token");
  }

  @override
  Future<void> deleteToken() async {
    await _storage.delete(key: "auth_token");
  }
}
