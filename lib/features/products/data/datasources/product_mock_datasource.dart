import 'package:consistency/features/products/domain/entities/product.dart';

class ProductMockDataSource {
  Future<List<Product>> searchProducts(String query) async {
    await Future.delayed(const Duration(milliseconds: 30));
    final products = <Product>[
      const Product(productName: "productName", category: "category", subCategory: "subCategory", price: 10000, quantity: 20, description: "description"),
      const Product(
        productName: "MacBook Pro",
        category: "Electronics",
        subCategory: "Laptops",
        price: 2500000,
        quantity: 5,
        description: ''
      ),
    ];

    final q = query.toLowerCase();

    return products.where((p) {
      return p.productName.toLowerCase().contains(q) || p.category.toLowerCase().contains(q) || p.subCategory.toLowerCase().contains(q);
    }).toList();
  }
}