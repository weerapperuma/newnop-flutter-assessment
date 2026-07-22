import 'app_strings.dart';

// Export all constants for easy access
export 'app_colors.dart';
export 'app_spacing.dart';
export 'app_strings.dart';
export 'app_durations.dart';

class AppConstants {
  // ===== App Info =====
  static const String appName = AppStrings.appName;
  static const String appVersion = AppStrings.appVersion;

  // ===== Asset Paths =====
  static const String assetsPath = 'assets/';
  static const String imagesPath = 'assets/images/';
  static const String iconsPath = 'assets/icons/';
  static const String fontsPath = 'assets/fonts/';

  // ===== JSON Data =====
  static const String productsJsonPath = 'assets/products.json';
  static const String categoriesJsonPath = 'assets/categories.json';

  // ===== API Endpoints (if using real API) =====
  static const String baseUrl = 'https://api.example.com';
  static const String productsEndpoint = '/products';
  static const String categoriesEndpoint = '/categories';

  // ===== SharedPreferences Keys =====
  static const String themePreferenceKey = 'theme_preference';
  static const String favouritesKey = 'favourites';
  static const String searchHistoryKey = 'search_history';
  static const String userPreferencesKey = 'user_preferences';

  // ===== Grid/Layout =====
  static const int crossAxisCountMobile = 2;
  static const int crossAxisCountTablet = 3;
  static const int crossAxisCountDesktop = 4;

  // ===== Pagination =====
  static const int defaultPageSize = 20;
  static const int maxProductsPerPage = 50;

  // ===== Search =====
  static const int minSearchLength = 2;
  static const int maxSearchLength = 50;

  // ===== Validation =====
  static const int minPrice = 0;
  static const int maxPrice = 99999;
  static const int minProductNameLength = 2;
  static const int maxProductNameLength = 100;
  static const int maxDescriptionLength = 1000;

  // ===== Image Configuration =====
  static const double defaultImageHeight = 200.0;
  static const double defaultImageWidth = 200.0;
  static const double productImageHeight = 300.0;
  static const double productImageWidth = 240.0;

  // ===== Cache Settings =====
  static const int maxCacheAge = 3600; // 1 hour in seconds
  static const int maxCacheSize = 50; // Number of items

  // ===== Timeouts =====
  static const int connectionTimeout = 30; // seconds
  static const int receiveTimeout = 30; // seconds
  static const int sendTimeout = 30; // seconds

  // ===== Form Validation =====
  static const String emailRegex = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
  static const String phoneRegex = r'^\+?1?\d{9,15}$';
  static const String passwordRegex = r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$';
}