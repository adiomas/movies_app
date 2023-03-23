import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies_app/common/domain/entities/failure.dart';
import 'package:movies_app/common/domain/entities/favorites.dart';

part 'favorites_state.freezed.dart';

@freezed
class FavoritesState with _$FavoritesState {
  const factory FavoritesState.initial() = Initial;
  const factory FavoritesState.loading() = Loading;
  const factory FavoritesState.error({required Failure failure}) = Error;
  const factory FavoritesState.data({
    required Favorites? movies,
  }) = Data;
  const factory FavoritesState.addedToFavorites() = AddedToFavorites;
  const factory FavoritesState.removedFromFavorites() = RemovedFromFavorites;
  const factory FavoritesState.empty() = Empty;
}
