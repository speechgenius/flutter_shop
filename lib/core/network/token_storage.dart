import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorage {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  static const String _key = 'auth_token';

  Future<void> save(String token) async {
    await _storage.write(key: _key, value: token);
  }

  Future<String?> get() async {
    return await _storage.read(key: _key);
  }

  Future<void> delete() async {
    await _storage.delete(key: _key);
  }

  Future<bool> hasToken() async {
    final token = await _storage.read(key: _key);
    return token != null;
  }
}