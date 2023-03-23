import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable()
@HiveType(typeId: Movie.typeId, adapterName: Movie.boxName)
class Movie extends HiveObject {
  static const typeId = 2;
  static const boxName = 'MovieAdapter';

  @HiveField(1)
  String? title;
  @HiveField(2)
  int? id;
  @HiveField(3)
  String? releaseDate;
  @HiveField(4)
  String? posterPath;
  @HiveField(5)
  String? overview;

  Movie(
    this.title,
    this.id,
    this.releaseDate,
    this.posterPath,
    this.overview,
  );

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}
