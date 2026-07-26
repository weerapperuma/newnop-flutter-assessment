import 'package:newnop_flutter_assessment/core/constants/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'favourites_repository.dart';

class FavouritesRepositoryImpl implements FavouritesRepository {
  @override
  Future<Set<String>> loadFavourites() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getStringList(AppConstants.favouritesPrefsKey) ?? [];
    return saved.toSet();
  }

  @override
  Future<void> saveFavourites(Set<String> favourites) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
      AppConstants.favouritesPrefsKey,
      favourites.toList(),
    );
  }

}