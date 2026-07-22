# newnop_flutter_assessment

# samples, guidance on mobile development, and a full API reference.

- app/ — top-level app shell only (the widget tree root, theming applied, routing). Nothing feature-specific lives here.
- core/ — cross-cutting infrastructure that isn't tied to any one feature: theme engine, constants, network setup if you add a real API later.
- shared/ — reusable pieces that more than one feature touches: the Product model (used by both list and details) and generic UI states (loading/error/empty) reused across screens.
- features/ — this is where app/core/shared alone usually falls short, since it gives no home for screen + feature-specific logic. Splitting products and favourites as separate features keeps each one's data/providers/screens/widgets together, and maps directly to how you'd explain "state-management approach" in your README (one provider per feature, not one giant global provider).

lib/
├── app/
│   ├── app.dart                    // MaterialApp widget, wraps theme + home route
│   └── router.dart                 // (optional) route names/generator if you don't want raw MaterialPageRoute inline
│
├── core/
│   ├── constants/
│   │   └── app_constants.dart      // spacing values, durations, asset paths
│   ├── theme/
│   │   ├── app_theme.dart          // light + dark ThemeData
│   │   └── theme_provider.dart     // Riverpod StateNotifier for ThemeMode + persistence
│   ├── network/                    // (skip if using local JSON only; add if you hit a real API)
│   │   └── api_client.dart
│   └── utils/
│       └── result.dart             // optional: sealed Result<T> type for success/error handling
│
├── shared/
│   ├── widgets/
│   │   ├── loading_view.dart
│   │   ├── error_view.dart         // icon + message + retry button
│   │   └── empty_view.dart         // icon + message, configurable text
│   └── models/
│       └── product.dart            // shared across features (list + details both use it)
│
├── features/
│   ├── products/
│   │   ├── data/
│   │   │   └── product_repository.dart     // abstract + mock impl, loads assets/products.json
│   │   ├── providers/
│   │   │   ├── product_list_provider.dart  // FutureProvider/AsyncNotifier for fetch + loading/error state
│   │   │   └── search_query_provider.dart  // StateProvider<String>
│   │   ├── screens/
│   │   │   ├── product_list_screen.dart
│   │   │   └── product_details_screen.dart
│   │   └── widgets/
│   │       ├── product_card.dart
│   │       └── product_search_bar.dart
│   │
│   └── favourites/
│       ├── data/
│       │   └── favourites_repository.dart  // wraps shared_preferences read/write
│       └── providers/
│           └── favourites_provider.dart    // StateNotifier<Set<String>>
│
└── main.dart                       // ProviderScope wraps App()