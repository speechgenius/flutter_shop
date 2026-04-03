import 'package:consistency/features/products/domain/entities/product.dart';

abstract class ProductRepository {
  /// Load all products (Home screen)
  Future<List<Product>> getAllProducts();

  /// Search products by query (Search screen)
  Future<List<Product>> searchProducts(String query);
}