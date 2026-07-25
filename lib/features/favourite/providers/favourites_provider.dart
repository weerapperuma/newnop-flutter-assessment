import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/constants/app_constants.dart';

class FavouritesNotifier extends StateNotifier<Set<String>> {
  FavouritesNotifier() : super({}) {
    _load();
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getStringList(AppConstants.favouritesPrefsKey) ?? [];
    state = saved.toSet();
  }

  Future<void> toggle(String productId) async {
    final updated = Set<String>.from(state);
    if (updated.contains(productId)) {
      updated.remove(productId);
    } else {
      updated.add(productId);
    }
    state = updated;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(AppConstants.favouritesPrefsKey, updated.toList());
  }

  bool isFavourite(String productId) => state.contains(productId);
}

final favouritesProvider =
StateNotifierProvider<FavouritesNotifier, Set<String>>(
      (ref) => FavouritesNotifier(),
);