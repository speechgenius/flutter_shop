import '../datasources/auth_remote_datasource.dart';
import '../../../core/network/token_storage.dart';

class AuthRepositoryImpl {
  final AuthRemoteDataSource remote;
  final TokenStorage storage;

  AuthRepositoryImpl(this.remote, this.storage);

  Future<void> login(String email, String password) async {
    await remote.login(email, password);

    // Example: save token (depends on your API response)
    // await storage.saveToken(token);
  }

  Future<void> logout() async {
    // 1. Call backend logout
    await remote.logout();

    // 2. Clear local session
    // await storage.clearToken();
  }
}