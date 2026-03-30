import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/providers/dio_provider.dart';
import '../../../core/network/token_storage.dart';
import '../datasources/auth_remote_datasource.dart';
import '../repositories/auth_repository_impl.dart';

final authDataSourceProvider = Provider((ref) {
  final dio = ref.watch(dioProvider);
  return AuthRemoteDataSource(dio);
});

final authRepositoryProvider = Provider((ref) {
  final remote = ref.watch(authDataSourceProvider);
  final storage = ref.watch(tokenStorageProvider);

  return AuthRepositoryImpl(remote, storage);
});