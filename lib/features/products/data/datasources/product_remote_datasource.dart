import 'package:consistency/core/network/dio_client.dart';
import 'package:dio/dio.dart';

import '../../domain/entities/product.dart';

class ProductRemoteDatasource {
  final DioClient _client;
  ProductRemoteDatasource(this._client);

  Future<List<Product>> searchProducts(String query) async {
    final response = await _client.get(
      '/products/search',
      queryParameters: {'q': query},
      auth: false,
    );
    final List data = response.data;

    return data.map((e){ return Product(
  productName: e['product_name'],
  category: e['category'],
  subCategory: e['sub_category'],
  price: (e['price'] as num).toDouble(),
  description: e['description'], quantity: e['quantity']
);
    }).toList();
  }
}