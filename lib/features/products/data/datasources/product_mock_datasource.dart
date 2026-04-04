import 'package:consistency/features/products/domain/entities/product.dart';

class ProductMockDataSource {
  Future<List<Product>> getAllProducts() async {
    await Future.delayed(const Duration(milliseconds: 30));

    return _products;
  }

  Future<List<Product>> searchProducts(String query) async {
    await Future.delayed(const Duration(milliseconds: 30));

    final q = query.toLowerCase();

    return _products.where((p) {
      return p.productName.toLowerCase().contains(q) ||
          p.category.toLowerCase().contains(q) ||
          p.subCategory.toLowerCase().contains(q);
    }).toList();
  }

  // 🔥 Move products here (shared source)
  final List<Product> _products = const [
    Product(
      productName: "MacBook Air M2 (13-inch)",
      category: "Electronics",
      subCategory: "Laptops",
      price: 1850000,
      quantity: 10,
      description: "Apple MacBook Air M2 chip...",
      imageUrl: "https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=800",
      availability: ""
    ),
    Product(
      productName: "MacBook Pro 14-inch M3",
      category: "Electronics",
      subCategory: "Laptops",
      price: 3200000,
      quantity: 5,
      description: "MacBook Pro 14-inch M3...",
      imageUrl: "https://images.unsplash.com/photo-1511385348-a52b4a160dc2?w=800",
        availability: ""
    ),
    Product(
      productName: "MacBook Pro 16-inch M3 Max",
      category: "Electronics",
      subCategory: "Laptops",
      price: 4500000,
      quantity: 3,
      description: "MacBook Pro 16-inch M3 Max...",
      imageUrl: "https://images.unsplash.com/photo-1496181133206-80ce9b88a853?w=800",
        availability: ""
    ),
    Product(
      productName: "MacBook Air M1 (13-inch)",
      category: "Electronics",
      subCategory: "Laptops",
      price: 1450000,
      quantity: 15,
      description: "MacBook Air M1 chip...",
      imageUrl: "https://images.unsplash.com/photo-1525547719571-a2d4ac8945e2?w=800",
        availability: ""
    ),
  ];
}