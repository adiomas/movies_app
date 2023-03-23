import 'package:json_annotation/json_annotation.dart';
import 'package:movies_app/common/data/models/movie_response.dart';

part 'movies_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MoviesResponse {
  final List<MovieResponse> results;

  MoviesResponse(
    this.results,
  );

  factory MoviesResponse.fromJson(Map<String, dynamic> json) =>
      _$MoviesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MoviesResponseToJson(this);
}
