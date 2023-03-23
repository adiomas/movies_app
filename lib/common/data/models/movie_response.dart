import 'package:json_annotation/json_annotation.dart';
import 'package:movies_app/common/domain/entities/movie.dart';

part 'movie_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MovieResponse {
  final String title;
  final int id;
  final String releaseDate;
  final String posterPath;
  final String overview;

  MovieResponse(
    this.title,
    this.id,
    this.releaseDate,
    this.posterPath,
    this.overview,
  );

  factory MovieResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieResponseToJson(this);

  Movie toDomain() => Movie(
        title,
        id,
        releaseDate,
        posterPath,
        overview,
      );
}
