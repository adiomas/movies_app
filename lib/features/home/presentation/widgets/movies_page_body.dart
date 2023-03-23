import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movies_app/features/home/domain/notifiers/movies_notifier.dart';
import 'package:movies_app/features/home/presentation/widgets/movie_tile.dart';

class MoviesPageBody extends ConsumerWidget {
  const MoviesPageBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final moviesState = ref.watch(moviesNotifierProvider);
    return moviesState.maybeWhen(
      orElse: () => Container(),
      loaded: (movies) => ListView.separated(
        separatorBuilder: (context, index) => const Divider(
          thickness: 1.5,
          color: Colors.black,
        ),
        shrinkWrap: true,
        itemCount: movies.length,
        itemBuilder: (context, index) => MovieTile(
          movie: movies[index],
        ),
      ),
    );
  }
}
