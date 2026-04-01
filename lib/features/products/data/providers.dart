import 'package:consistency/core/providers/dio_provider.dart';
import 'package:consistency/features/products/data/repositories/product_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'datasources/product_mock_datasource.dart';
import 'datasources/product_remote_datasource.dart';

final productRemoteDatasourceProvider = Provider<ProductRemoteDatasource>((ref) {
  final client = ref.read(dioClientProvider);
  return ProductRemoteDatasource(client);
});
final productMockDataSourceProvider = Provider<ProductMockDataSource>((ref){
  return ProductMockDataSource();
});

final productRepositoryProvider = Provider((ref){
final remote = ref.read(productRemoteDatasourceProvider);
final mock = ref.read(productMockDataSourceProvider);

  return ProductRepositoryImpl(
      remote: remote,
      mock: mock,
      useMock: false
  );
});