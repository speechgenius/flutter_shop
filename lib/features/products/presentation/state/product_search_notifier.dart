import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/product.dart';
import '../../data/providers.dart';

part 'product_search_notifier.g.dart';

@riverpod
class ProductSearchNotifier extends _$ProductSearchNotifier {
  @override
  FutureOr<List<Product>> build() async {
    // initial empty state
    return [];
  }

  Future<void> search(String query) async {
    if (query.isEmpty) {
      state = const AsyncData([]);
      return;
    }

    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final repo = ref.read(productRepositoryProvider);
      return await repo.searchProducts(query);
    });
  }

  void clear() {
    state = const AsyncData([]);
  }
}