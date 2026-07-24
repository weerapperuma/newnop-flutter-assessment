import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../shared/models/product.dart';
import '../data/product_repository.dart';
import '../data/product_repository_impl.dart';

final productRepositoryProvider = Provider<ProductRepository>(
      (ref) => MockProductRepository(),
);

/// AsyncNotifier gives us loading/data/error states for free, and a
/// clean `refresh()` hook for the retry button.
class ProductListNotifier extends AsyncNotifier<List<Product>> {
  @override
  Future<List<Product>> build() {
    return ref.read(productRepositoryProvider).fetchProducts();
  }

  Future<void> retry() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
          () => ref.read(productRepositoryProvider).fetchProducts(),
    );
  }
}

final productListProvider =
AsyncNotifierProvider<ProductListNotifier, List<Product>>(
  ProductListNotifier.new,
);

final searchQueryProvider = StateProvider<String>((ref) => '');

/// Derived provider: filters the loaded list by the current search query.
final filteredProductsProvider = Provider<AsyncValue<List<Product>>>((ref) {
  final query = ref.watch(searchQueryProvider).trim().toLowerCase();
  final productsAsync = ref.watch(productListProvider);

  return productsAsync.whenData((products) {
    if (query.isEmpty) return products;
    return products
        .where((p) => p.name.toLowerCase().contains(query))
        .toList();
  });
});