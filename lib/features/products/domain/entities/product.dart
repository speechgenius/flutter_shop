
class Product {
  final String id;
  final String productName;
  final String category;
  final String subCategory;
  final double price;
  final int quantity;
  final String description;
  final String imageUrl;
  final String availability;

  const Product({
    required this.id,
    required this.productName,
    required this.category,
    required this.subCategory,
    required this.price,
    required this.quantity,
    required this.description,
    required this.imageUrl,
    required this.availability
});
}