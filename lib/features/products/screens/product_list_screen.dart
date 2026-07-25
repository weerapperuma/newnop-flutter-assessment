import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/theme_provider.dart';
import '../../../shared/widgets/loading_view.dart';
import '../../../shared/widgets/error_view.dart';
import '../../../shared/widgets/empty_view.dart';
import '../../favourite/providers/favourites_provider.dart';
import '../providers/product_list_provider.dart';
import '../widgets/product_card.dart';
import '../widgets/product_search_bar.dart';
import 'product_details_screen.dart';

class ProductListScreen extends ConsumerWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filtered = ref.watch(filteredProductsProvider);
    final favourites = ref.watch(favouritesProvider);
    final searchQuery = ref.watch(searchQueryProvider);
    final themeMode = ref.watch(themeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          IconButton(
            icon: Icon(themeMode == ThemeMode.dark ? Icons.dark_mode : Icons.light_mode),
            onPressed: () => ref.read(themeProvider.notifier).toggle(),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const ProductSearchBar(),
            const SizedBox(height: 16),
            Expanded(
              child: filtered.when(
                loading: () => const LoadingView(),
                error: (err, _) => ErrorView(
                  message: 'Could not load products. Check your connection and try again.',
                  onRetry: () => ref.read(productListProvider.notifier).retry(),
                ),
                data: (products) {
                  if (products.isEmpty) {
                    return EmptyView(
                      icon: searchQuery.isEmpty ? Icons.inventory_2_outlined : Icons.search_off,
                      message: searchQuery.isEmpty
                          ? 'No products available.'
                          : 'No results for "$searchQuery".',
                    );
                  }
                  return GridView.builder(
                    itemCount: products.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: 0.52,
                    ),
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return ProductCard(
                        product: product,
                        isFavourite: favourites.contains(product.id),
                        onFavouriteToggle: () =>
                            ref.read(favouritesProvider.notifier).toggle(product.id),
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ProductDetailsScreen(product: product),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}