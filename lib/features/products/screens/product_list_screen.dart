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

  int _crossAxisCountFor(double width) {
    if (width >= 900) return 4; // large tablets / landscape tablets
    if (width >= 600) return 3; // small tablets / large phones landscape
    return 2; // phones
  }

  double _aspectRatioFor(double availableWidth, int crossAxisCount) {
    // Dynamic aspect ratio calculation based on available width:
    // Card height = Card width (1:1 image) + target text details height (~116px)
    const double crossAxisSpacing = 12.0;
    final cardWidth = (availableWidth - (crossAxisSpacing * (crossAxisCount - 1))) / crossAxisCount;
    const double targetTextHeight = 116.0;
    return cardWidth / (cardWidth + targetTextHeight);
  }

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
            icon: Icon(
              themeMode == ThemeMode.dark ? Icons.dark_mode : Icons.light_mode,
            ),
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
                  message:
                  'Could not load products. Check your connection and try again.',
                  onRetry: () =>
                      ref.read(productListProvider.notifier).retry(),
                ),
                data: (products) {
                  if (products.isEmpty) {
                    return EmptyView(
                      icon: searchQuery.isEmpty
                          ? Icons.inventory_2_outlined
                          : Icons.search_off,
                      message: searchQuery.isEmpty
                          ? 'No products available.'
                          : 'No results for "$searchQuery".',
                    );
                  }
                  return LayoutBuilder(
                    builder: (context, constraints) {
                      final crossAxisCount =
                      _crossAxisCountFor(constraints.maxWidth);
                      final aspectRatio = _aspectRatioFor(constraints.maxWidth, crossAxisCount);

                      return GridView.builder(
                        itemCount: products.length,
                        gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: crossAxisCount,
                          mainAxisSpacing: 12,
                          crossAxisSpacing: 12,
                          childAspectRatio: aspectRatio,
                        ),
                        itemBuilder: (context, index) {
                          final product = products[index];
                          return ProductCard(
                            product: product,
                            isFavourite: favourites.contains(product.id),
                            onFavouriteToggle: () => ref
                                .read(favouritesProvider.notifier)
                                .toggle(product.id),
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    ProductDetailsScreen(product: product),
                              ),
                            ),
                          );
                        },
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
