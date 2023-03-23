import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movies_app/common/domain/entities/movie.dart';
import 'package:movies_app/features/home/presentation/widgets/movie_tile.dart';

class FavoritesPageBody extends ConsumerWidget {
  final List<Movie> movies;
  const FavoritesPageBody({super.key, required this.movies});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.separated(
      separatorBuilder: (context, index) => const Divider(
        thickness: 1.5,
        color: Colors.black,
      ),
      shrinkWrap: true,
      itemCount: movies.length,
      itemBuilder: (context, index) => MovieTile(
        movie: movies[index],
      ),
    );
  }
}
