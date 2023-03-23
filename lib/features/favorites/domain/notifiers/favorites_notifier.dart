import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movies_app/common/domain/entities/movie.dart';
import 'package:movies_app/features/favorites/data/repositories/favorites_repository.dart';
import 'package:movies_app/features/favorites/domain/notifiers/favorites_state.dart';

final favoritesNotifierProvider =
    StateNotifierProvider<FavoritesNotifier, FavoritesState>(
  (ref) => FavoritesNotifier(
    ref.read(favoritesRepository),
  ),
);

class FavoritesNotifier extends StateNotifier<FavoritesState> {
  final FavoritesRepository _favoritesRepository;
  late StreamSubscription _subscription;

  FavoritesNotifier(
    this._favoritesRepository,
  ) : super(const FavoritesState.initial());

  Future<void> close() {
    _subscription.cancel();
    return close();
  }

  void load({isAdmin = false}) {
    // state = const FavoritesState.loading();
    _subscription = _favoritesRepository.favoritesSubscription.listen(
      (event) {
        if (event == null) {
          state = const FavoritesState.empty();
        } else {
          state = event.movies.isEmpty
              ? const FavoritesState.empty()
              : FavoritesState.data(movies: event);
        }
      },
    );
  }

  void addToFavorites(Movie movie) {
    _favoritesRepository.addToFavorites(movie);
    state = const FavoritesState.addedToFavorites();
  }

  void removeFromFavorites(int id) {
    _favoritesRepository.removeFromFavorites(id);
    state = const FavoritesState.removedFromFavorites();
  }
}
