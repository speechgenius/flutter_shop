import 'package:consistency/features/products/domain/entities/product.dart';
import 'package:consistency/features/products/domain/repositories/product_repository.dart';

import '../datasources/product_mock_datasource.dart';
import '../datasources/product_remote_datasource.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductMockDataSource mock;
  final ProductRemoteDatasource remote;
  final bool useMock;

  ProductRepositoryImpl({
    required this.mock,
    required this.remote,
    required this.useMock,
  });

  /// =========================
  /// GET ALL PRODUCTS
  /// =========================
  @override
  Future<List<Product>> getAllProducts() {
    if (useMock) {
      return mock.getAllProducts();
    }
    return remote.getAllProducts();
  }

  /// =========================
  /// SEARCH PRODUCTS
  /// =========================
  @override
  Future<List<Product>> searchProducts(String query) {
    if (useMock) {
      return mock.searchProducts(query);
    }
    return remote.searchProducts(query);
  }
}