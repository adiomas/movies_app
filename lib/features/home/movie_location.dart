import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/common/domain/entities/movie.dart';
import 'package:movies_app/features/home/presentation/pages/movie_page.dart';

class MovieLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final movie = Beamer.of(context).currentBeamLocation.data as Movie;

    return [
      BeamPage(
        key: const ValueKey('movie'),
        title: 'Movie',
        child: MoviePage(
          movie: movie,
        ),
      ),
    ];
  }

  @override
  List<String> get pathPatterns => ['/movie*'];
}
