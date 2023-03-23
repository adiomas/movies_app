import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/features/favorites/presentation/pages/favorites_page.dart';

class FavoritesLocation extends BeamLocation<BeamState> {
  FavoritesLocation() : super();

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        const BeamPage(
          key: ValueKey('favorites'),
          title: 'Favorite',
          child: FavoritesPage(),
        ),
      ];

  @override
  List<String> get pathPatterns => ['/favorites'];
}
