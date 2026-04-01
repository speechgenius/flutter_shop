import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/search_form.dart';
import '../state/product_search_notifier.dart';


class ProductSearchPage extends ConsumerWidget {
  const ProductSearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchState = ref.watch(productSearchNotifierProvider);
    final notifier = ref.read(productSearchNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: SearchForm(
              onChanged: (value) {
                notifier.search(value);
              },
              onFieldSubmitted: (value) {
                notifier.search(value);
              },
            ),
          ),

          Expanded(
            child: searchState.when(
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              error: (error, stack) => Center(
                child: Text('Error: $error'),
              ),
              data: (products) {
                if (products.isEmpty) {
                  return const Center(
                    child: Text('No products found'),
                  );
                }

                return ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];

                    return ListTile(
                      title: Text(product.productName),
                      subtitle: Text(product.category),
                      trailing: Text(
                        product.price.toStringAsFixed(2),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}