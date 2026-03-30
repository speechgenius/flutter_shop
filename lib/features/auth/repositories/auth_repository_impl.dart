import '../datasources/auth_remote_datasource.dart';
import '../../../core/network/token_storage.dart';

class AuthRepositoryImpl {
  final AuthRemoteDataSource remote;
  final TokenStorage storage;

  AuthRepositoryImpl(this.remote, this.storage);

  Future<void> login(String email, String password) async {
    final data = await remote.login(email, password);

    final token = data['token'];

    if (token == null) {
      throw Exception("Token missing from response");
    }

    await storage.save(token);
  }

  Future<void> logout() async {
    await remote.logout();
    await storage.delete();
  }

  Future<bool> isLoggedIn() async {
    return await storage.hasToken();
  }
}