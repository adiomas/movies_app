import 'package:beamer/beamer.dart';
import 'package:movies_app/features/bottom_navbar/bottom_navbar_location.dart';
import 'package:movies_app/features/home/movie_location.dart';
import 'package:movies_app/features/home/presentation/pages/home_page.dart';

final routerDelegate = BeamerDelegate(
  initialPath: '/home',
  locationBuilder: (routeInformation, _) {
    if (routeInformation.location!.contains('home') ||
        routeInformation.location!.contains('favorites')) {
      return BottomNavbarLocation();
    } else if (routeInformation.location!.contains('movie')) {
      return MovieLocation();
    } else {
      return NotFound();
    }
  },
  notFoundRedirectNamed: HomePage.routeName,
  // BeamerLocationBuilder(beamLocations: [
  //   BottomNavbarLocation(),
  //   MovieLocation(),
  // ])
);
