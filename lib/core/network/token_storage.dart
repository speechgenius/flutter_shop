import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorage {
  final _storage = const FlutterSecureStorage();
  static const _key = 'token';

  Future<void> save(String token) async {
    await _storage.write(key: _key, value: token);
  }

  Future<String?> get() async {
    return await _storage.read(key: _key);
  }
}