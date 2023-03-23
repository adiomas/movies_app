import 'package:beamer/beamer.dart';
import 'package:movies_app/features/home/home_location.dart';
import 'package:movies_app/features/home/presentation/pages/home_page.dart';
import 'package:movies_app/features/favorites/presentation/pages/favorites_page.dart';
import 'package:movies_app/features/favorites/favorites_location.dart';

List<BeamerDelegate> listOfBeamerDelegates() => [
      BeamerDelegate(
          initialPath: HomePage.routeName,
          transitionDelegate: const NoAnimationTransitionDelegate(),
          locationBuilder: BeamerLocationBuilder(beamLocations: [
            HomeLocation(),
          ])),
      BeamerDelegate(
          initialPath: FavoritesPage.routeName,
          transitionDelegate: const NoAnimationTransitionDelegate(),
          locationBuilder:
              BeamerLocationBuilder(beamLocations: [FavoritesLocation()])),
    ];
