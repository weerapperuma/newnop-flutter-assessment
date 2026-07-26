abstract class FavouritesRepository {
  Future<Set<String>> loadFavourites();
  Future<void> saveFavourites(Set<String> favourites);
}