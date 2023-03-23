import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movies_app/common/domain/entities/movie.dart';

part 'favorites.g.dart';

@JsonSerializable()
@HiveType(typeId: Favorites.typeId, adapterName: Favorites.boxName)
class Favorites extends HiveObject {
  static const typeId = 1;
  static const boxName = 'FavoritesAdapter';

  @HiveField(1)
  List<Movie> movies;

  Favorites(
    this.movies,
  );

  factory Favorites.fromJson(Map<String, dynamic> json) =>
      _$FavoritesFromJson(json);

  Map<String, dynamic> toJson() => _$FavoritesToJson(this);
}
