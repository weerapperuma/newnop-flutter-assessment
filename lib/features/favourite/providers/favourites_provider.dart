import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newnop_flutter_assessment/features/favourite/data/favourites_repository_impl.dart';
import '../data/favourites_repository.dart';

final favouritesRepositoryProvider = Provider<FavouritesRepository>(
      (ref) => FavouritesRepositoryImpl(),
);

class FavouritesNotifier extends StateNotifier<Set<String>> {
  final FavouritesRepository _repository;

  FavouritesNotifier(this._repository) : super({}) {
    _load();
  }

  Future<void> _load() async {
    state = await _repository.loadFavourites();
  }

  Future<void> toggle(String productId) async {
    final updated = Set<String>.from(state);
    if (updated.contains(productId)) {
      updated.remove(productId);
    } else {
      updated.add(productId);
    }
    state = updated;
    await _repository.saveFavourites(updated);
  }
}

final favouritesProvider =
StateNotifierProvider<FavouritesNotifier, Set<String>>(
      (ref) => FavouritesNotifier(ref.read(favouritesRepositoryProvider)),
);