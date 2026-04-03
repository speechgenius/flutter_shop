import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/product.dart';
import '../../data/providers.dart';

part 'product_search_notifier.g.dart';

@riverpod
class ProductSearchNotifier extends _$ProductSearchNotifier {
  @override
  FutureOr<List<Product>> build() async {
    final repo = ref.read(productRepositoryProvider);

    // 🔥 HomePage uses this
    return await repo.getAllProducts();
  }

  Future<void> search(String query) async {
    final repo = ref.read(productRepositoryProvider);

    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      if (query.isEmpty) {
        // 🔥 Back to ALL products
        return await repo.getAllProducts();
      }

      return await repo.searchProducts(query);
    });
  }
}