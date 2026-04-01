
import 'package:consistency/features/products/domain/entities/product.dart';

abstract class ProductRepository{
  Future<List<Product>> searchProducts(String query);
}