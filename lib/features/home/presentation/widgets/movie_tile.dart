// ignore_for_file: prefer_single_quotes

import 'package:beamer/beamer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movies_app/common/domain/entities/movie.dart';
import 'package:movies_app/features/favorites/domain/notifiers/favorites_notifier.dart';
import 'package:movies_app/features/home/presentation/pages/movie_page.dart';

class MovieTile extends ConsumerWidget {
  final Movie movie;
  const MovieTile({super.key, required this.movie});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final releaseDate = DateTime.parse(movie.releaseDate!);
    final favoritesNotifer = ref.read(favoritesNotifierProvider.notifier);
    final inFavorites = ref.watch(favoritesNotifierProvider).maybeWhen(
          orElse: () => false,
          data: (favorites) {
            return favorites?.movies.any((element) => element.id == movie.id) ??
                false;
          },
        );

    return ListTile(
        leading: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          child: Image.network(
              "https://image.tmdb.org/t/p/w500/${movie.posterPath!}"),
        ),
        trailing: IconButton(
          onPressed: () => inFavorites
              ? favoritesNotifer.removeFromFavorites(movie.id!)
              : favoritesNotifer.addToFavorites(movie),
          icon: inFavorites
              ? const Icon(
                  CupertinoIcons.heart_fill,
                  color: Colors.purpleAccent,
                )
              : const Icon(CupertinoIcons.heart),
        ),
        title: Text(movie.title!),
        subtitle:
            Text('${releaseDate.day}.${releaseDate.month}.${releaseDate.year}'),
        onTap: () => Beamer.of(context, root: true).beamToNamed(
              '${MoviePage.routeName}&id=${movie.id}',
              data: movie,
            ));
  }
}
