import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movies_app/common/data/api_client.dart';
import 'package:movies_app/common/data/error_to_failure_mixin.dart';
import 'package:movies_app/common/data/providers.dart';
import 'package:movies_app/common/domain/either_failure_or.dart';
import 'package:movies_app/common/domain/entities/movie.dart';

final moviesRepositoryProvider = Provider<MoviesRepository>(
  (ref) => MoviesRepositoryImpl(
    ref.watch(apiClientProvider),
  ),
);

abstract class MoviesRepository {
  EitherFailureOr<List<Movie>> getMovies();
}

class MoviesRepositoryImpl
    with ErrorToFailureMixin
    implements MoviesRepository {
  final ApiClient _apiClient;

  MoviesRepositoryImpl(this._apiClient);

  @override
  EitherFailureOr<List<Movie>> getMovies() => execute(() async {
        final documentsResponse = await _apiClient.getMovies();
        return Right(
          documentsResponse.results.map((e) => e.toDomain()).toList(),
        );
      });
}
