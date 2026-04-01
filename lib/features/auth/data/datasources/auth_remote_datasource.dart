import 'package:consistency/core/network/dio_client.dart';

class AuthRemoteDataSource {
  final DioClient _client;

  AuthRemoteDataSource(this._client);

  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await _client.post(
      '/auth/login',
      data: {
        'email': email,
        'password': password,
      },
      auth: false,
    );

    return response.data;
  }

  Future<void> logout() async {
    await _client.post('/auth/logout'
      ,auth: false,);
  }
}