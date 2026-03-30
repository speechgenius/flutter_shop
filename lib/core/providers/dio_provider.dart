import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../network/dio_client.dart';
import '../network/token_storage.dart';

final tokenStorageProvider = Provider((ref) => TokenStorage());

final dioProvider = Provider((ref) {
  final client = DioClient();
  return client.dio;
});