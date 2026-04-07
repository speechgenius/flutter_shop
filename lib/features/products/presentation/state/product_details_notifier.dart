import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/product.dart';
import '../../data/providers.dart';

part 'product_details_notifier.g.dart';

@riverpod
class ProductDetailsNotifier extends _$ProductDetailsNotifier {
  @override
  Future<Product> build(String id) async {
    final repo = ref.read(productRepositoryProvider);

    final product = await repo.getProductById(id);
    return product;
  }
}