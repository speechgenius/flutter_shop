import 'package:consistency/core/network/dio_client.dart';

import '../../domain/entities/product.dart';

class ProductRemoteDatasource {
  final DioClient _client;

  ProductRemoteDatasource(this._client);

  /// =========================
  /// GET ALL PRODUCTS
  /// =========================
  Future<List<Product>> getAllProducts() async {
    final response = await _client.get(
      '/products',
      auth: true,
    );

    final List data = response.data;

    return data.map((e) => _mapToProduct(e)).toList();
  }

  /// =========================
  /// SEARCH PRODUCTS
  /// =========================
  Future<List<Product>> searchProducts(String query) async {
    final response = await _client.get(
      '/products/search',
      queryParameters: {'q': query},
      auth: true,
    );

    final List data = response.data;

    return data.map((e) => _mapToProduct(e)).toList();
  }

  /// =========================
  /// MAPPER (Single Source of Truth)
  /// =========================
  Product _mapToProduct(dynamic e) {
    return Product(
      productName: e['product_name'] ?? '',
      category: e['category'] ?? '',
      subCategory: e['sub_category'] ?? '',
      price: (e['price'] as num).toDouble(),
      quantity: e['quantity'] ?? 0,
      description: e['description'] ?? '',
      imageUrl: e['image_url'] ?? '',
        availability: e['availability']
    );
  }
}