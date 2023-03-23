// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieResponse _$MovieResponseFromJson(Map<String, dynamic> json) =>
    MovieResponse(
      json['title'] as String,
      json['id'] as int,
      json['release_date'] as String,
      json['poster_path'] as String,
      json['overview'] as String,
    );

Map<String, dynamic> _$MovieResponseToJson(MovieResponse instance) =>
    <String, dynamic>{
      'title': instance.title,
      'id': instance.id,
      'release_date': instance.releaseDate,
      'poster_path': instance.posterPath,
      'overview': instance.overview,
    };
