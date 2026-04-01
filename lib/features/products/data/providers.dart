import 'package:consistency/core/providers/dio_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'datasources/product_mock_datasource.dart';
import 'datasources/product_remote_datasource.dart';

final productRemoteDatasourceProvider = Provider<ProductRemoteDatasource>((ref) {
  final dio = ref.read(dioClientProvider);
  return ProductRemoteDatasource(dio);
});
final productMockDataSourceProvider = Provider<ProductMockDataSource>((ref){
  return ProductMockDataSource();
});

final ProductRepositoryProvider = Provider(_createFn);