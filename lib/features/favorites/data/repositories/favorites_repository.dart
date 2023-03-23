import 'dart:async';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movies_app/common/domain/entities/favorites.dart';
import 'package:movies_app/common/domain/entities/movie.dart';

final favoritesRepository = Provider<FavoritesRepository>(
  (ref) => FavoritesRepositoryImpl(),
);

abstract class FavoritesRepository {
  Stream<Favorites?> get favoritesSubscription;
  void addToFavorites(Movie movie);
  void removeFromFavorites(int id);
}

class FavoritesRepositoryImpl implements FavoritesRepository {
  final _controller = StreamController<Favorites?>.broadcast();
  late Box<Favorites?> _cachedFavoritesBox;
  late StreamSubscription<BoxEvent> _hiveSubscription;

  FavoritesRepositoryImpl() {
    initilize();
  }

  Future<void> initilize() async {
    _cachedFavoritesBox = Hive.box<Favorites>(Favorites.boxName);
    _hiveSubscription = _cachedFavoritesBox
        .watch(key: 0)
        .listen((event) => _controller.sink.add(event.value as Favorites?));
  }

  @override
  void dispose() {
    _hiveSubscription.cancel();
    _controller.close();
  }

  @override
  Stream<Favorites?> get favoritesSubscription =>
      _controller.stream.asBroadcastStream(
        onListen: (_) {
          final item = _cachedFavoritesBox.get(0);
          if (item != null) {
            _controller.sink.add(item);
          }
        },
      );

  @override
  void addToFavorites(movie) {
    final favorites = _cachedFavoritesBox.get(0);
    if (favorites == null) {
      _cachedFavoritesBox.put(0, Favorites([movie]));
    } else {
      favorites.movies.add(movie);
      _cachedFavoritesBox.put(0, favorites);
    }
  }

  @override
  void removeFromFavorites(int id) {
    final favorites = _cachedFavoritesBox.get(0);
    if (favorites != null) {
      favorites.movies.removeWhere((element) => element.id == id);
      _cachedFavoritesBox.put(0, favorites);
    }
  }
}
