import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies_app/common/domain/entities/failure.dart';
import 'package:movies_app/common/domain/entities/movie.dart';

part 'movies_state.freezed.dart';

@freezed
class MoviesState with _$MoviesState {
  factory MoviesState.initial() = Initial;
  factory MoviesState.loading() = Loading;
  factory MoviesState.loaded(List<Movie> movies) = Loaded;
  factory MoviesState.error(Failure failure) = Error;
}
