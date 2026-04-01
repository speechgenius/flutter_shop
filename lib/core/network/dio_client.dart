import 'package:dio/dio.dart';
import 'token_storage.dart';

class DioClient {
  final Dio dio;
  final TokenStorage tokenStorage;

  DioClient(this.tokenStorage)
      : dio = Dio(
    BaseOptions(
      baseUrl: 'https://consistency.free.beeceptor.com',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
      },
    ),
  ) {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final needsAuth = options.extra['auth'] == true;

          if (needsAuth) {
            final token = await tokenStorage.get();

            if (token != null && token.isNotEmpty) {
              options.headers['Authorization'] = 'Bearer $token';
            }
          }

          handler.next(options);
        },
      ),
    );
  }

  // INTERNAL REQUEST WRAPPER (reduces duplication)
  Options _options(bool auth) {
    return Options(extra: {'auth': auth});
  }

  // ---------------- GET ----------------
  Future<Response<T>> get<T>(
      String path, {
        Map<String, dynamic>? queryParameters,
        bool auth = false,
      }) {
    return dio.get<T>(
      path,
      queryParameters: queryParameters,
      options: _options(auth),
    );
  }

  // ---------------- POST ----------------
  Future<Response<T>> post<T>(
      String path, {
        dynamic data,
        bool auth = false,
      }) {
    return dio.post<T>(
      path,
      data: data,
      options: _options(auth),
    );
  }

  // ---------------- PUT ----------------
  Future<Response<T>> put<T>(
      String path, {
        dynamic data,
        bool auth = false,
      }) {
    return dio.put<T>(
      path,
      data: data,
      options: _options(auth),
    );
  }

  // ---------------- DELETE ----------------
  Future<Response<T>> delete<T>(
      String path, {
        dynamic data,
        bool auth = false,
      }) {
    return dio.delete<T>(
      path,
      data: data,
      options: _options(auth),
    );
  }
}