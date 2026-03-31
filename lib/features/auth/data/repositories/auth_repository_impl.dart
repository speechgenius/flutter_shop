import '../../data/datasources/auth_remote_datasource.dart';
import '../../../../core/network/token_storage.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remote;
  final TokenStorage storage;

  AuthRepositoryImpl(this.remote, this.storage);

  @override
  Future<void> login(String email, String password) async {
    final data = await remote.login(email, password);

    final token = data['token'];

    if (token == null) {
      throw Exception("Token missing from response");
    }

    await storage.save(token);
  }

  @override
  Future<void> logout() async {
    await remote.logout();
    await storage.delete();
  }

  @override
  Future<bool> isLoggedIn() async {
    return await storage.hasToken();
  }
}