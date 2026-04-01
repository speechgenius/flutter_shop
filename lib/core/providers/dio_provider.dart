import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../network/dio_client.dart';
import '../network/token_storage.dart';

final tokenStorageProvider = Provider<TokenStorage>((ref) {
  return TokenStorage();
});

final dioClientProvider = Provider<DioClient>((ref) {
  final tokenStorage = ref.read(tokenStorageProvider);
  return DioClient(tokenStorage);
});