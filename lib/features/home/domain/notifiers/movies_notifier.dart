import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movies_app/features/home/data/repositories/movies_repository.dart';
import 'package:movies_app/features/home/domain/notifiers/movies_state.dart';

final moviesNotifierProvider =
    StateNotifierProvider<MoviesNotifier, MoviesState>(
  (ref) => MoviesNotifier(
    ref.read(moviesRepositoryProvider),
  ),
);

class MoviesNotifier extends StateNotifier<MoviesState> {
  final MoviesRepository _moviesRepository;

  MoviesNotifier(
    this._moviesRepository,
  ) : super(MoviesState.initial());

  Future<void> getMovies() async {
    state = MoviesState.loading();

    final result = await _moviesRepository.getMovies();

    state = result.fold(
      (failure) => MoviesState.error(failure),
      (movies) => MoviesState.loaded(movies),
    );
  }
}
